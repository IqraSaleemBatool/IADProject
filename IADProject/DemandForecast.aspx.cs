using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PVFC
{
    public partial class DemandForecast : System.Web.UI.Page
    {
        string ConnectionString =
        ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs ex)
        {
            if (!IsPostBack)
            {
                LoadForecast();
            }
        }

        void LoadForecast()
        {
            SqlConnection connect =
            new SqlConnection(ConnectionString);

            string sqlquery = @"

            SELECT
            P.ProductName,
            SUM(OI.Quantity) AS TotalSold,

            CASE

            WHEN SUM(OI.Quantity) >= 12
            THEN 'High Demand'

            WHEN SUM(OI.Quantity) BETWEEN 8 AND 11
            THEN 'Medium Demand'

            WHEN SUM(OI.Quantity) BETWEEN 4 AND 7
            THEN 'Low Demand'

            ELSE 'Very Low Demand'

            END AS DemandLevel

            FROM OrderItems_t OI

            INNER JOIN Products_t P
            ON OI.ProductID = P.ProductID

            GROUP BY P.ProductName

            ORDER BY TotalSold DESC";

            SqlDataAdapter dataAdapter =
            new SqlDataAdapter(sqlquery, connect);

            DataTable dataTable =
            new DataTable();

            dataAdapter.Fill(dataTable);

            gvForecast.DataSource = dataTable;

            gvForecast.DataBind();
        }
    }
}