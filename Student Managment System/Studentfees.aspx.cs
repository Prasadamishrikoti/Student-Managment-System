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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                SqlCommand cmd1 = new SqlCommand("select * from Student where Student_userid='" + (string)Session["user"] + "'", con1);
                con1.Open();
                SqlDataReader sda = cmd1.ExecuteReader();
                while (sda.Read())
                {
                    Label1.Text = sda.GetValue(1).ToString();
                    Label2.Text = sda.GetValue(3).ToString();
                    Label3.Text = (string)Session["user"];
                }
            }

            using (SqlConnection con2 = new SqlConnection(connection))
            {
                SqlCommand cmd2 = new SqlCommand("select * from Fees where Student_id='" + (string)Session["user"] + "'", con2);
                con2.Open();
                SqlDataReader sda1 = cmd2.ExecuteReader();
                while (sda1.Read())
                {
                    Label4.Text = sda1.GetValue(2).ToString();
                    Label5.Text = sda1.GetValue(3).ToString();
                    Label6.Text = sda1.GetValue(4).ToString();
                    Label7.Text = sda1.GetValue(5).ToString();

                }

                //Label1.Text = (string)Session["user"];
                
            }
        }
    }
}