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
    public partial class RegisterDoctor2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "" + Session["ssn"];
            
        }
        private void Insert_data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            SqlCommand cmd = new SqlCommand("update DoctorCrediantials set Education=@education, Residency = @residency, DateOfGraduation = @dateofgraduation, Speciality = @speciality, NPI = @npi where SSN=" + Session["ssn"], sqlConnection);
            cmd.CommandType = CommandType.Text;

            string education = TextBox1.Text;
            string residency = TextBox2.Text;
            string dateofgraduation = TextBox3.Text;
            string speciality = DropDownList1.SelectedValue;
            string npi = TextBox4.Text;
           // string ssn = Label1.Text;
           

            cmd.Parameters.AddWithValue("@education", education);
            cmd.Parameters.AddWithValue("@residency", residency);
            cmd.Parameters.AddWithValue("@dateofgraduation", dateofgraduation);
            cmd.Parameters.AddWithValue("@speciality", speciality);
            cmd.Parameters.AddWithValue("@npi", npi);
           // cmd.Parameters.AddWithValue("@ssn", ssn);



           /* string strQuery = "update Course set Material_Name=@Name, ContentType=@ContentType, Data=@Data where CID=" + Session["CID"];

            SqlCommand cmd = new SqlCommand(strQuery);

            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename;

            cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = "application/vnd.ms-word";

            cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;


            String strConnString = System.Configuration.ConfigurationManager

            .ConnectionStrings["EdupointConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(strConnString);

            cmd.CommandType = CommandType.Text;

            cmd.Connection = con;*/

            

            sqlConnection.Open();
            cmd.ExecuteNonQuery();
            sqlConnection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Insert_data();
        }
    }
}