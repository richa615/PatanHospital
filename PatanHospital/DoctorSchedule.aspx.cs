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

namespace PatanHospital
{
    public partial class DoctorSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["Doctor_SSN"].ToString();
            Bind_Grid_View();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorHome.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorHome.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void Bind_Grid_View()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "SELECT DoctorSchedule.Date, DoctorSchedule.Start_Time, DoctorSchedule.End_Time, PatientCredientials.Fname+' '+ PatientCredientials.Lname as Name FROM PatientCredientials INNER JOIN DoctorSchedule ON PatientCredientials.SSN = DoctorSchedule.P_SSN where D_SSN ='" + this.Label1.Text + "'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "DoctorSchedule");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            sqlConnection.Close();

        }

        protected void Bind_Grid_View_with_TextBox_Date()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "SELECT DoctorSchedule.Date, DoctorSchedule.Start_Time, DoctorSchedule.End_Time, PatientCredientials.Fname+' '+ PatientCredientials.Lname as Name FROM PatientCredientials INNER JOIN DoctorSchedule ON PatientCredientials.SSN = DoctorSchedule.P_SSN where D_SSN ='" + this.Label1.Text + "' and Date ='" + this.TextBox1.Text + "'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "DoctorSchedule");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            sqlConnection.Close();


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Bind_Grid_View_with_TextBox_Date();
        }


       

        
    }
}