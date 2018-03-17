using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication1._1admin
{
    public partial class accinfo : System.Web.UI.Page
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
                //ds_assetacc.SelectCommand = "SELECT [A_Id], [AssetName], [Description], [AccessionNo], [DateOfPurchase] FROM [Asset] WHERE ([AccessionNo] IS NULL AND [D_Id]=(SELECT [D_Id] from [Department] WHERE ([U_Id]='" + uid + "')))";
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
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            Response.Write("<script>alert('1 Row Updated');</script>");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('"+GridView1.EditIndex+"');</script>");
            Label Label1 = GridView1.Rows[GridView1.EditIndex].FindControl("Label1") as Label;
            TextBox TextBox1=GridView1.Rows[GridView1.EditIndex].FindControl("TextBox1") as TextBox;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UPDATE Asset SET AccessionNo = @AccessionNo WHERE (A_Id = @a_id)",con);
            cmd.Parameters.AddWithValue("AccessionNo",TextBox1.Text);
            cmd.Parameters.AddWithValue("a_id",Label1.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            GridView1.EditIndex = -1;
        }

    }
}