using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class add_asset2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CompareValidator1.ValueToCompare = DateTime.Today.ToShortDateString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(txtquantity.Text);
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db1ConnectionString"].ConnectionString);
            //command to enter asset details
            DateTime date = Convert.ToDateTime(txtDate.Text.Trim());
            SqlCommand cmd2 = new SqlCommand("insert into [Asset] (AssetName,Description,Weight,DateOfPurchase,Price,BillNo,VendorName,VendorAddress,warranty,status) values (@assetname,@descr,@weight,@dop,@price,@BillNo,@vendname,@vendaddr,@warranty,'Working')", con);
            cmd2.Parameters.AddWithValue("@assetname", txtassetname.Text);
            cmd2.Parameters.AddWithValue("@descr",txt_descr.Text);
            cmd2.Parameters.AddWithValue("@weight", txtweight.Text);
            cmd2.Parameters.AddWithValue("@dop", date.Date);
            cmd2.Parameters.AddWithValue("@price", txtprice.Text);
            cmd2.Parameters.AddWithValue("@BillNo", txtbillnumber.Text);
            cmd2.Parameters.AddWithValue("@vendname", txtvendorname.Text);
            cmd2.Parameters.AddWithValue("@vendaddr", txtvendoraddress.Text);
            cmd2.Parameters.AddWithValue("@warranty", txtwarranty.Text);
            try
            {
                con.Open();
                for (int i = 0; i < qty; i++)
                {
                    int n = cmd2.ExecuteNonQuery();
                    if(n>0)
                    Label1.Text = " Records Inserted";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
      
    }
}