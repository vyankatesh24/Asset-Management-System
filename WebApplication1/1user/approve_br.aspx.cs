using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace WebApplication1._1admin
{
    public partial class approve_br : System.Web.UI.Page
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
            table_btn.Visible = false;
            GridView1.SelectedIndex = -1;
        }

        protected void btn_app_req_Click(object sender, EventArgs e)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            Label Label2 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label2") as Label;
            //Response.Write("<script>alert('"+searchresultgrid.SelectedIndex+"');</script>");
            DateTime dop = DateTime.ParseExact(Label2.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture);
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Borrow_Request] SET Req_status='Approved' , Date_of_Approval=@appdate where ((A_Id=@aid) and (Date_of_pickup=@dop))", con);
            cmd.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));
            cmd.Parameters.AddWithValue("dop", dop.Date);
            cmd.Parameters.AddWithValue("appdate", DateTime.Now.Date);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }

        protected void btn_rej_req_Click(object sender, EventArgs e)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            Label Label2 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label2") as Label;
            DateTime dop = DateTime.ParseExact(Label2.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Borrow_Request] SET Req_status='Rejected' where ((A_Id=@aid) and (Date_of_pickup=@dop))", con);
            cmd.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));
            cmd.Parameters.AddWithValue("dop",dop.Date);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_reqstatus.SelectedItem.Text == "Pending")
            {
                table_btn.Visible = true;
            }
            else
            {
                table_btn.Visible = false;
            }
        }
    }
}