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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["username"]==null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("select Role,user_id from [User] where username=@id and password=@pass;", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = TextBox1.Text;
                cmd.Parameters.Add("@pass", SqlDbType.VarChar, 50).Value = TextBox2.Text;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["user"] = dt.Rows[0]["user_id"].ToString();
                    if (dt.Rows[0]["Role"].ToString() == "Student")
                    {
                        Response.Redirect("StudentDashboard.aspx");
                    }
                    else if (dt.Rows[0]["Role"].ToString() == "Teacher")
                    {
                        Response.Redirect("Teacher_Dashboard.aspx");
                    }
                    else if (dt.Rows[0]["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("Parent_Dashboard.aspx");
                    }
                }
                else
                {
                    Label2.Text = "Incorrect User or Password";
                    Label2.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}