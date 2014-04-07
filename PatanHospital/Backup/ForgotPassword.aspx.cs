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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
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

        public void Check_Value()
        {
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("Select password from DoctorCrediantials where email = @email",sqlConnection);
            cmd.Parameters.AddWithValue("@email", TextBox1.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "DoctorCrediantials");
            if (dt.Rows.Count > 0)
            {
               //Label1.Visible = true;
               Label2.Text = ds.Tables["DoctorCrediantials"].Rows[0]["password"].ToString();
               SendEmail (TextBox1.Text, "Patan Hospital Password", " Your passowrd to login is:" + Label2.Text);
               Label1.Visible = true;
               Label1.ForeColor = System.Drawing.Color.Green;
               Label1.Text = "Please check your email for the password rrayamajhi@luc.edu";
               TextBox1.Text = "";
            }

            else if (dt.Rows.Count == 0)
            {
                SqlCommand cmd1 = new SqlCommand("Select password from PatientCredientials where email = @email", sqlConnection);
                cmd1.Parameters.AddWithValue("@email", TextBox1.Text);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataSet ds1 = new DataSet();
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                da1.Fill(ds1, "PatientCredientials");
                if (dt1.Rows.Count > 0)
                {
                    Label2.Text = ds1.Tables["PatientCredientials"].Rows[0]["password"].ToString();
                    SendEmail(TextBox1.Text, "Patan Hospital Password", " Your passowrd to login is:" + Label2.Text);
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Please Check your email for the password richarayamajhi@gmail.com";
                    TextBox1.Text = "";
                }

                else if (dt1.Rows.Count == 0)
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Email address does not exist in our system. Please make sure you are registered";
                    TextBox1.Text = "";

                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Check_Value();
        }
    }
}