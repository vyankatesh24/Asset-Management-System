using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Reports
{
    public partial class report_repairAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime d1 = Convert.ToDateTime(Request.QueryString[0].Trim());
            DateTime d2 = Convert.ToDateTime(Request.QueryString[1].Trim());
            lbl_datefrom.Text = d1.ToString("dd-MMMM-yyyy");
            lbl_dateto.Text = d2.ToString("dd-MMMM-yyyy");
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Dashboard.aspx");
        }
    }
}