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
    public partial class EditPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            if (!IsPostBack)
            {
                DropDownList1.AppendDataBoundItems = true;
                DropDownList1.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                DropDownList1.SelectedIndex = 0;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        public void ClearTextBox()
        {
            TextBox1.Text  = "";
            TextBox2.Text  = "";
            TextBox3.Text  = "";
            TextBox4.Text  = "";
            TextBox5.Text  = "";
            TextBox6.Text  = "";
            TextBox7.Text  = "";
            TextBox8.Text  = "";
            TextBox9.Text  = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
        }

        void FillData()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "Select Fname, Lname, City, SSN, Gender, Address1, Address2, City, State, ZipCode, Phone, email from PatientCredientials where SSN ='" + this.DropDownList1.SelectedValue+ "'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "PatientCredientials");
            sqlConnection.Close();

            TextBox1.Text  = ds.Tables["PatientCredientials"].Rows[0]["Fname"].ToString();
            TextBox2.Text  = ds.Tables["PatientCredientials"].Rows[0]["Lname"].ToString();
            TextBox3.Text  = ds.Tables["PatientCredientials"].Rows[0]["SSN"].ToString();
            TextBox4.Text  = ds.Tables["PatientCredientials"].Rows[0]["Gender"].ToString();
            TextBox5.Text  = ds.Tables["PatientCredientials"].Rows[0]["Address1"].ToString();
            TextBox6.Text  = ds.Tables["PatientCredientials"].Rows[0]["Address2"].ToString();
            TextBox7.Text  = ds.Tables["PatientCredientials"].Rows[0]["City"].ToString();
            TextBox8.Text  = ds.Tables["PatientCredientials"].Rows[0]["State"].ToString();
            TextBox9.Text  = ds.Tables["PatientCredientials"].Rows[0]["ZipCode"].ToString();
            TextBox10.Text = ds.Tables["PatientCredientials"].Rows[0]["Phone"].ToString();
            TextBox11.Text = ds.Tables["PatientCredientials"].Rows[0]["email"].ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillData();
        }

       
    }
}