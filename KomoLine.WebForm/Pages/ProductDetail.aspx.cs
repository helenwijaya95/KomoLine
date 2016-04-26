using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;
namespace KomoLine.WebForm.Pages
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public Product product;
        protected void Page_Load(object sender, EventArgs e)
        {
            string idProduct = Request.QueryString["prodId"];
            Account acc = new Account();

            product = acc.GetProduct(idProduct);
            ProductImage.ImageUrl = "~/Image/" + product.PhotoPath;
            buyLink.NavigateUrl = "~/Pages/Purchase.aspx?idProd="+product.ID;
        }
    }
}