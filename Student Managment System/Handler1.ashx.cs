using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Student_Managment_System
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {
        string connectionString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        public void ProcessRequest(HttpContext context)
        {
            
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}