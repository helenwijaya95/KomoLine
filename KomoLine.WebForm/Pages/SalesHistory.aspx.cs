using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;

namespace KomoLine.WebForm.Pages
{
    public partial class historyPurchasing : System.Web.UI.Page
    {

        Account acc;
        protected void Page_Load(object sender, EventArgs e)
        {
            acc = Session["user"] as Account;
            List<Product> res = new List<Product>();
            
                try
                {
                    var src = acc.ViewSales();
                    HistRepeater.DataSource = src;
                    DetailHistRepeater.DataSource = src;
                    HistRepeater.DataBind();
                    DetailHistRepeater.DataBind();
                }
                catch (InvalidOperationException ex)
                {
                    Session["message"] = ex.Message;
                    Response.Redirect("~");
                }
                if (res.Count == 0)
                {
                    Session["message"] = "Tidak ada daftar penjualan";
                }
                else
                {
                    var src = acc.ViewSales();
                    HistRepeater.DataSource = res;
                    DetailHistRepeater.DataSource = res;
                    HistRepeater.DataBind();
                    DetailHistRepeater.DataBind();

                }
        }

        protected void DetailHistRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var viewed = e.Item.DataItem as Transaction;
                var lblStatus = e.Item.FindControl("lblStatus") as Label;
                var lblNamaProduk = e.Item.FindControl("lblNamaProduk") as Label;
                var lblNamaUser = e.Item.FindControl("lblNamaUser") as Label;
                var lblQty = e.Item.FindControl("lblQty") as Label;
                var lblStart = e.Item.FindControl("lblStart") as Label;
                var lblFinish = e.Item.FindControl("lblFinish") as Label;
                var lblCode = e.Item.FindControl("lblCode") as Label;
                var ConfirmButton = e.Item.FindControl("ConfirmButton") as Button;
                var CancelButton = e.Item.FindControl("CancelButton") as Button;
                var ProdImg = e.Item.FindControl("ProdImg") as Image;

                if(Enum.GetName(typeof(TransactionStatus), viewed.Status).Equals("Started"))
                {
                    ConfirmButton.Visible=true;
                    CancelButton.Visible = true;
                }
                else
                {
                    ConfirmButton.Visible = false;
                    CancelButton.Visible = false;
                }
                

                lblStatus.Text = Enum.GetName(typeof(TransactionStatus), viewed.Status);
                lblNamaProduk.Text = viewed.Product.Name;
                ProdImg.ImageUrl = "~/Image/product/" + viewed.Product.PhotoPath;
                lblNamaUser.Text = viewed.Product.Owner.Name;
                lblQty.Text = ""+viewed.Quantity;
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

        protected void DetailHistRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                var ID = e.CommandArgument as string;
                switch (e.CommandName)
                {
                    case "Confirm":
                        {
                            var trans = acc.GetTransaction(ID);
                            acc.AcceptOrder(trans);
                            Session["message"] = "Transaksi no. " + ID + "telahh dikonfirmasi";
                        } break;
                    case "Delete":
                        {
                            var user = acc.GetProfile(ID);
                            acc.BlockUser(user);
                            Session["message"] = "Transaksi no. " + ID + " dibatalkan";
                        } break;
                   
                }
            }
            catch (Exception ex)
            {
                if (ex is InvalidOperationException || ex is ArgumentException)
                {
                    Session["message"] = ex.Message;
                }
            }
            Response.Redirect("~/Pages/SalesHistory.aspx");
        }

     
    }
}