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
        public string AlertMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            Acc = Session["user"] as Account ?? new Account();
            LoginPlaceholder.Visible = Acc.Role == UserRole.Guest;
            UserPlaceholder.Visible = Acc.Role != UserRole.Guest;
            if (Acc.Role != UserRole.Guest)
            {
                LinkToProfile.Text = Acc.Name + "'s Profile";
            }
            if (Session["message"] != null)
            {
                ShowError(Session["message"] as string);
                Session.Remove("message");
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
                ShowError(ex.Message);
            }
        }

        public void ShowError(string Message)
        {
            AlertMessage = Message;
            AlertPlaceholder.Visible = true;
        }
    }
}