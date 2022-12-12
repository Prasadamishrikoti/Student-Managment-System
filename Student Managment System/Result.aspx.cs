using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Student_Managment_System
{
    public partial class Result : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                SqlCommand cmd1 = new SqlCommand("select user_id,username,password,Role from [user] where user_id=@id", con1);
                cmd1.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = Convert.ToInt32(Session["user"]);
                con1.Open();
                SqlDataReader sda = cmd1.ExecuteReader();
                while (sda.Read())
                {
                    Label1.Text = sda.GetValue(1).ToString();
                    Label2.Text = sda.GetValue(3).ToString();
                    Label3.Text = (string)Session["user"];
                }

                //Label1.Text = (string)Session["user"];
                if (Session["user"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                con1.Close();
            }


            using (SqlConnection coon = new SqlConnection(connection))
            {
                SqlCommand cmd2 = new SqlCommand("select marks_id,maths ,science,english,social_science,language,total,percentage,grade from Marks where user_id=@userid", coon);
                cmd2.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = Convert.ToInt32(Session["user"]);
                coon.Open();
                SqlDataAdapter sdz = new SqlDataAdapter(cmd2);
                DataTable dt = new DataTable();
                sdz.Fill(dt);

                if (dt.Rows.Count > 0)
                {

                    SqlDataReader sda1 = cmd2.ExecuteReader();
                    while (sda1.Read())
                    {
                        Label4.Text = sda1.GetValue(8).ToString();
                        Label4.ForeColor = System.Drawing.Color.Blue;
                        Label5.Text = sda1.GetValue(1).ToString();
                        Label6.Text = sda1.GetValue(2).ToString();
                        Label7.Text = sda1.GetValue(3).ToString();
                        Label8.Text = sda1.GetValue(4).ToString();
                        Label9.Text = sda1.GetValue(5).ToString();
                        Label10.Text = sda1.GetValue(6).ToString();
                        Label10.ForeColor = System.Drawing.Color.Blue;
                        Label11.Text = sda1.GetValue(7).ToString();
                        Label11.ForeColor = System.Drawing.Color.Red;
                    }
                    coon.Close();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "document.getElementById('tbl2').style.display = 'none';", true);
                    Label12.Text = "Your Result is not yet released";
                }
            }

        }
    }
}