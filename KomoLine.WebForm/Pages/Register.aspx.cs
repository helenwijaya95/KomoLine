using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected string Hello;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //Proses form
                Account a = new Account();//Guest
                try
                {
                    a.Username = username.Text;
                    a.Name = name.Text;
                    a.Email = email.Text;
                }
                catch (FormatException fe)
                {
                    ShowError(fe.Message);
                }

                if (password.Text == confirmpass.Text)
                {
                    try
                    {
                        a.Register(password.Text);
                        Session.Add("user", a);
                        Session.Add("message", string.Format("Welcome, {0}!", a.Name));
                        Response.Redirect("~");
                    }
                    catch (InvalidOperationException ioe)
                    {
                        ShowError(ioe.Message);
                    }
                }
                else
                {
                    ShowError("Password and confirm password doesn't match");
                }
                username.Text = "";
                name.Text = "";
                email.Text = "";
                password.Text = "";
                confirmpass.Text = "";
            }
        }

        private void ShowError(string message)
        {
            error.Text = message;
            error.Visible = true;
        }
    }
}