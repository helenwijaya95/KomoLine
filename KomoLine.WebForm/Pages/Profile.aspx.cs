using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = new Account();
            a.Login("lusilala", "lusi");
            profpic.ImageUrl = a.Photo;
            cemail.Text = a.Email;
            cusername.Text = a.Username;
            cname.Text = a.Name;
            caddress.Text = a.Address;
            cphnumb.Text = a.PhoneNumber;
        }

        protected void chpic_Click(object sender, EventArgs e)
        {
            
        }

        protected void editprof_Click(object sender, EventArgs e)
        {

        }
    }
}