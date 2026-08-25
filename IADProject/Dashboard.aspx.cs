using System;

namespace PVFC
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            lblWelcome.Text =
                "Welcome " + Session["FullName"].ToString();

            string Role = Session["Role"].ToString();

            if (Role == "Admin")
            {
                pnlAdmin.Visible = true;
            }
            else if (Role == "SalesPerson")
            {
                pnlSales.Visible = true;
            }
            else if (Role == "Customer")
            {
                pnlCustomer.Visible = true;
            }
        }
    }
}