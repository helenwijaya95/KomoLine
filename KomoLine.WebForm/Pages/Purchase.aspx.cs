using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm.Pages
{
    public partial class Purchase : System.Web.UI.Page
    {
        Product product;
        Account acc;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                acc = Session["user"] as Account ?? new Account();
                product = acc.GetProduct(Request.QueryString["id"]);
            }
            catch (ArgumentException ex)
            {
                Session["message"] = ex.Message;
                error.Text = ex.Message;
                Response.Redirect("~");
            }
        }

        protected void PurchaseButton_Click(object sender, EventArgs e)
        {
            try
            {
                double qty;
                if (double.TryParse(Request.QueryString["qty"], out qty))
                {
                    acc.Purchase(product, qty);
                    Session["message"] = "Pembelian Anda berhasil diproses,silahkan konfirmasi pembelian!";
                    string url = string.Format("~/Pages/HistoryPurchasing.aspx");
                    Response.Redirect(url);
                }
                else
                {
                    Session["message"] = "Maaf, kami tidak yakin bisa menjual " + Request.QueryString["qty"] + " kg " + product.Name;
                    string url = string.Format("~/Pages/ProductDetail.aspx?id={0}", Request.QueryString["id"]);
                    Response.Redirect(url);
                }
            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
                error.Text = ex.Message;
                string url = string.Format("~/Pages/Purchase.aspx?id={0}&qty={1}", Request.QueryString["id"], Request.QueryString["qty"]);
                Response.Redirect(url);
            }
        }
    }
}