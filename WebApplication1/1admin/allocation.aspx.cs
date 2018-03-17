using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class allocation : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            //Label l1 = GridView1.Rows[GridView1.EditIndex].FindControl("Label2") as Label;
            //Response.Write("<script>alert('"+GridView1.EditIndex.ToString()+l1.Text.ToString()+"');</script");

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("Select D_Id, D_name from [Department]", con);
                con.Open();
                try
                {
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = "D_name";
                    DropDownList1.DataValueField = "D_Id";
                    DropDownList1.DataBind();

                }

                catch (Exception ex)
                {

                }
                finally 
                {
                    con.Close();
                }

            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            DropDownList dropdownlist1 = (DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("DropDownList1");
            Label l1 = GridView1.Rows[GridView1.EditIndex].FindControl("Label1") as Label;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("update [Asset] set D_Id=@did,DateOfAllocate=@DateOfAllocate where A_Id=@aid", con);
            cmd.Parameters.AddWithValue("did", dropdownlist1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("DateOfAllocate", DateTime.Today.ToShortDateString());
            cmd.Parameters.AddWithValue("aid", Convert.ToInt16(l1.Text));
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            GridView1.EditIndex = -1;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}