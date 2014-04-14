using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatanHospital
{
    public partial class SearchDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           if (Session["Status"].ToString()=="Patient")
           {
               Response.Redirect("PatientHome.aspx");
           }
           else if (Session["Status"].ToString() == "Administrator")
           {
               Response.Redirect("AdminHome.aspx");
           }
           
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["Status"].ToString() == "Patient")
            {
                Response.Redirect("PatientHome.aspx");
            }
            else if (Session["Status"].ToString() == "Administrator")
            {
                Response.Redirect("AdminHome.aspx");
            }
        }
    }
}