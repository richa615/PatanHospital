﻿using System;
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
    public partial class DeletePatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;

            table2.Visible = false;
            if (!IsPostBack)
            {
                DropDownList1.AppendDataBoundItems = true;
                DropDownList1.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                DropDownList1.SelectedIndex = 0;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Delete_Patient_Data();
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            table2.Visible = true;
            Button4.Visible = true;
            Button5.Visible = true;
            try
            {
                
                Fill_Data();
            }
            catch (Exception ex)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "There is no data in the database at this time.";

            }
        }

        public void Fill_Data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "Select Fname+' '+Lname as Name, SSN,Phone, email from PatientCredientials where SSN ='" + this.DropDownList1.SelectedValue + "'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "PatientCredientials");
            sqlConnection.Close();

            TextBox1.Text = ds.Tables["PatientCredientials"].Rows[0]["Name"].ToString();
            TextBox2.Text = ds.Tables["PatientCredientials"].Rows[0]["SSN"].ToString();
            TextBox3.Text = ds.Tables["PatientCredientials"].Rows[0]["Phone"].ToString();
            TextBox4.Text = ds.Tables["PatientCredientials"].Rows[0]["email"].ToString();
            
        }

        public void Delete_Patient_Data()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("/HospitalServer");
            ConnectionStringSettings connectionString = rootWebConfig.ConnectionStrings.ConnectionStrings["HospitalServerConnectionString"];
            SqlConnection sqlConnection = new SqlConnection(connectionString.ToString());
            sqlConnection.Open();
            string Query = "Delete from PatientCredientials where SSN ='" + this.DropDownList1.SelectedValue + "'; ";
            SqlCommand cmd = new SqlCommand(Query, sqlConnection);
            cmd.ExecuteNonQuery();
            sqlConnection.Close();
            DropDownList1.Items.Remove(DropDownList1.SelectedItem);
        }

        protected void Logo_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHome.aspx");
        }

    }
}