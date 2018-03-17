using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class forgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlDataReader sdr;
            SqlCommand cmd1 = new SqlCommand("select * from [User] where Username=@username and U_email=@email", con);
            cmd1.Parameters.AddWithValue("@uid", txt_uname.Text);
            cmd1.Parameters.AddWithValue("@pass", txt_email.Text);
            con.Open();
            sdr = cmd1.ExecuteReader();
            bool res = false;
            if (sdr.Read())
            {
                res = true;
            }
            if (res == true)
            {

            }

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_email.Text = "";
            txt_uname.Text = "";
        }
    }
}