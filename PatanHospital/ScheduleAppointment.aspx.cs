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
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Table2.Visible = false;
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
            Label1.Text = "success";
            DropDownList2.DataSource = ds;
            DropDownList2.DataTextField = "Name";
            DropDownList2.DataValueField = "SSN";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));  
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
    }
}