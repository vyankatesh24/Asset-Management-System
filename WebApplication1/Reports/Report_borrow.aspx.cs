using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Reports
{
    public partial class Report_borrow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_generate_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(date_from.Text.Trim());
            DateTime date1 = Convert.ToDateTime(date_to.Text.Trim());
            Response.Redirect("Report_borrowAsset.aspx?d1=" + date.ToShortDateString() + "&d2=" + date1.ToShortDateString() + "");

        }
    }
}