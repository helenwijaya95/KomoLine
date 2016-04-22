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

                if (id.Text != null && sandi.Text != null)
                {
                    a.Login(id.Text, sandi.Text);
                    //Session.Contents(id);
                }
                else
                {
                    error.Text = "ID atau kata sandi salah!";
                    error.Visible = true;
                }
                id.Text = "";
                sandi.Text = "";
            }
            else
            {

            }
        }
    }
}