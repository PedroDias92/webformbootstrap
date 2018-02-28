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
    public partial class AddSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMAinCategory();
                BindSubCategoriesRptr();
            }
        }

        private void BindSubCategoriesRptr()
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select A.*,B.* from tblSubCategories A inner join tblCategories B on B.CatId=A.MainCatID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtrptrSubCategories = new DataTable();
                        sda.Fill(dtrptrSubCategories);
                        rptrSubCategory.DataSource = dtrptrSubCategories;
                        rptrSubCategory.DataBind();
                    }
                }
            }
        }

        private void BindMAinCategory()
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("insert into tblSubCategories values('" + txtSubCatName.Text + "','" + ddlCategory.SelectedItem.Value + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                txtSubCatName.Text = string.Empty;
                ddlCategory.ClearSelection();
                ddlCategory.Items.FindByValue("0").Selected = true;
                
            }
            BindSubCategoriesRptr();
        }
    }
}