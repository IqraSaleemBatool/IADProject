using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

namespace PVFC
{
    public partial class Cart : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;
        double total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["order"] == "success")
                {
                    lblMessage.Text = "Order's placed successfully!";
                }

                LoadCart();
                LoadRecommendations();
            }
        }

        void LoadCart()
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection connect = new SqlConnection(ConnectionString))
            {
                string Cartquery = "SELECT " +
                    "Products_t.ProductName, " +
                    "Products_t.Price, " +
                    "Cart_t.Quantity, " +
                    "(Products_t.Price * Cart_t.Quantity) AS Total " +
                  "FROM Cart_t " +
                  "INNER JOIN Products_t " +
                  " ON Cart_t.ProductID = Products_t.ProductID " +
                  "WHERE Cart_t.UserID=@uid";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(Cartquery, connect);
                dataAdapter.SelectCommand.Parameters.AddWithValue("@uid", userID);

                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                gvCart.DataSource = dataTable;
                gvCart.DataBind();

                total = 0;

                foreach (DataRow row in dataTable.Rows)
                {
                    total += Convert.ToDouble(row["Total"]);
                }

                lblTotal.Text = "Total Amount is: Rs. " + total;

                if (dataTable.Rows.Count == 0)
                {
                    gvCart.Visible = false;
                    lblTotal.Text = "";

                    if (lblMessage.Text == "")
                        lblMessage.Text = "Your cart is empty. Continue shopping!";
                }
                else
                {
                    gvCart.Visible = true;
                }
            }
        }

        void LoadRecommendations()
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection connect = new SqlConnection(ConnectionString))
            {
                string cartQuery = "SELECT TOP 1 ProductID "+
                                     "FROM Cart_t "+
                                     "WHERE UserID=@uid";

                SqlCommand command = new SqlCommand(cartQuery, connect);
                command.Parameters.AddWithValue("@uid", userID);

                connect.Open();
                object result = command.ExecuteScalar();
                connect.Close();

                if (result == null)
                {
                    gvRecommendation.DataSource = null;
                    gvRecommendation.DataBind();
                    return;
                }

                int productID = Convert.ToInt32(result);

                List<int> recIDs = GetRecommendations(productID);

                if (recIDs == null || recIDs.Count == 0)
                {
                    gvRecommendation.DataSource = null;
                    gvRecommendation.DataBind();
                    return;
                }

                string ids = string.Join(",", recIDs.Distinct());

                string query = "SELECT " +
                    "Products_t.ProductName, " +
                    "Products_t.Price, "+
                    "Categories_t.CategoryName "+
                  " FROM Products_t "+
                  "INNER JOIN Categories_t "+
                  "ON Products_t.CategoryID = Categories_t.CategoryID "+
                  "WHERE ProductID IN (" + ids + ")";

                SqlDataAdapter dataAdapter2 = new SqlDataAdapter(query, connect);

                DataTable dataTable2 = new DataTable();
                dataAdapter2.Fill(dataTable2);

                gvRecommendation.DataSource = dataTable2;
                gvRecommendation.DataBind();
            }
        }

        public List<int> GetRecommendations(int productID)
        {
            List<int> recs = new List<int>();

            try
            {
                string url = "http://www.iqrawebsite.somee.com/IADProject/Recommendation.aspx?pid=1" + productID;

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                req.Method = "GET";
                req.Timeout = 5000;

                ServicePointManager.ServerCertificateValidationCallback =
                (sender, cert, chain, sslPolicyErrors) => true;

                using (HttpWebResponse res = (HttpWebResponse)req.GetResponse())
                using (StreamReader reader = new StreamReader(res.GetResponseStream()))
                {
                    string json = reader.ReadToEnd();

                    if (!string.IsNullOrEmpty(json))
                    {
                        recs = JsonConvert.DeserializeObject<List<int>>(json);
                    }
                }
            }
            catch
            {
                recs = new List<int>();
            }

            return recs;
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection connect = new SqlConnection(ConnectionString))
            {
                connect.Open();

                try
                {
                    total = 0;

                    string cartQuery = "SELECT "+
                        "Cart_t.ProductID,  "+
                        "Cart_t.Quantity, "+
                        "Products_t.Price  "+
                      "FROM Cart_t "+
                      "INNER JOIN Products_t "+
                      "ON Cart_t.ProductID = Products_t.ProductID "+
                      "WHERE Cart_t.UserID=@uid "; 

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(cartQuery, connect);
                    dataAdapter.SelectCommand.Parameters.AddWithValue("@uid", userID);

                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    if (dataTable.Rows.Count == 0)
                    {
                        lblMessage.Text = "Cart is empty!";
                        return;
                    }

                    foreach (DataRow row in dataTable.Rows)
                    {
                        total += Convert.ToDouble(row["Price"]) *
                                 Convert.ToDouble(row["Quantity"]);
                    }

                    string status = ddlPayment.SelectedValue == "Cash On Delivery"
                        ? "Pending"
                        : "Completed";

                    string orderQuery = "INSERT INTO Order_t "+
                    "(UserID, TotalAmount, Status, PaymentMethod)"+
                    "VALUES (@uid, @total, @status, @payment); "+
                    "SELECT SCOPE_IDENTITY();";

                    SqlCommand orderCmd = new SqlCommand(orderQuery, connect);
                    orderCmd.Parameters.AddWithValue("@uid", userID);
                    orderCmd.Parameters.AddWithValue("@total", total);
                    orderCmd.Parameters.AddWithValue("@status", status);
                    orderCmd.Parameters.AddWithValue("@payment", ddlPayment.SelectedValue);

                    int orderID = Convert.ToInt32(orderCmd.ExecuteScalar());

                    foreach (DataRow row in dataTable.Rows)
                    {
                        string itemQuery = "INSERT INTO OrderItems_t "+
                        " (OrderID, ProductID, Quantity, Price) "+
                        "VALUES (@oid, @pid, @qty, @price)";

                        SqlCommand itemCmd = new SqlCommand(itemQuery, connect);
                        itemCmd.Parameters.AddWithValue("@oid", orderID);
                        itemCmd.Parameters.AddWithValue("@pid", row["ProductID"]);
                        itemCmd.Parameters.AddWithValue("@qty", row["Quantity"]);
                        itemCmd.Parameters.AddWithValue("@price", row["Price"]);
                        itemCmd.ExecuteNonQuery();
                    }

                    string deleteQuery = "DELETE FROM Cart_t " +
                                        " WHERE UserID=@uid ";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, connect);
                    deleteCmd.Parameters.AddWithValue("@uid", userID);
                    deleteCmd.ExecuteNonQuery();

                    Response.Redirect("Cart.aspx?order=success");
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                }
            }
        }
    }
}