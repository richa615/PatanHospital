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
using System.Collections;

namespace PatanHospital
{
    public partial class PatientScheduleAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Table2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label3.Text = Session["Patient_Fname"].ToString();
            Label4.Text = Session["Patient_Lname"].ToString();
            Label5.Text = Session["Patient_SSN"].ToString();
            Label2.Text = Label3.Text +' '+ Label4.Text;
            Label24.Visible = false;
            Label24.Text = Session["Patient_Email"].ToString();
            Label25.Visible = false;

            

        }

        protected void Bind_Doctor_Name_DropDown()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "Select Fname+' '+Lname as Name, SSN from Doctorcrediantials where Speciality ='" + this.DropDownList1.SelectedValue + "'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds,"DoctorCrediantials");
            
            DropDownList2.DataSource = ds;
            DropDownList2.DataTextField = "Name";
            DropDownList2.DataValueField = "SSN";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));

            sqlConnection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientHome.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
            getWhileLoopData();
        }

        public void Insert_Data(int a)
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into DoctorSchedule (P_SSN, D_SSN, Date, Start_Time, End_Time) Values( @p_ssn,@d_ssn,@date, @start_time, @end_time)", sqlConnection);
            cmd1.CommandType = CommandType.Text;

            string P_SSN = Session["Patient_SSN"].ToString();
            string Date = TextBox1.Text;
            string D_SSN = DropDownList2.SelectedValue;

            string Start_Time = "", End_Time = "";
            if (a == 2)
            {
                Start_Time = Label6.Text;
                End_Time = Label7.Text ;
            }

            else if (a == 3)
            {
                Start_Time = Label9.Text;
                End_Time = Label10.Text;
            }

            else if (a == 4)
            {
                Start_Time = Label12.Text;
                End_Time = Label13.Text;
            }

            else if (a == 5)
            {
                Start_Time = Label15.Text;
                End_Time = Label16.Text;
            }

            else if (a == 6)
            {
                Start_Time = Label18.Text;
                End_Time = Label19.Text;
            }

            else if (a == 7)
            {
                Start_Time = Label21.Text;
                End_Time = Label22.Text;
            }

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
          

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Insert_Data(2);
            SendEmail(Label24.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label6.Text + "<br />" + "End Time: " + Label7.Text);
            SendEmail(Label25.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patients Name: " + this.Label2.Text + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label6.Text + "<br />" + "End Time: " + Label7.Text);
            Response.Redirect("PatientHome.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Insert_Data(3);
            SendEmail(Label24.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label9.Text + "<br />" + "End Time: " + Label10.Text);
            SendEmail(Label25.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patients Name: " + this.Label2.Text + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label9.Text + "<br />" + "End Time: " + Label10.Text);
            Response.Redirect("PatientHome.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Insert_Data(4);
            SendEmail(Label24.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label12.Text + "<br />" + "End Time: " + Label13.Text);
            SendEmail(Label25.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patients Name: " + this.Label2.Text + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label12.Text + "<br />" + "End Time: " + Label13.Text);
            Response.Redirect("PatientHome.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Insert_Data(5);
            SendEmail(Label24.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label15.Text + "<br />" + "End Time: " + Label16.Text);
            SendEmail(Label25.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patients Name: " + this.Label2.Text + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label15.Text + "<br />" + "End Time: " + Label16.Text);
            Response.Redirect("PatientHome.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Insert_Data(6);
            SendEmail(Label24.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label18.Text + "<br />" + "End Time: " + Label19.Text);
            SendEmail(Label25.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patients Name: " + this.Label2.Text + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label18.Text + "<br />" + "End Time: " + Label19.Text);
            Response.Redirect("PatientHome.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Insert_Data(7);
            SendEmail(Label24.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label21.Text + "<br />" + "End Time: " + Label22.Text);
            SendEmail(Label25.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patients Name: " + this.Label2.Text + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label21.Text + "<br />" + "End Time: " + Label22.Text);
            Response.Redirect("PatientHome.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_Doctor_Name_DropDown();
        }

        public void getWhileLoopData()
        {

            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

             string Query2 = "Select email from DoctorCrediantials where SSN ='" + this.DropDownList2.SelectedValue + "'; ";
            SqlCommand cmd2 = new SqlCommand(Query2, sqlConnection);

            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "DoctorCrediantials");

           Label25.Text = ds2.Tables["DoctorCrediantials"].Rows[0]["email"].ToString();

            SqlCommand query = new SqlCommand("Select distinct Start_Time from DoctorSchedule where D_SSN = @d_ssn and Date= @date", sqlConnection);
            query.CommandType = CommandType.Text;

            string date = TextBox1.Text;
            string d_ssn = DropDownList2.SelectedValue;

            query.Parameters.AddWithValue("@date", date);
            query.Parameters.AddWithValue("@d_ssn", d_ssn);

            SqlDataReader reader = query.ExecuteReader();
            

            while (reader.Read())
            {

                string Start_Time = reader["Start_Time"].ToString();
                if (Start_Time == Label6.Text)
                {
                    Button2.Visible = false;
                    Label8.ForeColor = System.Drawing.Color.Red;
                    Label8.Text = "Not Available";
                }

                else if (Start_Time == Label9.Text)
                {
                    Button3.Visible = false;
                    Label11.ForeColor = System.Drawing.Color.Red;
                    Label11.Text = "Not Available";
                }

                else if (Start_Time == Label12.Text)
                {
                    Button4.Visible = false;
                    Label14.ForeColor = System.Drawing.Color.Red;
                    Label14.Text = "Not Available";
                }

                else if (Start_Time == Label15.Text)
                {
                    Button5.Visible = false;
                    Label17.ForeColor = System.Drawing.Color.Red;
                    Label17.Text = "Not Available";
                }

                else if (Start_Time == Label18.Text)
                {
                    Button6.Visible = false;
                    Label20.ForeColor = System.Drawing.Color.Red;
                    Label20.Text = "Not Available";
                }

                else if (Start_Time == Label21.Text)
                {
                    Button7.Visible = false;
                    Label23.ForeColor = System.Drawing.Color.Red;
                    Label23.Text = "Not Available";
                }
            }
            sqlConnection.Close();

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
    }
}