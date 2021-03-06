﻿using System;
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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartProducts();
            }
        }

        private void BindCartProducts()
        {
            if(Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                Int64 CartTotal = 0;
                Int64 Total = 0;
                if(CookieDataArray.Length > 0)
                {
                    h5NoItems.InnerText = "My Cart (" + CookieDataArray.Length + " Items)";
                    DataTable dtBrands = new DataTable(); //where we store info from the BD
                    for (int i = 0;i<CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string SizeID = CookieDataArray[i].ToString().Split('-')[1];

                        String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName("+SizeID+") as SizeNamee,"+SizeID+ " as SizeIDD,SizeData.Name,SizeData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID) SizeData where A.PID=" + PID + "", con);
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                
                                sda.Fill(dtBrands);
                                
                            }

                        }
                        CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                        Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                    }
                    rptrCartProducts.DataSource = dtBrands;
                    rptrCartProducts.DataBind();
                    divPriceDetails.Visible = true;

                    spanCartTotal.InnerText = Total.ToString();
                    spanTotal.InnerText = "Rs. " + CartTotal.ToString();
                    spanDiscount.InnerText = (CartTotal - Total).ToString();
                }
                else
                {
                    //To show empty cart
                    h5NoItems.InnerText = "Your Shopping Cart is empty";
                    divPriceDetails.Visible = false;
                }
            }
            else
            {
                //To show empty cart
                h5NoItems.InnerText = "Your Shopping Cart is empty";
                divPriceDetails.Visible = false;
            }
        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            Button btn = (Button)(sender);
            string PIDSIZE = btn.CommandArgument;

            List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
            CookiePIDList.Remove(PIDSIZE);
            string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
            if (CookiePIDUpdated == "")
            {
                HttpCookie CartProducts = Request.Cookies["CartPID"];
                CartProducts.Values["CartPID"] = null;
                CartProducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);

            }
            else
            {
                HttpCookie CartProducts = Request.Cookies["CartPID"];
                CartProducts.Values["CartPID"] = CookiePIDUpdated;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);

            }
            Response.Redirect("~/Cart.aspx");
        }

        protected void btnBuyNow_Click1(object sender, EventArgs e)
        {
            if(Session["USERNAME"] != null)
            {
                Response.Redirect("~/Payment.aspx");
            }
            else
            {
                Response.Redirect("~/SignIn.aspx?rurl=cart"); //return URL, assim pode-se voltar para a parte do pagamento
            }
        }
    }
}