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
    public partial class Tester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account lusi = new Account();
            lusi.Login("lusi", "lusiana");

            lusi.Name = "Kucing";
            lusi.SaveProfile();

            Product p = lusi.SearchProduct("eidz_V0nQU2EpSp9_uHEtg", new List<SearchBy>() { SearchBy.ID }).SingleOrDefault();

            lusi.Purchase(p, 444);
        }
    }
}