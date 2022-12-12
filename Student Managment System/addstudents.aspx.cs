using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Student_Managment_System
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(connection))
        //    {
        //        con.Open();
        //        SqlCommand check = new SqlCommand("select username from [User] where Username=@student_id", con);
        //        check.CommandType = CommandType.Text;
        //        check.Parameters.Add("@student_id", SqlDbType.VarChar, 50).Value = TextBox1.Text;
        //        SqlDataAdapter sqa = new SqlDataAdapter(check);
        //        DataSet ds = new DataSet();
        //        sqa.Fill(ds);
        //        int i = ds.Tables[0].Rows.Count;
        //        if (i > 0)
        //        {
        //            Label1.Text = "This id already exists";
        //            Label1.ForeColor = Label1.ForeColor = System.Drawing.Color.Red;
        //        }
        //        else if (TextBox1.Text == "")
        //        {
        //            Label1.Text = "Id can not be empty";
        //        }
        //        else if (TextBox2.Text == "")
        //        {
        //            Label1.Text = "Name can not be empty";
        //        }
        //        else if (TextBox3.Text == "")
        //        {
        //            Label1.Text = "Address can not be empty";
        //        }
        //        else if (TextBox4.Text == "")
        //        {
        //            Label1.Text = "Class can not be empty";
        //        }
        //        else if (TextBox5.Text == "")
        //        {
        //            Label1.Text = "Password can not be empty";
        //        }
        //        else if (TextBox6.Text == "")
        //        {
        //            Label1.Text = "DOJ can not be empty";
        //        }
        //        else
        //        {
        //            SqlCommand cmd = new SqlCommand("addstudents", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.Add("@stu_id", SqlDbType.VarChar, 50).Value = TextBox1.Text;
        //            cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = TextBox2.Text;
        //            cmd.Parameters.Add("@address", SqlDbType.VarChar, 50).Value = TextBox3.Text;
        //            cmd.Parameters.Add("@Class", SqlDbType.VarChar, 50).Value = TextBox4.Text;
        //            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = TextBox5.Text;
        //            cmd.Parameters.Add("@Doj", SqlDbType.VarChar, 50).Value = TextBox6.Text;
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully inserted');", true);
        //            ShowGrid();
        //            Label1.ForeColor = System.Drawing.Color.DarkGreen;
        //            Label1.Text = "data inserted sucessfully";

        //            Label1.Text = "data inserted successful";
        //        }
        //    }
        //}
        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(connection))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("update student set Student_userid=@Stu_id,Student_Name=@Name, Address=@Add, Class=@class,Password=@Pass, DOJ=@DOJ where student_userid =@Stu_id", con);
        //        cmd.Parameters.Add("@stu_id", SqlDbType.VarChar, 50).Value = TextBox1.Text;
        //        cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = TextBox2.Text;
        //        cmd.Parameters.Add("@Add", SqlDbType.VarChar, 50).Value = TextBox2.Text;
        //        cmd.Parameters.Add("@Class", SqlDbType.VarChar, 50).Value = TextBox4.Text;
        //        cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 50).Value = TextBox5.Text;
        //        cmd.Parameters.Add("@DOJ", SqlDbType.VarChar, 50).Value = TextBox6.Text;
        //        cmd.ExecuteNonQuery();
        //    }
        //}
        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(connection))
        //    {
        //        con.Open();
        //        SqlCommand check = new SqlCommand("select * from Student where student_userid=@stuid", con);
        //        check.Parameters.Add("@stuid", SqlDbType.VarChar, 50).Value = TextBox1.Text;
        //        SqlDataAdapter sqa = new SqlDataAdapter(check);
        //        DataSet ds = new DataSet();
        //        sqa.Fill(ds);
        //        int i = ds.Tables[0].Rows.Count;
        //        if (i > 0)
        //        {
        //            SqlCommand cmd = new SqlCommand("delete from Student where Student_userid=@studentId", con);
        //            cmd.Parameters.Add("@studentId", SqlDbType.VarChar, 50).Value = TextBox1.Text;
        //            cmd.ExecuteNonQuery();
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Are you Sure you want to delete this data');", true);
        //            ShowGrid();
        //            Label1.ForeColor = System.Drawing.Color.Red;
        //            Label1.Text = "data Deleted sucessfully";
        //        }
        //        else
        //        {
        //            Label1.Text = "Data not present";
        //            Label1.ForeColor = System.Drawing.Color.Red;
        //        }
        //    }
        //}
        //protected void Unnamed7_Click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        if (Username.Text.Trim() == "")
        //        {
        //            //Username.CssClass = Username.CssClass+" border";
        //            Username.BorderColor = System.Drawing.Color.Red;
        //            Username_span.InnerText = "This is required";
        //        }
        //        else
        //        {
        //            Username.BorderColor = System.Drawing.Color.Gray;
        //            Username_span.InnerText = "";
        //        }
        //        if (Name.Text.Trim() == "")
        //        {
        //            //Username.CssClass = Username.CssClass+" border";
        //            Name.BorderColor = System.Drawing.Color.Red;
        //            Name_span.InnerText = "This is required";
        //        }
        //        else
        //        {
        //            Name.BorderColor = System.Drawing.Color.Gray;
        //            Name_span.InnerText = "";
        //        }
        //        if (Address.Text.Trim() == "")
        //        {
        //            //Username.CssClass = Username.CssClass+" border";
        //            Address.BorderColor = System.Drawing.Color.Red;
        //            Address_span.InnerText = "This is required";
        //        }
        //        else
        //        {
        //            Address.BorderColor = System.Drawing.Color.Gray;
        //            Address_span.InnerText = "";
        //        }
        //        if (Class.Text.Trim() == "")
        //        {
        //            //Username.CssClass = Username.CssClass+" border";
        //            Class.BorderColor = System.Drawing.Color.Red;
        //            Class_span.InnerText = "This is required";
        //        }
        //        else
        //        {
        //            Class.BorderColor = System.Drawing.Color.Gray;
        //            Class_span.InnerText = "";
        //        }
        //        if (Set_Password.Text.Trim() == "")
        //        {
        //            //Username.CssClass = Username.CssClass+" border";
        //            Set_Password.BorderColor = System.Drawing.Color.Red;
        //            Set_Password_span.InnerText = "This is required";
        //        }
        //        else
        //        {
        //            Set_Password.BorderColor = System.Drawing.Color.Gray;
        //            Set_Password_span.InnerText = "";
        //        }
        //        if (DOJ.Text.Trim() == "")
        //        {
        //            //Username.CssClass = Username.CssClass+" border";
        //            DOJ.BorderColor = System.Drawing.Color.Red;
        //            DOJ_span.InnerText = "This is required";
        //        }
        //        else
        //        {
        //            DOJ.BorderColor = System.Drawing.Color.Gray;
        //            DOJ_span.InnerText = "";
        //        }
        //        //using (SqlConnection con = new SqlConnection(connection))
        //        //{
        //        //    con.Open();
        //        //    SqlCommand cmd = new SqlCommand("addstudents", con);
        //        //    cmd.CommandType = CommandType.StoredProcedure;
        //        //    cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = Username.Text;
        //        //    cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = Set_Password.Text;
        //        //    cmd.Parameters.Add("@Class", SqlDbType.VarChar, 50).Value = Class.Text;
        //        //    //cmd.Parameters.Add("@Role", SqlDbType.VarChar, 50).Value=;
        //        //    cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = Name.Text;
        //        //    cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = Address.Text;
        //        //    cmd.Parameters.Add("@Doj", SqlDbType.Date).Value = DateTime.ParseExact(DOJ.Text, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
        //        //    cmd.ExecuteNonQuery();
        //        //    Label2.Text = "Data Inserted Successfully";
        //        //    con.Close();
        //        //    Username.Text = "";
        //        //    Set_Password.Text = "";
        //        //    Class.Text = "";
        //        //    Name.Text = "";
        //        //    Address.Text = "";
        //        //    DOJ.Text = "";
        //        //}
        //    }
        //    catch
        //    {
        //        Console.WriteLine("Some Error");
        //    }
        //}
        //protected void show_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "document.getElementById('details').style.display = 'block';", true);
        //}

        [System.Web.Services.WebMethod]
        public static void Addstudent(student stu)
        {
            try
            {
                //HttpPostedFile postedFile = fileupload.PostedFile;
                //HttpPostedFile file = Request.Files["filebtn"];
                //string value = System.IO.Path.GetFileName(file.FileName).ToString();
                //int filelenght = fileupload.PostedFile.ContentLength;
                //byte[] imagebytes = new byte[filelenght];
                string date = DateTime.Now.ToString("dd/MMM/yyyy hh:mm tt");
                string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand("addstudents", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = stu.Username;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = stu.Password;
                    cmd.Parameters.Add("@Class", SqlDbType.VarChar, 50).Value = stu.Class;
                    //cmd.Parameters.Add("@Role", SqlDbType.VarChar, 50).Value=;
                    cmd.Parameters.Add("@creation_date", SqlDbType.NVarChar, 50).Value = date;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = stu.name;
                    cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = stu.address;
                    cmd.Parameters.Add("@imagedata", SqlDbType.VarChar).Value = stu.image;
                    cmd.Parameters.Add("@Doj", SqlDbType.Date).Value = DateTime.ParseExact(stu.DOJ, "dd-MMM-yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine("Some Error");
            }
        }
        [System.Web.Services.WebMethod]
        public static void deletestudent(int Student_Userid)
        {
            try
            { 
            string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    con.Open();
                    //SqlCommand cmd = new SqlCommand("delete from student where Student_Userid=@stuid update [User] set status='Inactive' where User_id=(select User_id from Student where Student_Userid=@stuid)", con);
                    SqlCommand cmd = new SqlCommand("deletestudent", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@stuid", SqlDbType.Int).Value = Student_Userid;
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch
            {
                Console.WriteLine("Some Error");
            }
        }
        [System.Web.Services.WebMethod]
        public static void Activatedata(int Student_Userid)
        {
            try
                { 
            string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    con.Open();
                    //SqlCommand cmd = new SqlCommand("delete from student where Student_Userid=@stuid update [User] set status='Inactive' where User_id=(select User_id from Student where Student_Userid=@stuid)", con);
                    SqlCommand cmd = new SqlCommand("activatestudent", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@stuid", SqlDbType.Int).Value = Student_Userid;
                    cmd.ExecuteNonQuery();
                    con.Close();
                }  
            }
            catch
            {
                Console.WriteLine("Some Error");
            }
        }
        [System.Web.Services.WebMethod]
        public static void Deletemultiple(string[] id)
        {
            try
            {
                string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {

                    con.Open();
                    DataTable dt = new DataTable();
                    dt.Columns.Add("STUDENTID");
                    for (int i = 0; i < id.Length; i++)
                    {
                        DataRow dr = dt.NewRow();
                        dr["STUDENTID"] = int.Parse(id[i]);
                        dt.Rows.Add(dr);
                    }
                    SqlCommand cmd = new SqlCommand("deletemultiplestudent", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@stuid", SqlDbType.Structured).Value = dt;
                    //for (int i=0;i<id.Length;i++)
                    //{
                    //    //cmd.Parameters.Value = id[i];
                    //    int getid = int.Parse(id[i]);
                    //    cmd.Parameters["@stuid"].Value = getid;
                    //    cmd.ExecuteNonQuery();
                    //    //cmd.Parameters.AddWithValue("@stuid", Convert.ToInt32(id[i]));
                    //    //cmd.ExecuteNonQuery();
                    //}
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }
            catch
            {
                Console.WriteLine("Some Error");
            }
        }
        [System.Web.Services.WebMethod]
        public static void updatedata(student stu)
        {
            try
            {
                string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_updatestudent", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@stuid", SqlDbType.Int).Value = stu.Student_Userid;
                    cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = stu.Username;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = stu.Password;
                    cmd.Parameters.Add("@Class", SqlDbType.VarChar, 50).Value = stu.Class;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = stu.name;
                    cmd.Parameters.Add("@image", SqlDbType.VarChar).Value = stu.image;
                    cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = stu.address;
                    cmd.Parameters.Add("@Doj", SqlDbType.Date).Value = DateTime.ParseExact(stu.DOJ, "dd-MMM-yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch
            {
                Console.WriteLine("Some Error");
            }
        }

        [System.Web.Services.WebMethod]
        public static List<student> getthevalues(int Student_Userid)
        {
            try
            {
                string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                List<student> std = new List<student>();
                using (SqlConnection con = new SqlConnection(connection))
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_getvalues", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = Student_Userid;
                    SqlDataAdapter d = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    d.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        std.Add(new student
                        {
                            Username = dr["Username"].ToString(),
                            name = dr["Student_Name"].ToString(),
                            address = dr["address"].ToString(),
                            Class = dr["Class"].ToString(),
                            DOJ = dr["DOJ"].ToString(),
                            image = dr["image"].ToString(),
                            Password = dr["Password"].ToString(),
                        });
                    }
                }
                return std;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        [System.Web.Services.WebMethod]
        public static List<student> getstudentdetails(int pageno, string name,string address,string fromdate,string todate,string status)
        {
            try
            {
                string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                List<student> std = new List<student>();
                if (pageno <= 0)
                {
                    pageno = 1;
                }
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand("pagination", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Pagenumber", SqlDbType.Int).Value = pageno;
                    cmd.Parameters.Add("@Pagesize", SqlDbType.Int).Value = 10;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = name;
                    if (!string.IsNullOrEmpty(fromdate))
                    {
                        cmd.Parameters.Add("@fromdate", SqlDbType.Date).Value = DateTime.ParseExact(fromdate, "dd-MMM-yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                    }
                    if (!string.IsNullOrEmpty(todate))
                    {
                        cmd.Parameters.Add("@todate", SqlDbType.Date).Value = DateTime.ParseExact(todate, "dd-MMM-yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                    }
                    if (!string.IsNullOrEmpty(status))
                    {
                        cmd.Parameters.Add("@status", SqlDbType.VarChar, 50).Value = status;
                    }
                    int offset = ((pageno - 1) * 10) + 1;
                    cmd.Parameters.Add("@address", SqlDbType.VarChar, 50).Value = address;
                    SqlDataAdapter d = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    d.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        std.Add(new student
                        {
                            Student_Userid = dr["Student_Userid"].ToString(),
                            name = dr["Student_Name"].ToString(),
                            address = dr["address"].ToString(),
                            Class = dr["Class"].ToString(),
                            DOJ = dr["DOJ"].ToString(),
                            image = dr["image"].ToString(),
                            status = dr["status"].ToString(),
                            pageno = pageno.ToString(),
                            offset = offset.ToString(),
                            totalrows = dr["totalrows"].ToString(),
                            date = dr["creation_date"].ToString()
                        });
                    }
                }
                return std;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        [System.Web.Services.WebMethod]
        public static List<string> Autocomplete(string atocomplete)
        {
            try
            {
                List<string> auto = new List<string>();
                string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand cmd = new SqlCommand("Autocompletename", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Student_name", atocomplete);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        auto.Add(rdr["Student_name"].ToString());
                    }
                }
                return auto;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        //[System.Web.Services.WebMethod]
        //public static List<student> Filterresults(string name)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        //    List<student> filter = new List<student>();
        //    using (SqlConnection con = new SqlConnection(connection))
        //    {
        //        SqlCommand cmd = new SqlCommand("sp_Filterbyname", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = name;
        //        SqlDataAdapter d = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        d.Fill(dt);
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            filter.Add(new student
        //            {
        //                Student_Userid = dr["Student_Userid"].ToString(),
        //                name = dr["Student_Name"].ToString(),
        //                address = dr["address"].ToString(),
        //                Class = dr["Class"].ToString(),
        //                DOJ = dr["DOJ"].ToString(),
        //                //User_id= dr["User_id"].ToString(),
        //            });
        //        }
        //    }
        //    return filter;
        //}
    }
    public class student
    {
        public string name { get; set; }
        public string address { get; set; }
        public string Class { get; set; }
        public string DOJ { get; set; }
        public string Student_Userid { get; set; }
        public int User_id { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Username { get; set; }
        public string image { get; set; }
        public string status { get; set; }
        public string pageno { get; set; }
        public string offset { get; set; }
        public string totalrows { get; set; }
        public string count { get; set; }
        public string date { get; set; }

    }
}
