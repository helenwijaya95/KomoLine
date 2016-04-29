using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;

namespace KomoLine.WebForm.Pages
{

    public partial class ReviewRate : System.Web.UI.Page
    {
        public Product prod;
        protected Transaction trans;
        protected Account acc;
        public Transaction transByID;
        protected void Page_Load(object sender, EventArgs e)
        {
            acc = Session["user"] as Account ?? new Account();
        }

        protected void rate1_Command(object sender, CommandEventArgs e)
        {
            try
            {
                transByID = acc.GetTransaction((string)Session["transid"]);
                string temp = e.CommandArgument.ToString();
                string[] temp2 = temp.Split(',');
                acc.RatePurchase(transByID, int.Parse(temp2[0]));
                Session["message"] = "Rating Produk berhasil. Terima kasih telah berbelanja di KomoLine.";
                Response.Redirect("~/Pages/ReviewRate.aspx");
                
            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
            }
        }

        protected void btnKirim_Click(object sender, EventArgs e)
        {
            try
            {
                transByID = acc.GetTransaction((string)Session["transid"]);
                string rev = tbReview.Text;
                acc.ReviewPurchase(transByID, rev);
                Session["message"] = "Review Produk berhasil. Terima kasih telah berbelanja di KomoLine.";
                Response.Redirect("~/Pages/ReviewRate.aspx");
            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
            }
        }

        protected void btnTransID_Click(object sender, EventArgs e)
        {
            try
            {
                //string idProduct = Request.QueryString["prodId"];
                string idTrans = transID.Text;
                Session.Add("transid", idTrans);
                transByID = acc.GetTransaction((string)Session["transid"]);
                //string idProduct = "BK1";
                tbReview.Text = transByID.Review;
                prod = acc.GetProduct(transByID.Product.ID);
                prodImg.ImageUrl = "~/Image/product/" + prod.PhotoPath;
                detProduct.Visible = true;
            }
            catch (Exception ex)
            {
                Session["message"] = ex.Message;
            }
        }
    }
}