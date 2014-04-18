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
    public partial class WebForm1 : System.Web.UI.Page
    {
        Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
        protected void Page_Load(object sender, EventArgs e)
        {
            Table2.Visible = false;
            Label1.Visible = false;
            
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
            Label2.Visible = true;
            Label2.Text = "User Name:";
            HyperLink2.Visible = false;
            Session["Status"] = RadioButton1.Text;
            
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
            Label2.Visible = true;
            Label2.Text = "Email address:";
            HyperLink2.Visible = true;
            
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            Table2.Visible = true;
            Label2.Visible = true;
            Label2.Text = "Email address:";
            HyperLink2.Visible = true;
            Session["Status"] = RadioButton3.Text;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (RadioButton1.Checked == true)
            {
                
                ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
                SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand("select * from Administrator where username =@username and password=@password", sqlConnection);
                cmd.Parameters.AddWithValue("@username", TextBox1.Text);
                cmd.Parameters.AddWithValue("@password", TextBox2.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                DataTable dt = new DataTable();
                da.Fill(dt);
                da.Fill(ds, "Administrator");

                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("AdminHome.aspx");
                }
                else
                {
                    Label1.Visible = true;
                    Table2.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Invalid Login Crediantials";
                    TextBox1.Text = "";
                    TextBox2.Text = "";

                }
            }
            if (RadioButton2.Checked == true)
            {
                ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
                SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand("select * from DoctorCrediantials where email=@email and password=@password", sqlConnection);
                cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                cmd.Parameters.AddWithValue("@password", TextBox2.Text);

                Session["Doctor_email"] = TextBox1.Text;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                DataTable dt = new DataTable();
                da.Fill(dt);
                da.Fill(ds, "DoctorCrediantials");


                if (dt.Rows.Count > 0)
                {
                    Session["Doctor_SSN"] = ds.Tables["DoctorCrediantials"].Rows[0]["SSN"].ToString();
                    Response.Redirect("DoctorHome.aspx");
                }
                else
                {
                    Label1.Visible = true;
                    Table2.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Invalid Login Crediantials";
                    TextBox1.Text = "";
                    TextBox2.Text = "";

                }
            }
            if (RadioButton3.Checked == true)
            {
                ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
                SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
                sqlConnection.Open();
                SqlCommand cmd = new SqlCommand("select * from PatientCredientials where email =@email and password=@password", sqlConnection);
                cmd.Parameters.AddWithValue("@email", TextBox1.Text);
                cmd.Parameters.AddWithValue("@password", TextBox2.Text);

                
                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                DataTable dt = new DataTable();
                da.Fill(dt);
                da.Fill(ds, "PatientCredientials");

                if (dt.Rows.Count > 0)
                {
                    Session["Patient_email"] = TextBox1.Text;
                    Session["Patient_FName"] = ds.Tables["PatientCredientials"].Rows[0]["Fname"].ToString();
                    Session["Patient_Lname"] = ds.Tables["PatientCredientials"].Rows[0]["Lname"].ToString();
                    Session["Patient_SSN"] = ds.Tables["PatientCredientials"].Rows[0]["SSN"].ToString();
                    Response.Redirect("PatientHome.aspx");
                }
                else
                {
                    Label1.Visible = true;
                    Table2.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Invalid Login Crediantials";
                    TextBox1.Text = "";
                    TextBox2.Text = "";

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
          //  Response.Redirect("");
        }
    }
}