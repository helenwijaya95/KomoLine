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
                try
                {
                    Account a = new Account();//Guest
                    a.Username = username.Text;
                    a.Name = name.Text;
                    a.Email = email.Text;
                    
                    if(String.Equals(password.Text, confirmpass.Text))
                    {
                        a.Register(password.Text);
                    }
                    else
                    {
                        error.Text = "Password and confirm password doesn't match";
                        error.Visible = true;
                    }
                    
                }
                catch (FormatException fe)
                {
                    error.Text = fe.Message;
                    error.Visible = true;
                }
                username.Text = "";
                name.Text = "";
                email.Text = "";
                password.Text = "";
                confirmpass.Text = "";
            }
            else
            {

            }
		}
	}
}