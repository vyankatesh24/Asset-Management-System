using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1._1admin
{
    public partial class transfer_asset : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                filldropdownlist();
                Session.Remove("D_Id");
                Session.Remove("A_Name");
            }
        }
        void filldropdownlist()
        {
            drp_dept_name.Items.Clear();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select D_Id, D_name from [Department]", con);
            con.Open();
            try
            {
                drp_dept_name.DataSource = cmd.ExecuteReader();
                drp_dept_name.DataTextField = "D_name";
                drp_dept_name.DataValueField = "D_Id";
                drp_dept_name.DataBind();

            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }
        protected void gridtransfer_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {  
            
            gridtransfer.EditIndex = -1;

        }

        protected void gridtransfer_RowEditing(object sender, GridViewEditEventArgs e)
        {  
            gridtransfer.EditIndex = e.NewEditIndex;
        }

        protected void btn_transfer_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            DropDownList ddl_deptname = (DropDownList)gridtransfer.Rows[gridtransfer.EditIndex].FindControl("ddl_deptname");
            Label l1 = gridtransfer.Rows[gridtransfer.EditIndex].FindControl("Label1") as Label;
            SqlCommand cmd = new SqlCommand("update [asset] set D_Id=@did,AccessionNo=NULL,DateOfAllocate=@doa where A_Id=@aid", con);
            cmd.Parameters.AddWithValue("did", ddl_deptname.SelectedItem.Value);
            cmd.Parameters.AddWithValue("aid", Convert.ToInt16(l1.Text));
            cmd.Parameters.AddWithValue("doa",DateTime.Now.Date);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            gridtransfer.DataBind();
            gridtransfer.EditIndex = -1;
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
           /*DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("Data Source=.\\sqlexpress;Initial Catalog=db1;Integrated Security=True;Pooling=False");
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT Asset.A_Id, Asset.AssetName, Asset.Description, Department.D_name,Asset.AccessionNo FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE ((Asset.D_Id ='"+drp_dept_name.SelectedItem.Value+"') OR( Asset.AssetName='"+txt_aname.Text+"'))", con);
            try
            {
                sda.Fill(dt);
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            if (dt.Rows.Count > 0)
            {
                gridtransfer.DataSource = dt;
                gridtransfer.DataBind();
            }
            con.Close();*/
            String a_name = "%";
            if (txt_aname.Text != "")
            {
                a_name = txt_aname.Text;
                //ds_transfer_grid.SelectCommand = "SELECT Asset.A_Id, Asset.AssetName, Asset.Description, Department.D_name,Asset.AccessionNo FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE ((Asset.D_Id ='" + drp_dept_name.SelectedItem.Value + "') OR ( Asset.AssetName='" + txt_aname.Text + "'))";
            }

            //ds_transfer_grid.FilterExpression="";
            Session.Add("D_Id", drp_dept_name.SelectedItem.Value);
            Session.Add("A_Name", a_name);
        }
    }
}