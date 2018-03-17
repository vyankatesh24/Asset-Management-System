using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1._1user
{
    public partial class repair_req : System.Web.UI.Page
    {
        int uid;
        int did;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                getdeptID();
            }
        }
        void getdeptID()
        {
            try
            {
                uid = int.Parse(Session["uid"].ToString());
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("select D_Id from [Department] where U_Id=@uid", con);
                cmd.Parameters.AddWithValue("uid", uid);
                did = (Int32)cmd.ExecuteScalar();
                con.Close();
                Session["DeptId_repair_req"] = did;

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}