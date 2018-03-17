using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.user
{
    public partial class repair_R : System.Web.UI.Page
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
                con.Close();
                Session["D_Id"] = did;

            }
            catch (Exception ex)
            {

            }
            if (!this.IsPostBack)
            {
                Session.Remove("aname");
                Session.Remove("accno");
            }
        }

        protected void searchasset_Click(object sender, EventArgs e)
        {
            String aname = "%";
            String Accno = "%";
            if (txtaccno.Text != "")
            {
                Accno = txtaccno.Text;
                Session.Add("accno",Accno);
            }
            if (txtaname.Text != "")
            {
                aname = txtaname.Text;
                Session.Add("aname",aname);
            }
            //fillgrid(aname,Accno);
            /*DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select D_Id from [Department] where U_Id=@uid", con);
            cmd.Parameters.AddWithValue("uid", uid);
            did = (Int32)cmd.ExecuteScalar();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT [AssetName], [A_Id], [DateOfAllocate], [Price], [AccessionNo] FROM [Asset] WHERE (([AssetName] LIKE '%' + '" + txtaname.Text + "' + '%') OR ([AccessionNo] = '" + txtaccno.Text + "')) AND ([D_Id] ='" + did + "')", con);
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                searchresultgrid.DataSource = dt;
                searchresultgrid.DataBind();
            }
            con.Close();*/
        }

        void fillgrid(string aname,string accno)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select D_Id from [Department] where U_Id=@uid", con);
            cmd.Parameters.AddWithValue("uid", uid);
            did = (Int32)cmd.ExecuteScalar();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT [AssetName], [A_Id], [DateOfAllocate], [Price], [AccessionNo] FROM [Asset] WHERE (([AssetName] LIKE '%' + '" + aname + "' + '%') AND ([AccessionNo] LIKE '%' + '" + accno + "' + '%')) AND ([D_Id] ='" + did + "')", con);
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                searchresultgrid.DataSource = dt;
                searchresultgrid.DataBind();
            }
            con.Close();
        }

        protected void btn_rep_req_Click(object sender, EventArgs e)
        {
            Label Label1 = searchresultgrid.Rows[searchresultgrid.SelectedIndex].FindControl("Label1") as Label;
            //Response.Write("<script>alert('"+searchresultgrid.SelectedIndex+"');</script>");
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [Repair_Request] (A_Id,Date_of_request,amount_est,Req_status) values(@aid,@dor,@aest,@reqs)", con);
            cmd.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));
            cmd.Parameters.AddWithValue("dor", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("aest",txt_amt_est.Text);
            cmd.Parameters.AddWithValue("reqs", "Pending");
            //change status
            SqlCommand cmd1 = new SqlCommand("Update Asset Set status='Repair Requested' where A_Id=@aid", con);
            cmd1.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));

            int i=cmd.ExecuteNonQuery();
            if (i > 0)
            {
                cmd1.ExecuteNonQuery();

                Response.Write("<script>alert('Request Submited');</script>");
            }
            else
            {
                Response.Write("<script>alert('Request Failed');</script>");
            }
            con.Close();
            searchresultgrid.SelectedIndex = -1;
            searchresultgrid.DataBind();
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            searchresultgrid.SelectedIndex = -1;
        }

        protected void searchresultgrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            table.Visible = true;
            btn_reset.Focus();
        }
    }
}