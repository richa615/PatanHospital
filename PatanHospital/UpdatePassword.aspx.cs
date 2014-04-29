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
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Visible = false;
        }

        public void Check_Doctor_Crediatials( )
        {
            if (TextBox1.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Email cannot be Empty";
                TextBox1.Style.Add("border", "solid 1px red");
            }

            else if (TextBox2.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Old password cannot be empty";
                TextBox2.Style.Add("border", "solid 1px red");
            }

            else if (TextBox3.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "New password cannot be empty";
                TextBox3.Style.Add("border", "solid 1px red");
            }

            else if (TextBox4.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "New password cannot be empty";
                TextBox4.Style.Add("border", "solid 1px red");
            }

            else 
            {
                Check_Entered_Email();
            }
        }

        public void Check_Entered_Email()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            SqlCommand cmd = new SqlCommand("Select email from DoctorCrediantials where email = @email", sqlConnection);
            cmd.Parameters.AddWithValue("@email", TextBox1.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "DoctorCrediantials");

            if (dt.Rows.Count <= 0 )
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Email Address Does not exist in our Database";
                TextBox1.Style.Add("border", "solid 1px red");
            }

            else
            {
                Check_Doctor_Old_Password();
            }


        }

        protected void Check_Doctor_Old_Password()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            SqlCommand cmd2 = new SqlCommand("Select password from DoctorCrediantials where email = @email", sqlConnection);
            cmd2.Parameters.AddWithValue("@email", TextBox1.Text);

            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataSet ds2 = new DataSet();
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            da2.Fill(ds2, "DoctorCrediantials");

            if (dt2.Rows.Count > 0)
            {
                   string passwordfromDB = ds2.Tables["DoctorCrediantials"].Rows[0]["password"].ToString();
                   string passwordfromTB = TextBox2.Text.ToString();
                   int result = string.Compare(passwordfromDB, passwordfromTB, true);
                   if (result != 0)
                   {
                       Label1.Visible = true;
                       Label1.ForeColor = System.Drawing.Color.Red;
                       Label1.Text = "Old Password is not correct";
                       TextBox2.Style.Add("border", "solid 1px red");
                   }

                   else
                   {
                       Check_Doctor_New_Password();
                   }
            }

        }

        public void Check_Doctor_New_Password()
        {
            string FitstNewPassword = TextBox3.Text.ToString();
            string SecondNewPassword = TextBox4.Text.ToString();
            int result = string.Compare(FitstNewPassword,SecondNewPassword, true);
            if (result != 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "New Password do not match";
                TextBox2.Style.Add("border", "solid 1px red");
            }
            else
            {
                Update_Doctor_Database();
            }


        }

        public void Update_Doctor_Database()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query1 = "update DoctorCrediantials SET Password ='" + TextBox4.Text + "' where Email  = '" + TextBox1.Text + "'; ";
            SqlCommand cmd = new SqlCommand(Query1, sqlConnection);
            cmd.ExecuteNonQuery();
            sqlConnection.Close();
            
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Password Successfully Updated.";

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

        public void Check_Patient_Crediatials( )
        {
            if (TextBox1.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Email cannot be Empty";
                TextBox1.Style.Add("border", "solid 1px red");
            }

            else if (TextBox2.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Old password cannot be empty";
                TextBox2.Style.Add("border", "solid 1px red");
            }

            else if (TextBox3.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "New password cannot be empty";
                TextBox3.Style.Add("border", "solid 1px red");
            }

            else if (TextBox4.Text == "")
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "New password cannot be empty";
                TextBox4.Style.Add("border", "solid 1px red");
            }

            else
            {
                Check_Patient_Entered_Email();
            }

        }

        public void Check_Patient_Entered_Email()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            SqlCommand cmd = new SqlCommand("Select email from PatientCredientials where email = @email", sqlConnection);
            cmd.Parameters.AddWithValue("@email", TextBox1.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Fill(ds, "PatientCredientials");

            if (dt.Rows.Count <= 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Email Address Does not exist in our Database";
                TextBox1.Style.Add("border", "solid 1px red");
            }

            else
            {
                Check_Patient_Old_Password();
            }


        }

        protected void Check_Patient_Old_Password()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();

            SqlCommand cmd2 = new SqlCommand("Select password from PatientCredientials where email = @email", sqlConnection);
            cmd2.Parameters.AddWithValue("@email", TextBox1.Text);

            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataSet ds2 = new DataSet();
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            da2.Fill(ds2, "PatientCredientials");

            if (dt2.Rows.Count > 0)
            {
                string passwordfromDB = ds2.Tables["PatientCredientials"].Rows[0]["password"].ToString();
                   string passwordfromTB = TextBox2.Text.ToString();
                   int result = string.Compare(passwordfromDB, passwordfromTB, true);
                   if (result != 0)
                   {
                       Label1.Visible = true;
                       Label1.ForeColor = System.Drawing.Color.Red;
                       Label1.Text = "Old Password is not correct";
                       TextBox2.Style.Add("border", "solid 1px red");
                   }

                   else
                   {
                       Check_Patient_New_Password();
                   }
            }

        }

        public void Check_Patient_New_Password()
        {
            string FitstNewPassword = TextBox3.Text.ToString();
            string SecondNewPassword = TextBox4.Text.ToString();
            int result = string.Compare(FitstNewPassword,SecondNewPassword, true);
            if (result != 0)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "New Password do not match";
                TextBox2.Style.Add("border", "solid 1px red");
            }
            else
            {
                Update_Patient_Database();
            }


        }

        public void Update_Patient_Database()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query1 = "update PatientCredientials SET Password ='" + TextBox4.Text + "' where Email  = '" + TextBox1.Text + "'; ";
            SqlCommand cmd = new SqlCommand(Query1, sqlConnection);
            cmd.ExecuteNonQuery();
            sqlConnection.Close();
            
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Password Successfully Updated.";

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
           if( RadioButton3.Checked ==true)
           {
               Check_Doctor_Crediatials();
                
           }

           else if (RadioButton4.Checked == true)
           {
               Check_Patient_Crediatials();

           }


        }

        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}