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
    public partial class UpdateDoctor : System.Web.UI.Page
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

        
          void FillData() 
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "Select Fname, Lname, SSN,Phone, email, Education, Residency, Gender, NPI, DateOfGraduation, Speciality from DoctorCrediantials where SSN ='"+this.TextBox3.Text+"'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "DoctorCrediantials");
            sqlConnection.Close();
            TextBox1.Text  = ds.Tables["DoctorCrediantials"].Rows[0]["Fname"].ToString();
            TextBox2.Text  = ds.Tables["DoctorCrediantials"].Rows[0]["Lname"].ToString();
            TextBox4.Text  = ds.Tables["DoctorCrediantials"].Rows[0]["Phone"].ToString();
            TextBox5.Text  = ds.Tables["DoctorCrediantials"].Rows[0]["Gender"].ToString();
            TextBox6.Text  = ds.Tables["DoctorCrediantials"].Rows[0]["email"].ToString();
            TextBox12.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Education"].ToString();
            TextBox13.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Residency"].ToString();
            TextBox14.Text = ds.Tables["DoctorCrediantials"].Rows[0]["DateOfGraduation"].ToString();
            TextBox15.Text = ds.Tables["DoctorCrediantials"].Rows[0]["Speciality"].ToString();
            TextBox16.Text = ds.Tables["DoctorCrediantials"].Rows[0]["NPI"].ToString();
        }

          
           void FillAddress() 
          {
              Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
              ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
              SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
              sqlConnection.Open();
              string Query = "Select Address1, Address2, City, State, ZipCode from DoctorAddress where DSSN ='"+this.TextBox3.Text+"'; ";
              SqlCommand cmd = new SqlCommand(Query, sqlConnection);
              SqlDataAdapter da = new SqlDataAdapter(cmd);
              DataSet ds = new DataSet();
              da.Fill(ds, "DoctorAddress");
              sqlConnection.Close();

               TextBox7.Text  = ds.Tables["DoctorAddress"].Rows[0]["Address1"].ToString();
               TextBox8.Text  = ds.Tables["DoctorAddress"].Rows[0]["Address2"].ToString();
               TextBox9.Text  = ds.Tables["DoctorAddress"].Rows[0]["City"].ToString();
               TextBox10.Text = ds.Tables["DoctorAddress"].Rows[0]["State"].ToString();
               TextBox11.Text = ds.Tables["DoctorAddress"].Rows[0]["Zipcode"].ToString();     
          }

           public void ClearTextBox()
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                TextBox11.Text = "";
                TextBox12.Text = "";
                TextBox13.Text = "";
                TextBox14.Text = "";
                TextBox15.Text = "";
                TextBox16.Text = "";
        
            }
           public void CheckSSN()
            {
                Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
                ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
                SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand("select * from DoctorCrediantials where SSN =@ssn", sqlConnection);
                cmd.Parameters.AddWithValue("@ssn", TextBox3.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                DataTable dt = new DataTable();
                da.Fill(dt);
                da.Fill(ds, "DoctorCrediantials");
                
                if (dt.Rows.Count > 0)
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "SSN already exist in our database";
                    TextBox3.Style.Add("border", "solid 1px red");

                }
            }

           public void CheckEmail()
           {
               Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
               ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
               SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
               sqlConnection.Open();
               SqlCommand cmd = new SqlCommand("select * from DoctorCrediantials where email = @email", sqlConnection);
               cmd.Parameters.AddWithValue("@email", TextBox6.Text);
               SqlDataAdapter da = new SqlDataAdapter(cmd);
               DataSet ds = new DataSet();
               DataTable dt = new DataTable();
               da.Fill(dt);
               da.Fill(ds, "DoctorCrediantials");

               if (dt.Rows.Count > 0)
               {
                   Label1.Visible = true;
                   Label1.ForeColor = System.Drawing.Color.Red;
                   Label1.Text = "Email address already exist in our database";
                   TextBox6.Style.Add("border", "solid 1px red");
               }
           }

        public void CheckNPI()
            {
               Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
               ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
               SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
               sqlConnection.Open();
               SqlCommand cmd = new SqlCommand("select * from DoctorCrediantials where npi = @npi", sqlConnection);
               cmd.Parameters.AddWithValue("@npi", TextBox16.Text);
               SqlDataAdapter da = new SqlDataAdapter(cmd);
               DataSet ds = new DataSet();
               DataTable dt = new DataTable();
               da.Fill(dt);
               da.Fill(ds, "DoctorCrediantials");
               
               if (dt.Rows.Count > 0)
               {
                   Label1.Visible = true;
                   Label1.ForeColor = System.Drawing.Color.Red;
                   Label1.Text = "NPI already exist in our database";
                   TextBox16.Style.Add("border", "solid 1px red");
               }
           }

        public void UpdateData()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            string Query2 = "Update DoctorCrediantials SET Fname = '" + TextBox1.Text + "', Lname ='" + TextBox2.Text + "', SSN ='" + TextBox3.Text + "',  Phone = '" + TextBox4.Text + "', email = '" + TextBox6.Text + "', Education = '" + TextBox12.Text + "', Residency = '" + TextBox13.Text + "', Gender = '" + TextBox5.Text + "', NPI = '" + TextBox16.Text + "' , DateOfGraduation = '" + TextBox14.Text + "', Speciality = '" + TextBox15.Text + "' where SSN ='" + this.DropDownList1.SelectedValue+ "'; ";
            SqlCommand cmd2 = new SqlCommand(Query2, sqlConnection);
            cmd2.ExecuteNonQuery();
        }

        public void UpdateAddress()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            string Query2 = "Update DoctorAddress SET Address1 = '" + TextBox7.Text + "', Address2 ='" + TextBox8.Text + "', City ='" + TextBox9.Text + "',  State = '" + TextBox10.Text + "', ZipCode = '" + TextBox11.Text + "' where DSSN ='" + this.DropDownList1.SelectedValue + "'; ";
            SqlCommand cmd2 = new SqlCommand(Query2, sqlConnection);
            cmd2.ExecuteNonQuery();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox3.Text == "")
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "SSN Cannot be Empty";
                    TextBox3.Style.Add("border", "solid 1px red");
                }
                else if (TextBox6.Text == "")
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Email address cannot be empty";
                    TextBox6.Style.Add("border", "solid 1px red");
                }
                else if (TextBox16.Text == "")
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "NPI Value cannot be empty";
                    TextBox16.Style.Add("border", "solid 1px red");
                }
                else
                {
                    UpdateAddress();
                    UpdateData();
                    DropDownList1.DataBind();
                    Response.Redirect("UpdateDoctor.aspx");
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "Update Successful";
                }
            }
            catch (Exception ex)
                {
                  
                }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TextBox3.Text = DropDownList1.SelectedValue;
                FillData();
                FillAddress();
            }
            catch (Exception ex)
            {
                ClearTextBox();
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Invalid Selection";
                
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            CheckSSN();
        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            CheckEmail();
        }

        protected void TextBox16_TextChanged(object sender, EventArgs e)
        {
            CheckNPI();
        }

        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}