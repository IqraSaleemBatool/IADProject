using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PVFC
{
    public partial class CustomerSegmentation : System.Web.UI.Page
    {
        string ConnectionString =
        ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAll();
            }
        }

        void LoadAll()
        {
            LoadSegment("SELECT " +
            "U.UserID AS [ID], " +
            "U.FullName AS [Customer Name],  " +
            "U.Address AS [City], " +
            "COUNT(O.OrderID) AS [Orders], " +
            "ISNULL(SUM(O.TotalAmount),0) AS [Total Spent]  " +

            "FROM Users_t U " +

            "LEFT JOIN Order_t O " +
            "ON U.UserID = O.UserID " +

            "WHERE U.RoleID = 3 " +

            "GROUP BY U.UserID,U.FullName,U.Address " +

            "HAVING ISNULL(SUM(O.TotalAmount),0) >= 50000 " +

            "ORDER BY [Total Spent] DESC ", gvPremium);

            LoadSegment("SELECT " +
            "U.UserID AS [ID], " +
            "U.FullName AS [Customer Name], " +
            "U.Address AS [City], " +
            "COUNT(O.OrderID) AS [Orders], " +
            "ISNULL(SUM(O.TotalAmount),0) AS [Total Spent] " +

            "FROM Users_t U " +

            "LEFT JOIN Order_t O " +
            "ON U.UserID = O.UserID " +

            "WHERE U.RoleID = 3 " +

            "GROUP BY U.UserID,U.FullName,U.Address " +

            "HAVING COUNT(O.OrderID) >= 5 " +
            "AND ISNULL(SUM(O.TotalAmount),0) < 50000 " +

            "ORDER BY [Orders] DESC ", gvFrequent);

            LoadSegment("SELECT " +
            "U.UserID AS [ID], " +
            "U.FullName AS [Customer Name], " +
            "U.Address AS [City], " +
            "COUNT(O.OrderID) AS [Orders], " +
            "ISNULL(SUM(O.TotalAmount),0) AS [Total Spent] " +

            "FROM Users_t U " +

            "LEFT JOIN Order_t O " +
            "ON U.UserID = O.UserID " +

            "WHERE U.RoleID = 3 " +

            "GROUP BY U.UserID,U.FullName,U.Address " +

            "HAVING COUNT(O.OrderID) BETWEEN 3 AND 4 ", gvRegular);

            LoadSegment("SELECT " +
            "U.UserID AS [ID], " +
            "U.FullName AS [Customer Name], " +
            "U.Address AS [City], " +
            "COUNT(O.OrderID) AS [Orders], " +
            "ISNULL(SUM(O.TotalAmount),0) AS [Total Spent] " +

            "FROM Users_t U " +

            "LEFT JOIN Order_t O " +
            "ON U.UserID = O.UserID " +

            "WHERE U.RoleID = 3 " +

            "GROUP BY U.UserID,U.FullName,U.Address " +

            "HAVING COUNT(O.OrderID) BETWEEN 1 AND 2 " +
            "AND ISNULL(SUM(O.TotalAmount),0) >= 10000 ", gvOccasional);

            LoadSegment("SELECT " +
            "U.UserID AS [ID], " +
            "U.FullName AS [Customer Name], " +
            "U.Address AS [City], " +
            "COUNT(O.OrderID) AS [Orders], " +
            "ISNULL(SUM(O.TotalAmount),0) AS [Total Spent] " +

            "FROM Users_t U " +

            "LEFT JOIN Order_t O " +
            "ON U.UserID = O.UserID " +

            "WHERE U.RoleID = 3 " +

            "GROUP BY U.UserID,U.FullName,U.Address " +

            "HAVING ISNULL(SUM(O.TotalAmount),0) < 10000 ", gvBudget);
        }

        void LoadSegment(string sqlquery,
        System.Web.UI.WebControls.GridView gv)
        {
            SqlConnection connect = new SqlConnection(ConnectionString);

            SqlDataAdapter dataAdapter =
            new SqlDataAdapter(sqlquery, connect);

            DataTable dataTable = new DataTable();

            dataAdapter.Fill(dataTable);

            gv.DataSource = dataTable;
            gv.DataBind();
        }

        void ShowMessage(
        System.Web.UI.WebControls.GridView gv,
        System.Web.UI.WebControls.Label lbl,
        string message)
        {
            lbl.Text =
            message + " (" + gv.Rows.Count +
            " customers)";
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadAll();
        }

        protected void btnPremium_Click(object sender, EventArgs e)
        {
            ShowMessage(gvPremium,
            lblPremium,
            "Discount has been Sent To Premium Customers");
        }

        protected void btnFrequent_Click(object sender, EventArgs e)
        {
            ShowMessage(gvFrequent,
            lblFrequent,
            "Rewards has been Sent To Frequent Customers");
        }

        protected void btnRegular_Click(object sender, EventArgs e)
        {
            ShowMessage(gvRegular,
            lblRegular,
            "Special Offers has been Sent");
        }

        protected void btnOccasional_Click(object sender, EventArgs e)
        {
            ShowMessage(gvOccasional,
            lblOccasional,
            "Reminder Offers has been  Sent");
        }

        protected void btnBudget_Click(object sender, EventArgs e)
        {
            ShowMessage(gvBudget,
            lblBudget,
            "Budget Deals has been Sent");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}