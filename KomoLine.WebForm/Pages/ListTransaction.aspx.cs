using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;


namespace KomoLine.WebForm.Pages
{
    public partial class ListTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                //Ambil data user
                Account a = Session["user"] as Account;
                //Account a = new Account();
                /* a.Username = "aaa";
                 a.Name = "Helen Wijaya";
                 a.PhoneNumber="0939848957948";
                 a.Email = "helz.w8312@gmail.com";
                 a.Register("password","admin");*/
                //a.Login("helen", "password");
                TransRepeater.DataSource = a.ViewTransactions();
                TransRepeater.DataBind();
        }
    }
}