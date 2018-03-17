using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1._1user
{
    public partial class view_asset : System.Web.UI.Page
    {
        string uname;
        int uid;
        int did;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                uname = Session["username"].ToString();
                uid = int.Parse(Session["uid"].ToString());
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select D_Id from [Department] where U_Id=@uid", con);
                cmd.Parameters.AddWithValue("uid", uid);
                did = (Int32)cmd.ExecuteScalar();
                Session["Dept_ID"] = did;
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }  
        }
    }
}