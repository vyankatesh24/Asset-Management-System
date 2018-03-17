using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"]!=null)
            {
                Response.Redirect("/Dashboard.aspx");
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            int did=0;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlDataReader sdr;
            SqlConnection con1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand("select U_Id from [User] where Username=@uname and Password=@pass ", con);
            cmd.Parameters.AddWithValue("@uname",TextBox11.Text);
            cmd.Parameters.AddWithValue("@pass",TextBox12.Text);
            con.Open();
            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                int uid =Convert.ToInt16( sdr[0].ToString());
                Session["uid"] = uid;
                SqlCommand cmd1 = new SqlCommand("select D_Id from [Department] where U_Id=@uid", con1);
                cmd1.Parameters.AddWithValue("uid", uid);

                try
                {
                    con1.Open();
                    did = (Int32)cmd1.ExecuteScalar();
                    con1.Close();

                }
                catch (Exception)
                {
                    
                } 
                if(did!=0)
                    Session["Department_Id"] = did; 
                Session["username"] = TextBox11.Text;
                //Response.Write("<script>alert('" + Session["uid"] + "+" + Session["Department_Id"] + "');</script>");
                Response.Redirect("Dashboard.aspx");
                
            }
            else 
            {
                Label3.Text="Login Failed";
            }
            con.Close();
        }
    }
}