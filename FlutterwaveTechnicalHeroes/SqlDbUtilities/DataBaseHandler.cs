using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FlutterwaveTechnicalHeroes.SqlDbUtilities
{
    public static class DataBaseHandler
    {
        /// <summary> Returns the results of a SQL Query in the form of a DataTable </summary>
        public static DataTable SqlSelect(SqlCommand cmdSqlQuery)
        {
            //Get connection string
            var conConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlDatabaseConnection = new SqlConnection(conConnectionString);

            //Perform Command
            cmdSqlQuery.Connection = sqlDatabaseConnection;
            var dsPageInfo = new DataSet();
            var daPageInfo = new SqlDataAdapter(cmdSqlQuery);
            sqlDatabaseConnection.Open();
            daPageInfo.Fill(dsPageInfo);
            sqlDatabaseConnection.Close();
            return dsPageInfo.Tables[0];
        }
        public static DataSet SqlSelectDataSet(SqlCommand cmdSqlQuery)
        {
            //Get connection string
            var conConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlDatabaseConnection = new SqlConnection(conConnectionString);

            //Perform Command
            cmdSqlQuery.Connection = sqlDatabaseConnection;
            var dsPageInfo = new DataSet();
            var daPageInfo = new SqlDataAdapter(cmdSqlQuery);
            sqlDatabaseConnection.Open();
            daPageInfo.Fill(dsPageInfo);
            sqlDatabaseConnection.Close();
            return dsPageInfo;
        }
        /// <summary> Executes a SQL Command </summary>
        public static int ExecuteSqlCommand(SqlCommand commandToExecute)
        {
            //get connection sring
            var conConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlDatabaseConnection = new SqlConnection(conConnectionString);

            //execute command
            commandToExecute.Connection = sqlDatabaseConnection;
            sqlDatabaseConnection.Open();
            var result = commandToExecute.ExecuteNonQuery();
            sqlDatabaseConnection.Close();
            return result;

        }
        public static void ExecuteSqlCommands(SqlCommand commandToExecute)
        {
            //get connection sring
            var conConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlDatabaseConnection = new SqlConnection(conConnectionString);

            //execute command
            commandToExecute.Connection = sqlDatabaseConnection;
            sqlDatabaseConnection.Open();
            var result = commandToExecute.ExecuteNonQuery();
            sqlDatabaseConnection.Close();

        }
    }
}