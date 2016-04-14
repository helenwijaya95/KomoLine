using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;


namespace KomoLine.WebForm.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                List<SearchBy> Opt = new List<SearchBy>() { SearchBy.Name};
                Account acc = new Account();
                acc.Login("helen","password");
                List<Product> res = acc.SearchProduct(tbSearch.Text, Opt);

                //var res = acc.SearchProduct(tbSearch.Text, Opt); --> klo gk tau tipe datanya
                dlProd.DataSource = res;
                dlProd.DataBind();
              
            }
            else
            {

            }
        }



    }
}