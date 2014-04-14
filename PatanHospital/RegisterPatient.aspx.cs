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
    public partial class RegisterPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        public void Insertdata()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            SqlCommand cmd = new SqlCommand("insert into PatientCredientials (Fname, Lname, SSN, Gender, Address1, Address2, City, State, ZipCode, Phone, email, password) Values( @fname, @lname, @ssn, @gender, @address1, @address2, @city, @state, @zipcode, @phone, @email, @password)", sqlConnection);
            cmd.CommandType = CommandType.Text;

            string fname    = TextBox1.Text;
            string lname    = TextBox2.Text;
            string ssn      = TextBox3.Text;
            string gender   = DropDownList1.SelectedValue;
            string address1 = TextBox5.Text;
            string address2 = TextBox6.Text;
            string city     = TextBox7.Text;
            string state    = DropDownList2.SelectedValue;
            string zipcode  = TextBox8.Text;
            string phone    = TextBox9.Text;
            string email    = TextBox10.Text;
            string password = CreateRandomPassword(10);
           
            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@ssn", ssn);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@zipcode", zipcode);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);  

            sqlConnection.Open();
            cmd.ExecuteNonQuery();
            sqlConnection.Close();
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Insertion Successful";
            SendEmail(TextBox10.Text, "Patan Hospital Login Password", "Welcome to PatanHospital. Your passowrd to login is:" + password);
            Clear_Textbox();
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

        private void SendEmail(string address, string subject, string message)
        {
            string email = "patanhospital2014@gmail.com";
            string pwd = "project2014";
            var loginInfo = new NetworkCredential(email, pwd);
            var msg = new MailMessage();
            var smtpClient = new SmtpClient("smtp.gmail.com", 587);
            msg.From = new MailAddress(email, "Patan Hospital");
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

        public void Clear_Textbox()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }


        private void CheckSSN()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd2 = new SqlCommand("select * from PatientCredientials where SSN =@ssn", sqlConnection);
            SqlCommand cmd3 = new SqlCommand("select * from PatientCredientials where email =@email", sqlConnection);

            cmd2.Parameters.AddWithValue("@ssn", TextBox3.Text);
            cmd3.Parameters.AddWithValue("@email", TextBox10.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "PatientCrediantials");

            SqlDataAdapter da1 = new SqlDataAdapter(cmd3);
            DataSet ds1 = new DataSet();
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            da1.Fill(ds1, "PatientCrediantials");

            if (dt.Rows.Count > 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "SSN already exist in our database";
                TextBox3.Text = "";
                TextBox3.Style.Add("border", "solid 1px red");
            }

            else if (dt1.Rows.Count > 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Email already exist in our database";
                TextBox10.Text = "";
                TextBox10.Style.Add("border", "solid 1px red");
            }


     
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Insertdata();
            }

            catch (Exception ex)
            {
                CheckSSN();
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}