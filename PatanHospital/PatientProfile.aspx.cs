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
    public partial class PatientProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["Patient_Email"].ToString();
            Label1.Visible = false;
            Load_Data();

        }

        protected void Load_Data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            SqlCommand cmd = new SqlCommand("Select Fname+' '+Lname as Name,SSN, Gender, Address1, Address2, City, State, ZipCode, Phone, Email from PatientCredientials where email = '" + this.Session["Patient_Email"].ToString() + "';", sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "PatientCredientials");
            sqlConnection.Close();

            Label2.Text = ds.Tables["PatientCredientials"].Rows[0]["Name"].ToString();
            Label3.Text = ds.Tables["PatientCredientials"].Rows[0]["SSN"].ToString();
            Label4.Text = ds.Tables["PatientCredientials"].Rows[0]["Gender"].ToString();
            Label5.Text = ds.Tables["PatientCredientials"].Rows[0]["Address1"].ToString();
            Label6.Text = ds.Tables["PatientCredientials"].Rows[0]["Address2"].ToString();
            Label7.Text = ds.Tables["PatientCredientials"].Rows[0]["City"].ToString();
            Label8.Text = ds.Tables["PatientCredientials"].Rows[0]["State"].ToString();
            Label9.Text = ds.Tables["PatientCredientials"].Rows[0]["ZipCode"].ToString();
            Label10.Text = ds.Tables["PatientCredientials"].Rows[0]["Phone"].ToString();
            Label11.Text = ds.Tables["PatientCredientials"].Rows[0]["email"].ToString();

        }

        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientHome.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientHome.aspx");
        }
    }
}