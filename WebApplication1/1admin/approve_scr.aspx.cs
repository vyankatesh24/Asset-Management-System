using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1._1admin
{
    public partial class approve_scr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_app_req_Click(object sender, EventArgs e)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            Label Label2 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label2") as Label;

            //Response.Write("<script>alert('"+searchresultgrid.SelectedIndex+"');</script>");
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Scrap_Request] SET Req_status='Approved',Date_of_Approval=@date where (Sr_Id=@srid)", con);
            cmd.Parameters.AddWithValue("srid",Convert.ToInt16(Label1.Text));
            cmd.Parameters.AddWithValue("date", DateTime.Today.Date);
            //Change Status
            SqlCommand cmd1 = new SqlCommand("Update Asset Set status='Scraping' where A_Id=@aid", con);
            cmd1.Parameters.AddWithValue("aid", Convert.ToInt16(Label2.Text));

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                cmd1.ExecuteNonQuery();
            }
            con.Close();
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }

        protected void btn_rej_req_Click(object sender, EventArgs e)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            Label Label2 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label2") as Label;

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Scrap_Request] SET Req_status='Rejected' where (Sr_Id=@srid)", con);
            cmd.Parameters.AddWithValue("srid", Convert.ToInt16(Label1.Text));
            //change status
            SqlCommand cmd1 = new SqlCommand("Update Asset Set status='Working' where A_Id=@aid", con);
            cmd1.Parameters.AddWithValue("aid", Convert.ToInt16(Label2.Text));

            int i = cmd.ExecuteNonQuery();
            {
                cmd1.ExecuteNonQuery();
            }
            con.Close();
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_reqstatus.SelectedItem.Text=="Pending")
            {
                btn_rej_req.Visible = true;
                btn_app_req.Visible = true;
            }
            else
            {
                btn_app_req.Visible = false;
                btn_rej_req.Visible = false;
            }
        }

        protected void ddl_reqstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
                btn_app_req.Visible = false;
                btn_rej_req.Visible = false;
                GridView1.SelectedIndex = -1;
        }
    }
}