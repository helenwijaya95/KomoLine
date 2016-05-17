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

            double price = 0, qty;
            if (!Double.TryParse(Request.QueryString["qty"], out qty))
            {
                Session["Message"] = "Quantity can't be null";
                Response.Redirect("~/Pages/ProductDetail.aspx?id=" + Request.QueryString["id"]);
            }
            price = product.Price * qty;

            ProductPic.ImageUrl = "~/Image/product/"+product.PhotoPath;
            ProductName.Text = product.Name;
            StoreName.Text = product.Owner.Name;
            DescBarang.Text = product.Description;
            kategori.Text = product.Category;
            MinOrder.Text = product.MinimalOrder.ToString();
            Harga.Text = product.Price.ToString();
            quantity.Text = Request.QueryString["qty"];
            PrName.Text = product.Name;
            PrQty.Text = qty + "";
            PrPrice.Text = price + "";
            PrImage.ImageUrl = "~/Image/product/" + product.PhotoPath;
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
                    string url = string.Format("~/Pages/PurchaseHistory.aspx");
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