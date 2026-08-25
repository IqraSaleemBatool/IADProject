using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PVFC
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        string ConnectionString =
        ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        void LoadUsers()
        {
            SqlConnection connect = new SqlConnection(ConnectionString);

            string sqlquery =
            "SELECT U.UserID,U.FullName, U.Email,U.Phone,R.RoleName, U.IsActive " +

              "FROM Users_t as U " +

              "INNER JOIN Roles_t as R " +
              "ON U.RoleID = R.RoleID"; 

            SqlDataAdapter dataAdapter =
            new SqlDataAdapter(sqlquery, connect);

            DataSet dataSet = new DataSet();

            dataAdapter.Fill(dataSet);

            gvUsers.DataSource = dataSet;

            gvUsers.DataBind();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(gvUsers.DataKeys[index].Value);

            SqlConnection connect = new SqlConnection(ConnectionString);

            if (e.CommandName == "Deactivate")
            {
                string query = "UPDATE Users_t SET IsActive=0 WHERE UserID=@id";
                SqlCommand command = new SqlCommand(query, connect);
                command.Parameters.AddWithValue("@id", id);

                connect.Open(); 
                command.ExecuteNonQuery(); 
                connect.Close();
            }

            if (e.CommandName == "Activate")
            {
                string sqlQuery = "UPDATE Users_t SET IsActive=1 WHERE UserID=@id";
                SqlCommand command2 = new SqlCommand(sqlQuery, connect);
                command2.Parameters.AddWithValue("@id", id);

                connect.Open(); 
                command2.ExecuteNonQuery(); 
                connect.Close();
            }

            LoadUsers();
        }
    }
}