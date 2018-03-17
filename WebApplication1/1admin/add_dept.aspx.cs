using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class add_dept2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                filldropdownlist1();
            }
        }
        void filldropdownlist1()
        {
            string fname, lname,newName;
            DropDownList1.Items.Clear();
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlDataReader sdr;
            SqlCommand cmd = new SqlCommand("Select U_fname,U_lname from [User] where type='Department User'", con);
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
            //sdr = cmd.ExecuteReader();
            sqlDa.Fill(dt);
            //int i = 0;
            //while (sdr.Read())
            //{
            //    DropDownList1.Items.Add(sdr[i].ToString());
            //}
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    fname = dt.Rows[i]["U_fname"].ToString();
                    lname= dt.Rows[i]["U_lname"].ToString();
                    newName = fname + " " + lname;
                    DropDownList1.Items.Add(newName);
                }
            }
            con.Close();
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select U_Id from [User] where U_fname=@ufname", con);
            cmd.Parameters.AddWithValue("ufname", DropDownList1.Text);
            con.Open();
            Int32 uid = (Int32)cmd.ExecuteScalar();
            SqlCommand cmd1 = new SqlCommand("insert into [Department] (D_name,Faculty,U_id) values(@dname,@dfaculty,@uid)", con);
            cmd1.Parameters.AddWithValue("@dname", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@dfaculty", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@uid", uid);
            int i= cmd1.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert(Department Added Successfully);</script>");
            }
            con.Close();
        }

    }
}