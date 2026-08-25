using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class ManageProducts : System.Web.UI.Page
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

        void LoadProducts()
        {
            SqlConnection connect = new SqlConnection(ConnectionString);

            string loadQuery = @"SELECT 
                                   ProductID,ProductName,Price,StockQuantity,
                                 CASE 
                                      WHEN IsActive = 1 THEN 'Active'
                                                      ELSE 'Inactive'
                                 END AS IsActive
                               FROM Products_t";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(loadQuery, connect);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            gvProducts.DataSource = dataSet;
            gvProducts.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlquery =
            "INSERT INTO Products_t " +
            "(CategoryID, ProductName, Price, StockQuantity) " +

            "VALUES " +
            "(1, @name, @price, @stock)"; 

            SqlCommand command = new SqlCommand(sqlquery, connect);

            command.Parameters.AddWithValue("@name", txtName.Text);
            command.Parameters.AddWithValue("@price", txtPrice.Text);
            command.Parameters.AddWithValue("@stock", txtStock.Text);

            connect.Open();
            command.ExecuteNonQuery();
            connect.Close();

            LoadProducts();
        }

        protected void gvProducts_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs ex)
        {
            int index = Convert.ToInt32(ex.CommandArgument);
            int ID = Convert.ToInt32(gvProducts.DataKeys[index].Value);

            SqlConnection connect = new SqlConnection(ConnectionString);

            if (ex.CommandName == "Deactivate")
            {
                string qqery = "UPDATE Products_t SET IsActive=0 WHERE ProductID=@id";

                SqlCommand command2 = new SqlCommand(qqery, connect);
                command2.Parameters.AddWithValue("@id", ID);

                connect.Open();
                command2.ExecuteNonQuery();
                connect.Close();
            }

            if (ex.CommandName == "Activate")
            {
                string Query = "UPDATE Products_t SET IsActive=1 WHERE ProductID=@id";

                SqlCommand command3 = new SqlCommand(Query, connect);
                command3.Parameters.AddWithValue("@id", ID);

                connect.Open();
                command3.ExecuteNonQuery();
                connect.Close();
            }

            LoadProducts();
        }
    }
}