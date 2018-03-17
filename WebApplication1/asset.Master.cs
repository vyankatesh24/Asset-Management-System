using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class asset : System.Web.UI.MasterPage
    {
        string type = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            filldata();
            restrict();
            if (Session["username"] == null)
            {
                try
                {
                    Response.Redirect("../Default.aspx");
                }
                catch (Exception)
                {

                    Response.Redirect("/Default.aspx");
                }
            }
        }
        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            try
            {
                Response.Redirect("../Default.aspx");
            }
            catch (Exception)
            {

                Response.Redirect("/Default.aspx");
            }
        }
        void filldata()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select U_fname,U_lname from [User] where (U_Id='" + Session["uid"] + "')", con);
            SqlDataReader sdr;
            con.Open();
            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lbl_username.Text=sdr[0].ToString()+" "+sdr[1].ToString();
            }
            con.Close();
        }

        protected void btn_home_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("../Dashboard.aspx");
            }
            catch (Exception)
            {

                Response.Redirect("/Dashboard.aspx");
            }
        }
        void restrict()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select type from [User] where (U_Id='" + Session["uid"] + "')", con);
            SqlDataReader sdr;
            con.Open();
            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                type = sdr[0].ToString();
            }
            con.Close();
            if (type == "Admin")
            {
                admin1.Visible = true;
                admin2.Visible = true;
                admin3.Visible = true;
                admin4.Visible = true;
                user1.Visible = false;
                user2.Visible = false;
                user3.Visible = false;
            }
            else if (type == "Department User")
            {

                admin1.Visible = false;
                admin2.Visible = false;
                admin3.Visible = false;
                admin4.Visible = false;
                user1.Visible = true;
                user2.Visible = true;
                user3.Visible = true;
            }
        }
    }
}