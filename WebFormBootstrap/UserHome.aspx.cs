using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormBootstrap
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["USERNAME"] != null)
            {
                btnSignOut.Visible = true;
                btnSignIn.Visible = false;
                lblSuccess.Text = "Login Success, Welcome "+Session["USERNAME"].ToString();
            }
            else
            {
                btnSignOut.Visible = false;
                btnSignIn.Visible = true;
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSignOut_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }
}