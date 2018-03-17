using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class my_profile : System.Web.UI.Page
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
            if(!this.IsPostBack)
                filldata();

        }
        void filldata()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select U_fname,U_lname,U_email,U_contact from [User] where (U_Id='" + uid + "')", con);
            SqlDataReader sdr;
            con.Open();
            sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txt_fname.Text = sdr[0].ToString();
                txt_lname.Text = sdr[1].ToString();
                txt_email.Text = sdr[2].ToString();
                txt_cont.Text = sdr[3].ToString();
            }
            con.Close();
            
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            btn_submit.Enabled = true;
            txt_cont.ReadOnly = false;
            txt_email.ReadOnly = false;
            txt_fname.ReadOnly = false;
            txt_lname.ReadOnly = false;
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("update [User] Set U_fname=@ufname,U_lname=@ulname,U_email=@uemail,U_contact=@ucont where U_Id=@uid", con);
            cmd.Parameters.AddWithValue("uid",uid);
            cmd.Parameters.AddWithValue("ufname",txt_fname.Text);
            cmd.Parameters.AddWithValue("ulname",txt_lname.Text);
            cmd.Parameters.AddWithValue("uemail",txt_email.Text);
            cmd.Parameters.AddWithValue("ucont",txt_cont.Text);
            con.Open();
            int i=cmd.ExecuteNonQuery();
            if (i>0)
            {
                Response.Write("<script>alert('Details Updated.');</script>");
            }
            con.Close();
            txt_cont.ReadOnly = true;
            txt_email.ReadOnly = true;
            txt_fname.ReadOnly = true;
            txt_lname.ReadOnly = true;
            btn_submit.Enabled = false;
        }
    }
}