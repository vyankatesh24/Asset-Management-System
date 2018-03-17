using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class change_pass : System.Web.UI.Page
    {
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                uid = int.Parse(Session["uid"].ToString());
            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("update [User] Set Password=@password where U_Id=@uid", con);
            cmd.Parameters.AddWithValue("uid", uid);
            cmd.Parameters.AddWithValue("password", txt_confirmPass.Text);
            SqlDataReader sdr;
            SqlCommand cmd1 = new SqlCommand("select * from [User] where U_Id=@uid and Password=@pass", con);
            cmd1.Parameters.AddWithValue("@uid", uid);
            cmd1.Parameters.AddWithValue("@pass", txt_currentPass.Text);
            con.Open();
            sdr = cmd1.ExecuteReader();
             bool res=false;
            if (sdr.Read())
            {
                res = true;
            }
            con.Close();
            if(res==true)
            {
                con.Open();
                int i = cmd.ExecuteNonQuery();
                if(i>0)
                    Response.Write("<script>alert('Password Changed Successfully');</script>");
                con.Close();

            }
            else
            {
                Response.Write("<script>alert('Wrong Password');</script>");

            }
            
            
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_confirmPass.Text = "";
            txt_currentPass.Text = "";
            txt_newPass.Text = "";

        }
    }
}