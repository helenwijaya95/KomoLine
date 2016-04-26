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
            string idProduct = Request.QueryString["id"];
            Account acc = new Account();
            try
            {
                product = acc.GetProduct(idProduct);
                ProductImage.ImageUrl = "~/Image/" + product.PhotoPath;
            }
            catch (ArgumentException ex)
            {
                Session["message"] = ex.Message;
                Response.Redirect("~");
            }
        }

        protected void BuyButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string qty = QuantityValue.Value;
            string url = string.Format("~/Pages/Purchase.aspx?id={0}&qty={1}", id, qty);
            Response.Redirect(url);
        }
    }
}