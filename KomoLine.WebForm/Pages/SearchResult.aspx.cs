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
        protected Account acc = new Account();
        protected void Page_Load(object sender, EventArgs e)
        {        
           
                List<SearchBy> Opt = new List<SearchBy>() { SearchBy.Name};
               
                List<Product> res = acc.SearchProduct("", Opt);

                //var res = acc.SearchProduct(tbSearch.Text, Opt); --> klo gk tau tipe datanya
                dlProd.DataSource = res;
                dlProd.DataBind();
            
        }

        protected void btnDetail_Command(object sender, CommandEventArgs e)
        {
            string pID = e.CommandArgument.ToString();
            Response.Redirect("ProductDetail.aspx?prodId=" + pID);
           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            List<SearchBy> Opt = new List<SearchBy>() { SearchBy.Name };

            List<Product> res = acc.SearchProduct(tbSearch.Text, Opt);

            /* foreach(Product p in res)
             {
                    
                   
             }*/
            //var res = acc.SearchProduct(tbSearch.Text, Opt); --> klo gk tau tipe datanya
            dlProd.DataSource = res;
            dlProd.DataBind();
        }




    }
}