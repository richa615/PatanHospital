using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Xml;
using System.Data;
using System.Web.Configuration;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace PatanHospital
{
    public partial class RegisterDoctor : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
        }

        public void SendEmail(string address, string subject, string message)
        {
            string email = "edupointdotnet@gmail.com";
            string pwd = "edupoint2013";

            var loginInfo = new NetworkCredential(email, pwd);
            var msg = new MailMessage();
            var smtpClient = new SmtpClient("smtp.gmail.com", 587);

            msg.From = new MailAddress(email, "Edupoint Institute");
            msg.To.Add(new MailAddress(address));
            msg.Subject = subject;
            msg.Body = message;
            msg.IsBodyHtml = true;

            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = loginInfo;
            smtpClient.Send(msg);
        }
        
        private static string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789!@$?_-";
            char[] chars = new char[passwordLength];
            Random rd = new Random();
            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }
            return new string(chars);
        }

        private void Insert_data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            
            

                SqlCommand cmd = new SqlCommand("insert into DoctorCrediantials (Fname,Lname,SSN,Phone,Gender,email,password) Values( @fname,@lname,@ssn,@phone,@gender,@email, @password)", sqlConnection);
                cmd.CommandType = CommandType.Text;

                SqlCommand cmd1 = new SqlCommand("insert into DoctorAddress (Address1,Address2,City,State,Zipcode,DSSN) Values( @address1,@address2,@city,@state,@zipcode,@dssn)", sqlConnection);
                cmd.CommandType = CommandType.Text;
                
               

                string fname = TextBox1.Text;
                string lname = TextBox2.Text;
                string ssn   = TextBox3.Text;
                string phone = TextBox4.Text;
                string gender = DropDownList1.SelectedValue;
                string email = TextBox5.Text;
                string password = CreateRandomPassword(10);

                string address1 = TextBox6.Text;
                string address2 = TextBox7.Text;
                string city = TextBox8.Text;
                string state = DropDownList2.SelectedValue;
                string zipcode = TextBox9.Text;

                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@ssn", ssn);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);

                cmd1.Parameters.AddWithValue("@address1", address1);  
                cmd1.Parameters.AddWithValue("@address2", address2);
                cmd1.Parameters.AddWithValue("@city", city);
                cmd1.Parameters.AddWithValue("@state", state);
                cmd1.Parameters.AddWithValue("@zipcode", zipcode);
                cmd1.Parameters.AddWithValue("@dssn",ssn );
                
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                sqlConnection.Close();
           }

        private void Check_SSN()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd2 = new SqlCommand("select * from DoctorCrediantials where SSN =@ssn", sqlConnection);
            SqlCommand cmd3 = new SqlCommand("select * from DoctorCrediantials where email =@email", sqlConnection);
            
            cmd2.Parameters.AddWithValue("@ssn", TextBox3.Text);
            cmd3.Parameters.AddWithValue("@email", TextBox5.Text);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "DoctorCrediantials");

            if (dt.Rows.Count > 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "SSN already exist in our database";
                TextBox3.Text = "";
                TextBox3.Style.Add("border", "solid 1px red");
            }

            SqlDataAdapter da1 = new SqlDataAdapter(cmd3);
            DataSet ds1 = new DataSet();

            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            da1.Fill(ds1, "DoctorCrediantials");

            if (dt1.Rows.Count > 0)
            {
                Label2.Visible = true;
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "Email Address is already stored in our Database";
                TextBox5.Text = "";
                TextBox5.Style.Add("border", "solid 1px red");
            }
        }
          

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Insert_data();
                Session["ssn"] = TextBox3.Text;
                Response.Redirect("RegisterDoctor2.aspx");
            }
            catch (Exception ex)
            {
                Check_SSN();
                
            }

        }


    }
}