using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FlutterwaveTechnicalHeroes.SqlDbUtilities
{
    public class DbConnection
    {
        public static SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);

        public static void CheckConnection()
        {
            if (DbConnection._con.State == ConnectionState.Open)
            {
                DbConnection._con.Close();
            }
        }
    }
}