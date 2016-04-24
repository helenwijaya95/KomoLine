using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //Proses form
                Account a = new Account();//Guest
                try
                {
                    a.Login(IDTextBox.Text, PasswordTextBox.Text);
                    Session.Add("user", a);
                    Response.Redirect("~");
                }
                catch (Exception ex)
                {
                    ErrorLabel.Text = ex.Message;
                    ErrorLabel.Visible = true;
                }
                IDTextBox.Text = "";
                PasswordTextBox.Text = "";
            }
            else
            {

            }
        }
    }
}