using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SignalRChat.Common
{
    public class DatabaseHandlerClass
    {
        string connectionstring, query = null;
        DatabaseHandlerClass()
        {
            connectionstring= ConfigurationManager.ConnectionStrings["ConnectToPatientPortal"].ConnectionString;
        }
        public void insert(string qry)
        {
            this.query = qry;
        
        }
    }
}