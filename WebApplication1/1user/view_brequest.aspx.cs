using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1._1user
{
    public partial class view_brequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string uname;
            int uid;
            int did;
            try
            {
                uname = Session["username"].ToString();
                uid = int.Parse(Session["uid"].ToString());
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select D_Id from [Department] where U_Id=@uid", con);
                cmd.Parameters.AddWithValue("uid", uid);
                did = (Int32)cmd.ExecuteScalar();
                con.Close();
                Session["D_Id"] = did;

            }
            catch (Exception ex)
            {

            }
        }
    }
}