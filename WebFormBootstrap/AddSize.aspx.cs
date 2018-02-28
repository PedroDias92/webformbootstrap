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
    public partial class AddSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindMainCategory();
                BindGender();
            }
        }

        

        private void BindGender()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
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
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
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

        private void BindBrand()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblBrands", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandId";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from tblSubCategories where MainCatID='" + MainCategoryID + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlSubCat.DataSource = dt;
                    ddlSubCat.DataTextField = "SubCatName";
                    ddlSubCat.DataValueField = "SubCatID";
                    ddlSubCat.DataBind();
                    ddlSubCat.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into tblSizes values('" + txtSizeName.Text + "','" + ddlBrand.SelectedItem.Value + "','" + ddlCategory.SelectedItem.Value + "','" +ddlSubCat.SelectedItem.Value  + "','" + ddlGender.SelectedItem.Value + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                txtSizeName.Text = "";
                ddlBrand.ClearSelection();
                ddlBrand.Items.FindByValue("0").Selected = true;
                ddlCategory.ClearSelection();
                ddlCategory.Items.FindByValue("0").Selected = true;
                ddlSubCat.ClearSelection();
                ddlSubCat.Items.FindByValue("0").Selected = true;
                ddlGender.ClearSelection();
                ddlGender.Items.FindByValue("0").Selected = true;

            }
        }

    }
}