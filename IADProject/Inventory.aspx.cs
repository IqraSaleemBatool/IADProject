using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class Inventory : System.Web.UI.Page
    {
        string ConnectionString =
        ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs ex)
        {
            if (!IsPostBack)
            {
                LoadInventory();
            }
        }

        void LoadInventory()
        {
            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlQuery =
                "SELECT ProductID, ProductName, StockQuantity " +
                "FROM Products_t";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlQuery, connect);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            gvInventory.DataSource = dataSet;

            gvInventory.DataBind();
        }

        protected void gvInventory_RowEditing(object sender,
        System.Web.UI.WebControls.GridViewEditEventArgs ex)
        {
            gvInventory.EditIndex = ex.NewEditIndex;

            LoadInventory();
        }

        protected void gvInventory_RowCancelingEdit(object sender,
        System.Web.UI.WebControls.GridViewCancelEditEventArgs ex)
        {
            gvInventory.EditIndex = -1;

            LoadInventory();
        }

        protected void gvInventory_RowUpdating(object sender,
 System.Web.UI.WebControls.GridViewUpdateEventArgs ex)
        {
            int ID = Convert.ToInt32(
                gvInventory.Rows[ex.RowIndex].Cells[1].Text);

            string stock =
            ((System.Web.UI.WebControls.TextBox)
            gvInventory.Rows[ex.RowIndex].Cells[3].Controls[0]).Text;

            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlQuery =
                         "UPDATE Products_t SET StockQuantity=@stock " +
                         "WHERE ProductID=@id";

            SqlCommand command = new SqlCommand(sqlQuery, connect);

            command.Parameters.AddWithValue("@stock", stock);
            command.Parameters.AddWithValue("@id", ID);

            connect.Open();

            command.ExecuteNonQuery();

            connect.Close();

            gvInventory.EditIndex = -1;

            LoadInventory();
        }
    }
}