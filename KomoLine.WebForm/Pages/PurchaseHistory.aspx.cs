using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;
namespace KomoLine.WebForm.Pages
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        Account acc;
        public String idTransaksi;
        protected void Page_Load(object sender, EventArgs e)
        {
            acc = Session["user"] as Account ?? new Account();
            try
            {
                var src = acc.ViewPurchase();
                if (!IsPostBack)
                {
                    PurchRepeater.DataSource = src;
                    DetailPurchRepeater.DataSource = src;
                    PurchRepeater.DataBind();
                    DetailPurchRepeater.DataBind();
                }
            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
                Response.Redirect("~");
            }
        }

        protected void DetailPurchRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Transaction transaksi;
                var viewed = e.Item.DataItem as Transaction;
                transaksi = e.Item.DataItem as Transaction;
                idTransaksi = transaksi.Code;
                var lblStatus = e.Item.FindControl("lblStatus") as Label;
                var lblNamaProduk = e.Item.FindControl("lblNamaProduk") as Label;
                var lblNamaUser = e.Item.FindControl("lblNamaUser") as Label;
                var lblQty = e.Item.FindControl("lblQty") as Label;
                var lblStart = e.Item.FindControl("lblStart") as Label;
                var lblFinish = e.Item.FindControl("lblFinish") as Label;
                var lblCode = e.Item.FindControl("lblCode") as Label;

                var ProdImg = e.Item.FindControl("ProdImg") as Image;



                lblCode.Text = viewed.Code;
                lblStatus.Text = Enum.GetName(typeof(TransactionStatus), viewed.Status);
                lblNamaProduk.Text = viewed.Product.Name;
                ProdImg.ImageUrl = "~/Image/product/" + viewed.Product.PhotoPath;
                lblNamaUser.Text = viewed.Product.Owner.Name;
                lblQty.Text = "" + viewed.Quantity;
                lblStart.Text = viewed.StartOn.ToString("dd MMMM yyyy hh:mm:ss");
                if (viewed.ConfirmedOn.HasValue)
                {
                    lblFinish.Text = viewed.ConfirmedOn.Value.ToString("dd MMMM yyyy hh:mm:ss");
                }
                else
                {
                    lblFinish.Text = "Transaksi belum selesai";
                }
            }
        }

        protected void rate1_Command(object sender, CommandEventArgs e)
        {
            try
            {
                Transaction transByID;
                string temp = e.CommandArgument.ToString();
                string[] temp2 = temp.Split(',');
                transByID = acc.GetTransaction(temp2[1]);
                acc.RatePurchase(transByID, int.Parse(temp2[0]));
                Session["message"] = "Rating Produk berhasil. Terima kasih telah berbelanja di KomoLine.";
                Response.Redirect("~/Pages/PurchaseHistory.aspx");

            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
            }
        }

        protected void btnKirim_Click(object sender, EventArgs e)
        {

        }

        protected void btnKirim_Command(object sender, CommandEventArgs e)
        {
         
        }

        protected void DetailPurchRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try{
                var tbReview = e.Item.FindControl("tbReview") as TextBox;
                var btnKirim = e.Item.FindControl("btnKirim") as Button;
                string id = btnKirim.CommandArgument.ToString();
                string rev = tbReview.Text;
                Transaction transaksibyid;
                transaksibyid = acc.GetTransaction(id);
                acc.ReviewPurchase(transaksibyid, rev);
                Session["message"] = "Review Produk berhasil. Terima kasih telah berbelanja di KomoLine.";
                Response.Redirect("~/Pages/PurchaseHistory.aspx");
            }
            
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
            }
        }
    }
}