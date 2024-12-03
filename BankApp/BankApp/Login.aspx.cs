using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Replace with actual authentication logic
            if (username == "admin" && password == "password")
            {
                Response.Redirect("Admin.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
                lblMessage.CssClass = "error-message";
            }
        }
    }
}