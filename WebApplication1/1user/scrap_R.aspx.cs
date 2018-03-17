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
    public partial class scrap_R : System.Web.UI.Page
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
                Session["did"] = did;
                con.Close();
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
            /*DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("Data Source=.\\sqlexpress;Initial Catalog=db1;Integrated Security=True;Pooling=False");
            con.Open();
            SqlCommand cmd = new SqlCommand("select D_Id from [Department] where U_Id=@uid",con);
            cmd.Parameters.AddWithValue("uid",uid);
            did = (Int32)cmd.ExecuteScalar();
           SqlDataAdapter sda = new SqlDataAdapter("SELECT [AssetName], [A_Id], [DateOfPurchase], [Price], [AccessionNo] FROM [Asset] WHERE (([AssetName] LIKE '%' + '" + txtaname.Text + "' + '%') OR ([AccessionNo] = '" + txtaccno.Text + "')) AND ([D_Id] ='"+did+"')", con);
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                searchresultgrid.DataSource = dt;
                searchresultgrid.DataBind();
            }
            con.Close();*/
            //Response.Write("<script>alert('" + did.ToString() + "');</script>");
            Session.Add("accno", txtaccno.Text);
            Session.Add("aname",txtaname.Text);

        }

        protected void searchresultgrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_scr.Visible = true;
        }

        protected void btn_scr_Click(object sender, EventArgs e)
        {
            Label Label1 = searchresultgrid.Rows[searchresultgrid.SelectedIndex].FindControl("Label1") as Label;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [Scrap_Request] (A_Id,Date_of_request,Req_status) values(@aid,@dor,@reqs)", con);
            cmd.Parameters.AddWithValue("aid",Convert.ToInt16(Label1.Text));
            cmd.Parameters.AddWithValue("dor", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("reqs","Pending");
            //change status
            SqlCommand cmd1 = new SqlCommand("Update Asset Set status='Scrap Requested' where A_Id=@aid", con);
            cmd1.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));

            int i = cmd.ExecuteNonQuery();
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
        
    }
}