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
    public partial class RegisterDoctor : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Insert_data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            
            

                SqlCommand cmd = new SqlCommand("insert into DoctorCrediantials (Fname,Lname,SSN,Phone,Gender,email) Values( @fname,@lname,@ssn,@phone,@gender,@email)", sqlConnection);
                cmd.CommandType = CommandType.Text;

                string fname = TextBox1.Text;
                string lname = TextBox2.Text;
                string ssn   = TextBox3.Text;
                string phone = TextBox4.Text;
                string gender = DropDownList1.SelectedValue;
                string email = TextBox5.Text;

                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@ssn", ssn);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@email", email);
                
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();
           }

         /*  protected void ClearText_Box()
           {
               Label4.Visible = true;

               TextBox2.Text = "";
               TextBox3.Text = "";
               TextBox4.Text = "";
               TextBox5.Text = "";
               TextBox6.Text = "";
               TextBox7.Text = "";
           }   */

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Insert_data();
            Session["ssn"] = TextBox3.Text;
            Response.Redirect("RegisterDoctor2.aspx");
          
        }
    }
}