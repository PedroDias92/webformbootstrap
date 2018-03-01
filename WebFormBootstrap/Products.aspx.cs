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
	public partial class Products : System.Web.UI.Page
	{
        public static String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                BinProductRepeater();
            }
		}

        private void BinProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("procBindAllProducts", con);
                cmd.CommandType = CommandType.StoredProcedure;
                using(SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrProducts.DataSource = dtBrands;
                    rptrProducts.DataBind();
                }

            }
        }
    }
}