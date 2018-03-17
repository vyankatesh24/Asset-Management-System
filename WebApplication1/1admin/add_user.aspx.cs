using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class add_user2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("insert into [User] (U_fname,U_lname,U_email,U_contact,Username,Password,type) values (@fname,@lname,@email,@cont,@username,@password,@type)", con);
            cmd.Parameters.AddWithValue("@fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@lname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@email", TextBox3.Text);
            cmd.Parameters.AddWithValue("@cont", TextBox4.Text);
            cmd.Parameters.AddWithValue("@username", TextBox5.Text);
            cmd.Parameters.AddWithValue("@password", TextBox6.Text);
            cmd.Parameters.AddWithValue("@type", DropDownList1.Text);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Register Done.";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }   
            finally
            {
                con.Close();
            }
        }
    }
}