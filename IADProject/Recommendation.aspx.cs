using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;

namespace PVFC
{
    public partial class Recommendation : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["PVFCConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "application/json";

            List<int> recommendations = new List<int>();

            try
            {
                int ProductID = 0;

                if (!string.IsNullOrEmpty(Request.QueryString["pid"]))
                {
                    ProductID = Convert.ToInt32(Request.QueryString["pid"]);
                }

                using (SqlConnection Connect = new SqlConnection(ConnectionString))
                {
                    Connect.Open();

                    string sqlQuery = "SELECT TOP 5 O2.ProductID " +
                    "FROM OrderItems_t O1 " +
                    "INNER JOIN OrderItems_t O2 " +
                    "ON O1.OrderID = O2.OrderID " +
                    "WHERE O1.ProductID = @pid " +
                    "AND O2.ProductID <> @pid " +
                    "GROUP BY O2.ProductID " +
                    "ORDER BY COUNT(*) DESC";

                    SqlCommand command = new SqlCommand(sqlQuery, Connect);
                    command.Parameters.AddWithValue("@pid", ProductID);

                    SqlDataReader dataReader = command.ExecuteReader();

                    while (dataReader.Read())
                    {
                        recommendations.Add(Convert.ToInt32(dataReader["ProductID"]));
                    }

                    dataReader.Close();

                    
                    if (recommendations.Count == 0)
                    {
                        string fallback = "SELECT TOP 5 ProductID " +
                        "FROM Products_t " +
                        "WHERE CategoryID = " +
                        "(SELECT CategoryID FROM Products_t WHERE ProductID=@pid) " +
                        "AND ProductID<>@pid";

                        SqlCommand command2 = new SqlCommand(fallback, Connect);
                        command2.Parameters.AddWithValue("@pid", ProductID);

                        SqlDataReader dataReader2 = command2.ExecuteReader();

                        while (dataReader2.Read())
                        {
                            recommendations.Add(Convert.ToInt32(dataReader2["ProductID"]));
                        }

                        dataReader2.Close();
                    }
                }
            }
            catch
            {
                // safe fail
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Response.Write(js.Serialize(recommendations));
            Response.End();
        }
    }
}