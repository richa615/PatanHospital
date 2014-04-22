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
    public partial class RegisterDoctor2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
              Label2.Visible = false;
              Label3.Visible = false;
              Label3.Text = "" + Session["email"];  

           
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

        private void Send_Email()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            SqlCommand cmd = new SqlCommand("update DoctorCrediantials set password=@password where SSN=" + Session["ssn"], sqlConnection);
            cmd.CommandType = CommandType.Text;
            string password = CreateRandomPassword(10);
            cmd.Parameters.AddWithValue("@password", password);
            sqlConnection.Open();
            cmd.ExecuteNonQuery();
            SendEmail(Label3.Text, "Patan Hospital Login Password", "Welcome to PatanHospital. Your passowrd to login is:" + password);
            sqlConnection.Close();
        }

        public void Insert_data()
        {
            
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

           
            string Query2 = "Update DoctorCrediantials SET Education = '" + TextBox1.Text + "', Residency ='" + TextBox2.Text + "', DateOfGraduation ='" + TextBox3.Text + "',  Speciality = '" + DropDownList1.SelectedValue + "', NPI = '" + TextBox4.Text + "' where SSN=" + Session["ssn"]+ ";";
            SqlCommand cmd2 = new SqlCommand(Query2, sqlConnection);
            cmd2.ExecuteNonQuery();




        }

        private void Check_NPI()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd2 = new SqlCommand("select * from DoctorCrediantials where NPI =@npi", sqlConnection);
           
            cmd2.Parameters.AddWithValue("@npi", TextBox4.Text);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "DoctorCrediantials");

            if (dt.Rows.Count > 0)
            {
                Label2.Visible = true;
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "NPI is already in our database";
                TextBox4.Text = "";
                TextBox4.Style.Add("border", "solid 1px red");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Insert_data();
                Send_Email();
                Response.Redirect("RegisterDoctor.aspx");
            }
            catch (Exception ex)
            {
                Check_NPI();
                //Send_Email();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
             
             Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
             ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
             SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
             sqlConnection.Open();
             string Query1 = "Delete from DoctorAddress where DSSN ='" +Session["ssn"] + "'; ";
             SqlCommand cmd = new SqlCommand(Query1, sqlConnection);

             string Query2 = "Delete from DoctorCrediantials where SSN ='" +Session["ssn"] + "'; ";
             SqlCommand cmd1 = new SqlCommand(Query2, sqlConnection);

             cmd.ExecuteNonQuery();
             cmd1.ExecuteNonQuery();
             sqlConnection.Close();
             Response.Redirect("RegisterDoctor.aspx");
             
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}