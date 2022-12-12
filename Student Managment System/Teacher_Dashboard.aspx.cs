using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Student_Managment_System
{
    public partial class Teacher_Dashboard : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                SqlCommand cmd1 = new SqlCommand("select * from Teacher where Teacher_id='" + (string)Session["teacher"] + "'", con1);
                con1.Open();
                SqlDataReader sda = cmd1.ExecuteReader();
                while (sda.Read())
                {
                    Label1.Text = sda.GetValue(2).ToString();
                    Label2.Text = sda.GetValue(3).ToString();
                    Label3.Text = (string)Session["teacher"];
                }
                if (Session["teacher"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Session.Abandon();
        //    Response.Redirect("Login.aspx");
        //}



        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection coon = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("select * from Student where Class='" + DropDownList1.SelectedValue + "'", coon);
                SqlDataAdapter d = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}