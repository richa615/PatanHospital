using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatanHospital
{
    public partial class UpdateDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
          void fillData() 
        {
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["EdupointConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "Select Fname, Lname, Phone, Address, Email, Qualification from Faculty where FID ='"+this.TextBox1.Text+"'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Faculty");
            sqlConnection.Close();
            TextBox2.Text = ds.Tables["Faculty"].Rows[0]["Fname"].ToString();
            TextBox7.Text = ds.Tables["Faculty"].Rows[0]["Lname"].ToString();
            TextBox3.Text = ds.Tables["Faculty"].Rows[0]["Phone"].ToString();
            TextBox4.Text = ds.Tables["Faculty"].Rows[0]["Address"].ToString();
            TextBox5.Text = ds.Tables["Faculty"].Rows[0]["Email"].ToString();
            TextBox6.Text = ds.Tables["Faculty"].Rows[0]["Qualification"].ToString();
        }

         
         */

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }
    }
}