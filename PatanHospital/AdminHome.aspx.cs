using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatanHospital
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPatient.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditPatient.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterDoctor.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateDoctor.aspx");
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeletePatient.aspx");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteDoctor.aspx");
        }
    }
}