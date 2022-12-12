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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(connection))
            {
                SqlCommand cmd1 = new SqlCommand("select Admin_id,Name,Address,User_id from Admin where user_id=@id", con1);
                cmd1.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = Convert.ToInt32(Session["user"]);
                con1.Open();
                SqlDataReader sda = cmd1.ExecuteReader();
                while (sda.Read())
                {
                    Label1.Text = sda.GetValue(1).ToString();
                    Label2.Text = sda.GetValue(2).ToString();
                    
                }

                //Label1.Text = (string)Session["user"];
                if (Session["user"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}
