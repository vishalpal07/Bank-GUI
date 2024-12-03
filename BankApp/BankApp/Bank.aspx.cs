using System;

namespace BankApp
{
    public partial class Bank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRole.SelectedValue == "1")
            {
                Response.Redirect("Login.aspx");
            }
            else if (ddlRole.SelectedValue == "2")
            {
                Response.Redirect("Customer.aspx");
            }
        }
    }
}
