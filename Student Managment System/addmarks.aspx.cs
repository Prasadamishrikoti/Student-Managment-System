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
    public partial class addmarks : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowGrid();
            }
            if (Session["teacher"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        void ShowGrid()
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand cmd = new SqlCommand("select * from Marks", con);
                SqlDataAdapter d = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand check = new SqlCommand("select * from Marks where student_userid='" + TextBox1.Text + "'", con);
                SqlDataAdapter sqa = new SqlDataAdapter(check);
                DataSet ds = new DataSet();
                sqa.Fill(ds);
                int i = ds.Tables[0].Rows.Count;
                float total = Convert.ToInt32(TextBox2.Text) + Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(TextBox4.Text) + Convert.ToInt32(TextBox5.Text) + Convert.ToInt32(TextBox6.Text);
                float percentage = ((total) / 500) * 100;
                string grade = "";

                if (percentage >= 90)
                {
                    grade = "A+";
                }
                else if (percentage >= 80 && percentage < 90)
                {
                    grade = "A-";
                }
                else if (percentage >= 70 && percentage < 80)
                {
                    grade = "B+";
                }
                else if (percentage >= 60 && percentage < 70)
                {
                    grade = "B-";
                }
                else if (percentage >= 50 && percentage < 60)
                {
                    grade = "C+";
                }
                else if (percentage >= 40 && percentage < 50)
                {
                    grade = "C-";
                }
                else if (percentage >= 35 && percentage < 39)
                {
                    grade = "D";
                }
                else
                {
                    grade = "F";
                }
                if (i > 0)
                {
                    Label1.Text = "This id already exists";
                    Label1.ForeColor = Label1.ForeColor = System.Drawing.Color.Red;
                }
                else if (TextBox1.Text == "")
                {
                    Label1.Text = "Id can not be empty";
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into Marks values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + total + "','" + percentage + "%" + "','" + grade + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully inserted');", true);
                    ShowGrid();
                    Label1.ForeColor = System.Drawing.Color.DarkGreen;
                    Label1.Text = "data inserted sucessfully";
                    //Label1.Text = "data inserted successful";
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            float total = Convert.ToInt32(TextBox2.Text) + Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(TextBox4.Text) + Convert.ToInt32(TextBox5.Text) + Convert.ToInt32(TextBox6.Text);
            float percentage = ((total) / 500) * 100;
            string grade = "";
            if (percentage >= 90)
            {
                grade = "A+";
            }
            else if (percentage >= 80 && percentage < 90)
            {
                grade = "A-";
            }
            else if (percentage >= 70 && percentage < 80)
            {
                grade = "B+";
            }
            else if (percentage >= 60 && percentage < 70)
            {
                grade = "B-";
            }
            else if (percentage >= 50 && percentage < 60)
            {
                grade = "C+";
            }
            else if (percentage >= 40 && percentage < 50)
            {
                grade = "C-";
            }
            else if (percentage >= 35 && percentage < 39)
            {
                grade = "D";
            }
            else
            {
                grade = "F";
            }

            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update marks set Student_userid='" + TextBox1.Text + "',Maths='" + TextBox2.Text + "', Science='" + TextBox3.Text + "', English='" + TextBox4.Text + "',Social_science='" + TextBox5.Text + "', Language='" + TextBox6.Text + "', Total='" + total + "',percentage='" + percentage + "%" + "',grade='" + grade + "' where student_userid ='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully updated');", true);
                ShowGrid();
                Label1.ForeColor = System.Drawing.Color.Blue;
                Label1.Text = "data Updated sucessfully";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand check = new SqlCommand("select * from marks where student_userid='" + TextBox1.Text + "'", con);
                SqlDataAdapter sqa = new SqlDataAdapter(check);
                DataSet ds = new DataSet();
                sqa.Fill(ds);
                int i = ds.Tables[0].Rows.Count;
                if (i > 0)
                {
                    SqlConnection coon = new SqlConnection("Data Source=DESKTOP-MLK0Q4B;Initial Catalog=Student Employee;Integrated Security=True");
                    coon.Open();
                    SqlCommand cmd = new SqlCommand("delete from marks where Student_userid='" + TextBox1.Text + "'", coon);
                    cmd.ExecuteNonQuery();
                    coon.Close();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully deleted');", true);
                    ShowGrid();
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "data Deleted sucessfully";
                }
                else
                {
                    Label1.Text = "Data not present";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}