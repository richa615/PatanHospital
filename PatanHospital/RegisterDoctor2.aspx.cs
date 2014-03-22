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
            Label1.Text = "" + Session["ssn"];
            
        }

        private void Insert_data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            SqlCommand cmd = new SqlCommand("update DoctorCrediantials set Education=@education, Residency = @residency, DateOfGraduation = @dateofgraduation, Speciality = @speciality, NPI = @npi where SSN=" + Session["ssn"], sqlConnection);
            cmd.CommandType = CommandType.Text;

            string education = TextBox1.Text;
            string residency = TextBox2.Text;
            string dateofgraduation = TextBox3.Text;
            string speciality = DropDownList1.SelectedValue;
            string npi = TextBox4.Text;
           
            cmd.Parameters.AddWithValue("@education", education);
            cmd.Parameters.AddWithValue("@residency", residency);
            cmd.Parameters.AddWithValue("@dateofgraduation", dateofgraduation);
            cmd.Parameters.AddWithValue("@speciality", speciality);
            cmd.Parameters.AddWithValue("@npi", npi);
            sqlConnection.Open();
            cmd.ExecuteNonQuery();
            sqlConnection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Insert_data();
            Response.Redirect("RegisterDoctor.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
             
             Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
             ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
             SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
             sqlConnection.Open();
             string Query1 = "Delete from DoctorAddress where DSSN ='" + this.Label1.Text + "'; ";
             SqlCommand cmd = new SqlCommand(Query1, sqlConnection);

             string Query2 = "Delete from DoctorCrediantials where SSN ='" +Session["ssn"] + "'; ";
             SqlCommand cmd1 = new SqlCommand(Query2, sqlConnection);

             cmd.ExecuteNonQuery();
             cmd1.ExecuteNonQuery();
             sqlConnection.Close();
             Response.Redirect("RegisterDoctor.aspx");
             
        }
    }
}