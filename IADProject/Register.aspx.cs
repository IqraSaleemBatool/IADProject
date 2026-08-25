using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

            SqlConnection connect = new SqlConnection(ConnectionString);

            string insertQuery = "INSERT INTO Users_t " +
                            "(FullName, Email, Password, Phone, Address, RoleID) " +
                            "VALUES " +
                            "(@Name, @Email, @Password, @Phone, @Address, 3)";

            SqlCommand command = new SqlCommand(insertQuery, connect);

            command.Parameters.AddWithValue("@Name", txtName.Text);
            command.Parameters.AddWithValue("@Email", txtEmail.Text);
            command.Parameters.AddWithValue("@Password", txtPassword.Text);
            command.Parameters.AddWithValue("@Phone", txtPhone.Text);
            command.Parameters.AddWithValue("@Address", txtAddress.Text);

            connect.Open();
            command.ExecuteNonQuery();
            connect.Close();

            lblMessage.Text = "Registration Successful!";
        }
    }
}