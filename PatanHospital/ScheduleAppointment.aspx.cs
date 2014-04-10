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
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Table2.Visible = false;
            Table3.Visible = false;
           
            if (!IsPostBack)
            {
                Bind_Speciality_DropDown();
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPatient.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Table2.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
            Bind_Doctor_Name_DropDown();
        }

        protected void Bind_Speciality_DropDown()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("select distinct Speciality from DoctorCrediantials", sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlConnection.Close();
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "Speciality";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));
            DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));
        }


        protected void get_doctor_email()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            
            SqlCommand cmd2 = new SqlCommand("Select email from DoctorCrediantials where SSN ='" + this.DropDownList2.SelectedValue + "';", sqlConnection);
            SqlCommand cmd3 = new SqlCommand("Select email from PatientCredientials where SSN = '" + this.DropDownList3.SelectedValue + "';", sqlConnection);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            SqlDataAdapter da3 = new SqlDataAdapter(cmd3);

            DataSet ds = new DataSet();
            DataSet ds3 = new DataSet();

            da.Fill(ds, "DoctorCrediantials");
            da3.Fill(ds3, "PatientCredientials");

            Label19.Text = ds.Tables["DoctorCrediantials"].Rows[0]["email"].ToString();
            Label20.Text = ds3.Tables["PatientCredientials"].Rows[0]["email"].ToString();
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
            da.Fill(ds);
            sqlConnection.Close();
            DropDownList2.DataSource = ds;
            DropDownList2.DataTextField = "Name";
            DropDownList2.DataValueField = "SSN";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));  
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
            Table3.Visible = true;
            get_doctor_email();
            getWhileLoopData();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           
        }

        public void Insert_Data(int a)
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into DoctorSchedule (P_SSN, D_SSN, Date, Start_Time, End_Time) Values( @p_ssn,@d_ssn,@date, @start_time, @end_time)", sqlConnection);
            cmd1.CommandType = CommandType.Text;

            string P_SSN = DropDownList3.SelectedValue;
            string Date = TextBox1.Text;
            string D_SSN = DropDownList2.SelectedValue;
            
            string Start_Time ="", End_Time="";
            if (a == 3)
            {
                 Start_Time = Label7.Text;
                 End_Time = Label8.Text;
            }

            else if (a == 4)
            {
                Start_Time = Label9.Text;
                End_Time = Label10.Text;
            }

            else if (a == 5)
            {
                Start_Time = Label11.Text;
                End_Time = Label12.Text;
            }

            else if (a == 6)
            {
                Start_Time = Label13.Text;
                End_Time = Label14.Text;
            }

            else if (a == 7)
            {
                Start_Time = Label15.Text;
                End_Time = Label16.Text;
            }

            else if (a == 8)
            {
                Start_Time = Label17.Text;
                End_Time = Label18.Text;
            }

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
    
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Insert_Data(3);
            SendEmail(Label19.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patient Name: " + this.DropDownList3.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label7.Text + "<br />" + "End Time: " + Label8.Text);
            SendEmail(Label20.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label7.Text + "<br />" + "End Time: " + Label8.Text);
            Response.Redirect("AdminHome.aspx");
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

        public void getWhileLoopData()
            {
           
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

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
                    if (Start_Time == Label7.Text)
                    {
                        Button3.Visible = false;
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Not Available";
                    }

                    else if (Start_Time == Label9.Text)
                    {
                        Button4.Visible = false;
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Not Available";
                    }

                    else if (Start_Time == Label11.Text)
                    {
                        Button5.Visible = false;
                        Label3.ForeColor = System.Drawing.Color.Red;
                        Label3.Text = "Not Available";
                    }

                    else if (Start_Time == Label13.Text)
                    {
                        Button6.Visible = false;
                        Label4.ForeColor = System.Drawing.Color.Red;
                        Label4.Text = "Not Available";
                    }

                    else if (Start_Time == Label15.Text)
                    {
                        Button7.Visible = false;
                        Label5.ForeColor = System.Drawing.Color.Red;
                        Label5.Text = "Not Available";
                    }

                    else if (Start_Time == Label17.Text)
                    {
                        Button8.Visible = false;
                        Label6.ForeColor = System.Drawing.Color.Red;
                        Label6.Text = "Not Available";
                    }            
                 }
            sqlConnection.Close();
         
            }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Insert_Data(4);
            SendEmail(Label19.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patient Name: " + this.DropDownList3.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label9.Text + "<br />" + "End Time: " + Label10.Text);
            SendEmail(Label20.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label9.Text + "<br />" + "End Time: " + Label10.Text);
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Insert_Data(5);
            SendEmail(Label19.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patient Name: " + this.DropDownList3.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label11.Text + "<br />" + "End Time: " + Label12.Text);
            SendEmail(Label20.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label11.Text + "<br />" + "End Time: " + Label12.Text);
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Insert_Data(6);
            SendEmail(Label19.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patient Name: " + this.DropDownList3.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label13.Text + "<br />" + "End Time: " + Label14.Text);
            SendEmail(Label20.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label13.Text + "<br />" + "End Time: " + Label14.Text);
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Insert_Data(7);
            SendEmail(Label19.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patient Name: " + this.DropDownList3.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label15.Text + "<br />" + "End Time: " + Label16.Text);
            SendEmail(Label20.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label15.Text + "<br />" + "End Time: " + Label16.Text);
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Insert_Data(8);
            SendEmail(Label19.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Patient Name: " + this.DropDownList3.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label17.Text + "<br />" + "End Time: " + Label18.Text + "<br />");
            SendEmail(Label20.Text, "Patan Hospital Appointment Scheduled", "Appointment Scheduled as Follows" + "<br />" + "Doctors Name: " + this.DropDownList2.SelectedItem + "<br />" + "Date: " + this.TextBox1.Text + "<br />" + "Start Time: " + Label17.Text + "<br />" + "End Time: " + Label18.Text + "<br />");
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}