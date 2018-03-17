using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1._1user
{
    public partial class view_srequest : System.Web.UI.Page
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

        protected void ddl_reqstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            table.Visible = false;
            GridView1.SelectedIndex = -1;
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            Label Label2 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label2") as Label;

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Scrap_Request] SET Amount_Released=@amt where (Sr_Id=@srid)", con);
            cmd.Parameters.AddWithValue("srid", Convert.ToInt16(Label1.Text));
            cmd.Parameters.AddWithValue("amt", txt_amt.Text);

            SqlCommand cmd1 = new SqlCommand("Update Asset Set status='Scraped' where A_Id=@aid", con);
            cmd1.Parameters.AddWithValue("aid", Convert.ToInt16(Label2.Text));

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                cmd1.ExecuteNonQuery();
                table.Visible = false;

            }
            con.Close();
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            table.Visible = false;
            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_reqstatus.SelectedItem.Text == "Approved")
            {
                table.Visible = true;
            }
            else
            {
                table.Visible = false;
            }
        }
    }
}