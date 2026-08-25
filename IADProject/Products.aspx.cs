using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class Products : System.Web.UI.Page
    {
        string ConnectionString =
        ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        void LoadProducts(string search = "")
        {
            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlQuery =
            "SELECT ProductID, " +
                     "ProductName,Price,StockQuantity " +
              "FROM Products_t " +
              "WHERE ProductName LIKE @search";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlQuery, connect);

            dataAdapter.SelectCommand.Parameters.AddWithValue("@search",
                "%" + search + "%");

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            gvProducts.DataSource = dataSet;

            gvProducts.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadProducts(txtSearch.Text);
        }

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            int productID =
            Convert.ToInt32(
            gvProducts.SelectedRow.Cells[1].Text);

            int userID =
            Convert.ToInt32(Session["UserID"]);

            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlquery =
            "INSERT INTO Cart_t " +
            "(UserID, ProductID, Quantity) " +

            "VALUES " +
            "(@uid, @pid, 1)";

            SqlCommand command
                = new SqlCommand(sqlquery, connect);

            command.Parameters.AddWithValue("@uid", userID);
            command.Parameters.AddWithValue("@pid", productID);

            connect.Open();
            command.ExecuteNonQuery();
            connect.Close();

            Response.Write("<script>alert('Added To Cart')</script>");
        }
    }
}