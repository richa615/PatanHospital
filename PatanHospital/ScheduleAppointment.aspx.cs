using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatanHospital
{
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Table2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPatient.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Table2.Visible = true;
        }
    }
}