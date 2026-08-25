using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class Orders : System.Web.UI.Page
    {
        string ConnectionString =
        ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        void LoadOrders()
        {
            int userID =
            Convert.ToInt32(Session["UserID"]);

            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlquery = " SELECT  " +
                             "o.OrderID,o.OrderDate, p.ProductName,i.Quantity, " +
                             "(i.Price * i.Quantity) AS Total,o.Status " +
                              "FROM  Order_t as o " +
                              "INNER JOIN OrderItems_t i ON o.OrderID = i.OrderID " +
                              "INNER JOIN Products_t p ON i.ProductID = p.ProductID " +
                               "WHERE o.UserID = @uid " +
                               "ORDER BY o.OrderID DESC ";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlquery, connect);

            dataAdapter.SelectCommand.Parameters.AddWithValue("@uid", userID);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            gvOrders.DataSource = dataSet;

            gvOrders.DataBind();
        }
    }
}