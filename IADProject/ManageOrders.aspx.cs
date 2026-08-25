using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs ex)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        void LoadOrders()
        {
            using (SqlConnection connect = new SqlConnection(ConnectionString))
            {
                string orderQuery = "SELECT * FROM Order_t";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(orderQuery, connect);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                gvOrders.DataSource = dataTable;
                gvOrders.DataBind();
            }
        }

        protected void gvOrders_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Complete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int  ID = Convert.ToInt32(gvOrders.DataKeys[index].Value);

                using (SqlConnection connect = new SqlConnection(ConnectionString))
                {
                    string sqlQuery = "UPDATE Order_t SET Status='Completed' WHERE OrderID=@id";

                    SqlCommand command = new SqlCommand(sqlQuery, connect);
                    command.Parameters.AddWithValue("@id", ID);

                    connect.Open();
                    command.ExecuteNonQuery();
                }

                LoadOrders();
            }
        }
    }
}