using KomoLine.Data.Controller;
using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm.Pages
{
    public partial class Template : System.Web.UI.MasterPage
    {
        protected Account Acc;
        protected string AlertMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            Acc = Session["user"] as Account ?? new Account();
            LoginPlaceholder.Visible = Acc.Role == UserRole.Guest;
            UserPlaceholder.Visible = Acc.Role != UserRole.Guest;
            if (Acc.Role != UserRole.Guest)
            {
                LinkToProfile.Text = Acc.Name + "'s Profile";
            }
            if (Session["welcome"] != null)
            {
                AlertPlaceholder.Visible = true;
                AlertMessage = "Welcome, " + Acc.Name + "!";
                Session.Remove("welcome");
            }
        }

        protected void LinkToSearch_Click(object sender, EventArgs e)
        {
            String link = "~/Pages/SearchResult.aspx?srcText=" + txtsearch.Text;
            Response.Redirect(link);
        }

        protected void LinkToLogout_Click(object sender, EventArgs e)
        {
            try
            {
                Acc.LogOut();
                Session.Remove("user");
                Response.Redirect("~");
            }
            catch (Exception ex)
            {
                AlertMessage = ex.Message;
                AlertPlaceholder.Visible = true;
            }
        }
    }
}