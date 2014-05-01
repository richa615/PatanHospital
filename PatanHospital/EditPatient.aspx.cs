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
            try
            {
                if (TextBox1.Text == "")
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "First Name cannot be empty";
                }

                else if (TextBox3.Text == "")
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "SSN cannot be Empty";
                }

                else if (TextBox11.Text == "")
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Email address cannot be Empty";
                }
                else
                {
                    update_patient_information();
                    DropDownList1.Items.Clear();
                    
                        DropDownList1.AppendDataBoundItems = true;
                        DropDownList1.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                        DropDownList1.SelectedIndex = 0;
                    
                    DropDownList1.DataSourceID = "SqldataSource1";
                    ClearTextBox();
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Update Successful";
                }

            }

            catch (Exception ex)
            {
                Check_SSN();
            }
        }

        public void update_patient_information()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            string Query2 = "Update PatientCredientials SET Fname = '" + TextBox1.Text + "', Lname ='" + TextBox2.Text + "', SSN ='" + TextBox3.Text + "',  Gender = '" + TextBox4.Text + "', Address1 = '" + TextBox5.Text + "', Address2 = '" + TextBox6.Text + "', City = '" + TextBox7.Text + "', State = '" + TextBox8.Text + "', ZipCode = '" + TextBox9.Text + "' , Phone = '" + TextBox10.Text + "', email = '" + TextBox11.Text + "' where SSN ='" + this.DropDownList1.SelectedValue + "'; ";
            SqlCommand cmd2 = new SqlCommand(Query2, sqlConnection);
            cmd2.ExecuteNonQuery();

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

        public void Check_SSN()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand("select * from PatientCredientials where SSN = @ssn", sqlConnection);
            cmd.Parameters.AddWithValue("@ssn", TextBox3.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "PatientCredientials");

            if (dt.Rows.Count > 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "SSN already exist in our database";
                TextBox3.Style.Add("border", "solid 1px red");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ClearTextBox();
                FillData();
                     
            }
            catch (Exception ex)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Something went wrong. Please try again";
            }

        }
        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

       
    }
}