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
    public partial class DoctorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Session["Doctor_SSN"].ToString();
            Label4.Text = Session["Doctor_email"].ToString();
            
            Insert_Doctor_Data();
        }

        protected void Insert_Doctor_Data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            SqlCommand cmd = new SqlCommand("Select Fname+' '+Lname as Name, SSN, Phone, email, Education, Residency, Gender, NPI, DateOfGraduation, Speciality from DoctorCrediantials where email = '" + Label4.Text + "'; ", sqlConnection);
            SqlCommand cmd1 = new SqlCommand("Select Address1+' '+ Address2 As Address, City, State, ZipCode  from DoctorAddress where DSSN = '" + Label2.Text + "'; ", sqlConnection);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "DoctorCrediantials");

            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1, "DoctorAddress");

            sqlConnection.Close();

            Label1.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Name"].ToString();
            Label3.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Phone"].ToString();
            Label5.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Education"].ToString();
            Label6.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Residency"].ToString();
            Label7.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Gender"].ToString();
            Label8.Text = ds.Tables["DoctorCrediantials"].Rows[0]["NPI"].ToString();
            Label9.Text = ds.Tables["DoctorCrediantials"].Rows[0]["DateOfGraduation"].ToString();
            Label10.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Speciality"].ToString();

            Label11.Text = ds1.Tables["DoctorAddress"].Rows[0]["Address"].ToString();
            Label13.Text = ds1.Tables["DoctorAddress"].Rows[0]["City"].ToString();
            Label14.Text = ds1.Tables["DoctorAddress"].Rows[0]["State"].ToString();
            Label15.Text = ds1.Tables["DoctorAddress"].Rows[0]["ZipCode"].ToString();
           


        }

        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorHome.aspx");
        }
    }
}