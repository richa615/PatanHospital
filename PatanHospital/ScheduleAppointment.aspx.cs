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
            getWhileLoopData();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           
        }

        public void Insert_Data()
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
            string Start_Time = Label7.Text;
            string End_Time = Label8.Text;

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
            Response.Redirect("AdminHome.aspx");
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Insert_Data();

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
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into DoctorSchedule (P_SSN, D_SSN, Date, Start_Time, End_Time) Values( @p_ssn,@d_ssn,@date, @start_time, @end_time)", sqlConnection);
            cmd1.CommandType = CommandType.Text;

            string P_SSN = DropDownList3.SelectedValue;
            string Date = TextBox1.Text;
            string D_SSN = DropDownList2.SelectedValue;
            string Start_Time = Label9.Text;
            string End_Time = Label10.Text;

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
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
            string Start_Time = Label11.Text;
            string End_Time = Label12.Text;

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
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
            string Start_Time = Label13.Text;
            string End_Time = Label14.Text;

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
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
            string Start_Time = Label15.Text;
            string End_Time = Label16.Text;

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
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
            string Start_Time = Label17.Text;
            string End_Time = Label18.Text;

            cmd1.Parameters.AddWithValue("@p_ssn", P_SSN);
            cmd1.Parameters.AddWithValue("@date", Date);
            cmd1.Parameters.AddWithValue("@d_ssn", D_SSN);
            cmd1.Parameters.AddWithValue("@start_time", Start_Time);
            cmd1.Parameters.AddWithValue("@end_time", End_Time);

            cmd1.ExecuteNonQuery();
            sqlConnection.Close();

            Table2.Visible = true;
            Table3.Visible = true;
            Response.Redirect("AdminHome.aspx"); Insert_Data();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}