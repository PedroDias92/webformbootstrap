using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace WebFormBootstrap
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSignup_Click(object sender, EventArgs e)
        {
            if (tbUname.Text != "" && tbPass.Text != "" && tbCPass.Text != "" && tbEmail.Text != "" && tbName.Text != "")
            {
                if (tbPass.Text == tbCPass.Text)
                {
                    String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Users1 values('" + tbUname.Text + "','" + tbPass.Text + "','" + tbEmail.Text + "','" + tbName.Text + "','U')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        lblMsg.Text = "Registration Successfull";
                        lblMsg.ForeColor = Color.Green;
                        Response.Redirect("~/SignIn.aspx");
                    }
                }
                else
                {
                    lblMsg.Text = "Passwords do not match";
                    lblMsg.ForeColor = Color.Red;
                }
            }
            else
            {
                lblMsg.Text = "All Fields Are Mandatory!";
                lblMsg.ForeColor = Color.Red;
            }
        }
    }
}