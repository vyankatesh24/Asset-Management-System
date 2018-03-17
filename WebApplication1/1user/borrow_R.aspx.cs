using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.user
{
    public partial class borrow_R : System.Web.UI.Page
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
                Session["Dept_Id"] = did;
            }
            catch (Exception ex)
            {

            }
            if (!this.IsPostBack)
            {
                filldropdownlist();
                Session.Remove("A_Name");
                Session.Remove("D_Id");
                CompareValidator3.ValueToCompare = DateTime.Today.ToShortDateString();
                CompareValidator4.ValueToCompare = DateTime.Today.ToShortDateString();
            }
        }
        void filldropdownlist()
        {
            ddl_dept_name.Items.Clear();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select D_Id, D_name from [Department] where U_Id !='" + uid + "' ", con);
            con.Open();
            try
            {
                ddl_dept_name.DataSource = cmd.ExecuteReader();
                ddl_dept_name.DataTextField = "D_name";
                ddl_dept_name.DataValueField = "D_Id";
                ddl_dept_name.DataBind();

            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            //DataTable dt = new DataTable();
            //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            //con.Open();
            //SqlDataAdapter  sda = new SqlDataAdapter("SELECT Asset.A_Id, Asset.AssetName, Asset.Description, Asset.Price, Department.D_name FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Asset.D_Id = '" + ddl_dept_name.SelectedItem.Value + "') And (Asset.AssetName LIKE '%' + '" + TextBox1.Text + "' + '%')", con);
            //if (TextBox1.Text=="" && ddl_dept_name.SelectedItem.Text=="Any")
            //{
            //    sda = new SqlDataAdapter("SELECT [A_Id], [AssetName], [Description], [Price] FROM [Asset] WHERE (([D_Id] = '" + ddl_dept_name.SelectedItem.Value + "') OR ([AssetName] LIKE '%' + '" + TextBox1.Text + "' + '%'))", con);
            //}
            //if (!(TextBox1.Text == "") && !(ddl_dept_name.SelectedItem.Text == "Any"))
            //{
            //    sda = new SqlDataAdapter("SELECT Asset.A_Id, Asset.AssetName, Asset.Description, Asset.Price, Department.D_name FROM Asset INNER JOIN Department ON Asset.D_Id = Department.D_Id WHERE (Asset.D_Id = '" + ddl_dept_name.SelectedItem.Value + "') And (Asset.AssetName LIKE '%' + '" + TextBox1.Text + "' + '%')", con);
            //}
            //sda.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    GridView1.DataSource = dt;
            //    GridView1.DataBind();
            //}
            //con.Close();
            Session.Add("A_Name",txtaname.Text);
            Session.Add("D_Id",ddl_dept_name.SelectedValue);
        }

        protected void btn_borrow_req_Click(object sender, EventArgs e)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            DateTime date = Convert.ToDateTime(txt_datefrom.Text.Trim());
            DateTime date1 = Convert.ToDateTime(txt_dateto.Text.Trim());

            if (check_availiability(date,date1))
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [Borrow_Request] (A_Id,Date_of_request,Date_of_pickup,Date_of_return,Req_status,Requesting_dept_id) values(@aid,@dor,@d1,@d2,@reqs,@did)", con);
                cmd.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));
                cmd.Parameters.AddWithValue("dor", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("d1", date.Date);
                cmd.Parameters.AddWithValue("d2", date1.Date);
                cmd.Parameters.AddWithValue("reqs", "Pending");
                cmd.Parameters.AddWithValue("did",did);
                try
                {
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Write("<script>alert('Request Submited');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Request Failed');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close();
                }

                GridView1.SelectedIndex = -1;
                table_borrow.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Asset is Not Available on this Date.First check Availiability');</script>");
            }
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            table_borrow.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                table_borrow.Visible = true;
                btn_reset.Focus();
            }
        }

        protected void btn_chk_avail_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(txt_date.Text.Trim());
            DateTime date1 = Convert.ToDateTime(txt_date1.Text.Trim());
            if (check_availiability(date,date1))
            {
                Response.Write("<script>alert('Asset Available on this Date.');</script>");

            }
            else
            {
                Response.Write("<script>alert('Asset is Not Available on this Date.');</script>");
            }
        }
        bool check_availiability(DateTime date,DateTime date1)
        {
            Label Label1 = GridView1.Rows[GridView1.SelectedIndex].FindControl("Label1") as Label;
            SqlDataReader sdr;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * from [Borrow_Request] where (A_Id=@aid) AND ((Date_of_pickup BETWEEN @date and @date1) OR (Date_of_return BETWEEN @date and @date1 ) OR (@date BETWEEN Date_of_pickup and Date_of_return ) OR (@date1 BETWEEN Date_of_pickup and Date_of_return ))", con);
            cmd.Parameters.AddWithValue("date", date.Date);
            cmd.Parameters.AddWithValue("date1", date1.Date);
            cmd.Parameters.AddWithValue("aid", Convert.ToInt16(Label1.Text));
            con.Open();
            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                con.Close();
                return false;
            }
            else
            {
                con.Close();
                return true;          
            }
        }

       /* protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime date = Convert.ToDateTime(txt_date.Text.Trim());
            DateTime date1 = Convert.ToDateTime(txt_date1.Text.Trim());
            int result=DateTime.Compare(date,date1);
            if (result < 0)
                args.IsValid = false;
            else
                args.IsValid = true;
        }*/
    }
}