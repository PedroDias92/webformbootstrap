using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace WebFormBootstrap
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btPassRec_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select * from Users1 where Email='"+tbEmailId.Text+"'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if(dt.Rows.Count != 0)
                {
                    String myGUID = Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);
                    SqlCommand cmd1 = new SqlCommand("insert into ForgotPassRequests values('"+myGUID+"','"+Uid+"',getdate())",con);
                    cmd1.ExecuteNonQuery();

                    //send email.
                    string ToEmailAddress = dt.Rows[0][3].ToString();
                    string UserName = dt.Rows[0][1].ToString();
                    string EmailBody = "Hi " + UserName + ",<br/><br/> Click the link below to reset your password <br/> http://localhost:58246/RecoverPassword.aspx?Uid="+myGUID;
                    MailMessage PassRecMail = new MailMessage("webformbootstrap@gmail.com", ToEmailAddress);
                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml = true;
                    PassRecMail.Subject = "Reset Password";

                    SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                    SMTP.Credentials = new NetworkCredential()
                    {
                        UserName = "webformbootstrap@gmail.com",
                        Password = "11223344aa"

                    };
                    SMTP.EnableSsl = true;
                    SMTP.Send(PassRecMail);

                    lblPassRec.Text = "Check your email to reset the password ";
                    lblPassRec.ForeColor = Color.Green;
                }
                else
                {
                    lblPassRec.Text = "OOps this email does not exists in our database ";
                    lblPassRec.ForeColor = Color.Red;
                }

                
                
            }
        }
    }
}