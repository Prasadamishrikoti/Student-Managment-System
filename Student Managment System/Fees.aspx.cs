using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Student_Managment_System
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowGrid();
            }
        }
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        void ShowGrid()
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Student_userid,Total_Fees,Paid_Fees,Paid_on,Balance from Fees", con);
                SqlDataAdapter d = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                d.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            float Balance = Convert.ToInt32(TextBox2.Text) - Convert.ToInt32(TextBox3.Text);
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into fees(Student_id,Total_Fees,Paid_Fees,Paid_on,Balacce) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',getdate(),'" + Balance + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully inserted');", true);
                ShowGrid();

                Label1.ForeColor = System.Drawing.Color.DarkGreen;
                Label1.Text = "data inserted sucessfully";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            float Balance = Convert.ToInt32(TextBox2.Text) - Convert.ToInt32(TextBox3.Text);
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update fees set Student_id='" + TextBox1.Text + "',Total_Fees='" + TextBox2.Text + "', Paid_Fees='" + TextBox3.Text + "', Paid_on=getdate(),Balacce='" + Balance + "' where student_id='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
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
                SqlCommand check = new SqlCommand("select * from Fees where student_id='" + TextBox1.Text + "'", con);
                SqlDataAdapter sqa = new SqlDataAdapter(check);
                DataSet ds = new DataSet();
                sqa.Fill(ds);
                int i = ds.Tables[0].Rows.Count;
                if (i > 0)
                {
                    SqlConnection coon = new SqlConnection("Data Source=DESKTOP-MLK0Q4B;Initial Catalog=Student Employee;Integrated Security=True");
                    coon.Open();
                    SqlCommand cmd = new SqlCommand("delete from Fees where Student_id='" + TextBox1.Text + "'", coon);
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