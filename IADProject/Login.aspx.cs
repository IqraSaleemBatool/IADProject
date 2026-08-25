using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
           
        string ConnectionString = ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

            SqlConnection connect= new SqlConnection(ConnectionString);

            string ssqlQuery = "SELECT Users_t.UserID, " +
                                    "Users_t.FullName, " +
                                    "Roles_t.RoleName " +
                             "FROM Users_t " +
                             "INNER JOIN Roles_t " +
                             "ON Users_t.RoleID = Roles_t.RoleID " +
                             "WHERE Email=@Email " +
                             "AND Password=@Password  " +
                             "AND IsActive = 1";

            SqlCommand command = new SqlCommand(ssqlQuery, connect);

            command.Parameters.AddWithValue("@Email", txtEmail.Text);
            command.Parameters.AddWithValue("@Password", txtPassword.Text);

            connect.Open();

            SqlDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                Session["UserID"] = dataReader["UserID"].ToString();
                Session["FullName"] = dataReader["FullName"].ToString();
                Session["Role"] = dataReader["RoleName"].ToString();

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Login!";
            }

            connect.Close();
        }
    }
}