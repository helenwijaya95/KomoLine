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
        protected int rate1, rate2;
        protected void Page_Load(object sender, EventArgs e)
        {
            string search;
            if(Request.QueryString["srcText"] == null)
            {
                search = "";
            }
            else
            {
                search = Request.QueryString["srcText"];
            }

            
            //System.Diagnostics.Debug.WriteLine("hello world");
            List<SearchBy> Opt = new List<SearchBy>() { SearchBy.Name };

            List<Product> res = acc.SearchProduct(search, Opt);

            /* foreach(Product p in res)
             {
                    
                   
             }*/
            //var res = acc.SearchProduct(tbSearch.Text, Opt); --> klo gk tau tipe datanya
            dlProd.DataSource = res;
            dlProd.DataBind();

                       
        }

        protected void btnDetail_Command(object sender, CommandEventArgs e)
        {
            string pID = e.CommandArgument.ToString();
            Response.Redirect("ProductDetail.aspx?prodId=" + pID);
           
        }


        protected void dlProd_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var product = e.Item.DataItem as Product;
            rate1 = int.Parse(product.Rating+"");
            System.Diagnostics.Debug.WriteLine(rate1 + "...rating1");
        }

        protected void dlProd_ItemCommand(object source, DataListCommandEventArgs e)
        {
            var product = e.Item.DataItem as Product;
            rate1 = int.Parse(product.Rating+"");
            System.Diagnostics.Debug.WriteLine(rate1 + "rating");
        }




    }
}