using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Student_Managment_System
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                SqlCommand cmd1 = new SqlCommand("select username from user where username='" + (string)Session["user"] + "'", con1);
                con1.Open();
                SqlDataReader sda = cmd1.ExecuteReader();
                while (sda.Read())
                {
                    Label1.Text = sda.GetValue(1).ToString();
                    Label2.Text = sda.GetValue(2).ToString();
                    Label3.Text = (string)Session["parent"];
                }
                if (Session["parent"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}