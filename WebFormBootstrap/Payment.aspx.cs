using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormBootstrap
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                if (!IsPostBack)
                {
             

                    BindPriceData();
                }
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }

        private void BindPriceData()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                Int64 CartTotal = 0;
                Int64 Total = 0;
                if (CookieDataArray.Length > 0)
                {
                    
                    DataTable dtBrands = new DataTable(); //where we store info from the BD
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string SizeID = CookieDataArray[i].ToString().Split('-')[1];

                        String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName(" + SizeID + ") as SizeNamee," + SizeID + " as SizeIDD,SizeData.Name,SizeData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID) SizeData where A.PID=" + PID + "", con);
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {

                                sda.Fill(dtBrands);

                            }

                        }
                        CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                        Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                    }
                    
                    divPriceDetails.Visible = true;

                    spanCartTotal.InnerText = Total.ToString();
                    spanTotal.InnerText = "Rs. " + CartTotal.ToString();
                    spanDiscount.InnerText = (CartTotal - Total).ToString();

                    //meter info na tblPurchases
                    hdCartAmount.Value = Total.ToString();
                    hdCartDiscount.Value = (CartTotal - Total).ToString();
                    hdTotalPayed.Value = CartTotal.ToString();
                    
                }
                else
                {
                    //To show empty cart

                    Response.Redirect("~/Products.aspx");
                }
            }
            else
            {
                //To show empty cart
                Response.Redirect("~/Products.aspx");
            }
        }

        protected void btnPaytm_Click(object sender, EventArgs e)
        {
            if (Session["USERID"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "Paytm";
                string PaymentStatus = "NotPaid";
                DateTime DateofPurchase = DateTime.Now;
                string EMAILID = Session["USEREMAIL"].ToString();
                string CallbackURL = "http://www.callback.aspx";

                //Insert Data to tblPurchase
                String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblPurchase values('" + USERID + "','"
                        + hdPidSizeID.Value + "','" + hdCartAmount.Value + "','" + hdCartDiscount.Value + "','"
                        + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "','" + DateofPurchase + "','"
                        + txtName.Text + "','" + txtAddress.Text + "','" + txtPinCode.Text + "') select SCOPE_IDENTITY()", con);
                    con.Open();
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());

                    
                }
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }

       
    }
}