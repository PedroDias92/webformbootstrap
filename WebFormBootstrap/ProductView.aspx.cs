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
    public partial class ProductView : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["PID"] != null) { 
                if (!IsPostBack)
                {
                    BindProductImages();
                }
            }
            else
            {
                Response.Redirect("~/Products.aspx");
            }
        }

        private void BindProductImages()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblProductImages where PID="+PID+"", con);
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrImages.DataSource = dtBrands;
                    rptrImages.DataBind();
                }

            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }

        protected string GetActiveClass(int ItemIndex)
        {
            if (ItemIndex == 0) { return "active"; }
            else { return ""; }
        }
    }
}