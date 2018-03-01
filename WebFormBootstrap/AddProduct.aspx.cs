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
    public partial class AddProduct : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrandsRptr();
                BindMainCategory();
                BindGender();
                ddlGender.Enabled = false;
                ddlSubCategory.Enabled = false;
            }

        }

        private void BindGender()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblGender", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "Gendername";
                    ddlGender.DataValueField = "GenderId";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        private void BindMainCategory()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblCategories", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatId";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                    
                }
                
            }
        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblSubCategories where MainCatID='" + MainCategoryID + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));


                    ddlSubCategory.Enabled = true;
                }
                
            }
        }
        private void BindBrandsRptr()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblBrands", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlBrands.DataSource = dt;
                    ddlBrands.DataTextField = "Name";
                    ddlBrands.DataValueField = "BrandId";
                    ddlBrands.DataBind();
                    ddlBrands.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblSizes where BrandID='" + ddlBrands.SelectedItem.Value + "' and CategoryID='" + ddlCategory.SelectedItem.Value + "' and SubCategoryID='" + ddlSubCategory.SelectedItem.Value + "' and GenderID='" + ddlGender.SelectedItem.Value + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    cblSize.DataSource = dt;
                    cblSize.DataTextField = "SizeName";
                    cblSize.DataValueField = "SizeID";
                    cblSize.DataBind();
                    
                }
            }
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlSubCategory.SelectedIndex != 0)
            {
                ddlGender.Enabled = true;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("procInsertProducts", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PName", txtPName.Text);
                cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
                cmd.Parameters.AddWithValue("@PSelPrice", txtSelPrice.Text);
                cmd.Parameters.AddWithValue("@PBrandID",ddlBrands.SelectedItem.Value );
                cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PSubCatID", ddlSubCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PGenderID", ddlGender.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PDescription", txtDesc.Text);
                cmd.Parameters.AddWithValue("@PProductDetails", txtPDetails.Text);
                cmd.Parameters.AddWithValue("@PMaterialCare", txtMatCare.Text);
                if (cbFD.Checked == true) {cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());}
                                     else { cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString()); }
                if (cb30Ret.Checked == true) { cmd.Parameters.AddWithValue("@30DayRet", 1.ToString()); }
                                     else { cmd.Parameters.AddWithValue("@30DayRet", 0.ToString()); }
                if (cbCOD.Checked == true) { cmd.Parameters.AddWithValue("@COD", 1.ToString()); }
                                     else { cmd.Parameters.AddWithValue("@COD", 0.ToString()); }


                con.Open();
                Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());
            }
        }
    }
}