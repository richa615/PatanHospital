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

                SqlCommand cmd1 = new SqlCommand("insert into DoctorAddress (Address1,Address2,City,State,Zipcode,DSSN) Values( @address1,@address2,@city,@state,@zipcode,@dssn)", sqlConnection);
                cmd.CommandType = CommandType.Text;
                
               

                string fname = TextBox1.Text;
                string lname = TextBox2.Text;
                string ssn   = TextBox3.Text;
                string phone = TextBox4.Text;
                string gender = DropDownList1.SelectedValue;
                string email = TextBox5.Text;

                string address1 = TextBox6.Text;
                string address2 = TextBox7.Text;
                string city = TextBox8.Text;
                string state = DropDownList2.SelectedValue;
                string zipcode = TextBox9.Text;

                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@ssn", ssn);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@email", email);

                cmd1.Parameters.AddWithValue("@address1", address1);  
                cmd1.Parameters.AddWithValue("@address2", address2);
                cmd1.Parameters.AddWithValue("@city", city);
                cmd1.Parameters.AddWithValue("@state", state);
                cmd1.Parameters.AddWithValue("@zipcode", zipcode);
                cmd1.Parameters.AddWithValue("@dssn",ssn );
                
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                sqlConnection.Close();
           }

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