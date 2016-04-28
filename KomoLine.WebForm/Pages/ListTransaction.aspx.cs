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
        Account acc;
        protected void Page_Load(object sender, EventArgs e)
        {
            acc = Session["user"] as Account ?? new Account();
            try
            {
                TransRepeater.DataSource = acc.ViewTransactions();
                TransRepeater.DataBind();
            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
                Response.Redirect("~");
            }
        }
    }
}