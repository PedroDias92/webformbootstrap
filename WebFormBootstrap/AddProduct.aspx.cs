using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

                //Insert Size Quantatity
                for(int i = 0; i < cblSize.Items.Count; i++)
                {
                    if(cblSize.Items[i].Selected == true)
                    {
                        Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                        int Quantity = Convert.ToInt32(txtQuantity.Text);

                        SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQuantity values('" + PID+ "','" + SizeID + "','" + Quantity + "')", con);
                        
                        cmd2.ExecuteNonQuery();
                    }
                }
                //Insert and upload Images
                if (fuImg01.HasFile)
                {
                    Console.Write(txtPName.Text.ToString().Trim());
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "01" + Extention);
   
                    SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "01" + "','" + Extention.ToString().Trim() + "')", con);
                    cmd3.ExecuteNonQuery();
                }
                if (fuImg02.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                    fuImg02.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "02" + Extention);

                    SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "02" + "','" + Extention.ToString().Trim() + "')", con);
                    cmd4.ExecuteNonQuery();
                }
                if (fuImg03.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                    fuImg03.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "03" + Extention);

                    SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "03" + "','" + Extention.ToString().Trim() + "')", con);
                    cmd5.ExecuteNonQuery();
                }
                if (fuImg04.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                    fuImg04.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "04" + Extention);

                    SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "04" + "','" + Extention.ToString().Trim() + "')", con);
                    cmd6.ExecuteNonQuery();
                }
                if (fuImg05.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(fuImg05.PostedFile.FileName); Extention.ToString().Trim();
                    fuImg05.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "05" + Extention);

                    SqlCommand cmd7 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtPName.Text.ToString().Trim() + "05" + "','" + Extention.ToString().Trim() + "')", con);
                    cmd7.ExecuteNonQuery();
                }
            }
        }
    }
}
