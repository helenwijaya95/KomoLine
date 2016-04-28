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
            acc = Session["user"] as Account;
        }

       protected void rate1_Command(object sender, CommandEventArgs e)
        {

            string temp = e.CommandArgument.ToString();
            string[] temp2 = temp.Split(',');
            acc.RatePurchase(transByID, int.Parse(temp2[0]));
       }

       protected void btnKirim_Click(object sender, EventArgs e)
       {
           string rev = tbReview.Text;
           acc.ReviewPurchase(transByID, rev);
       }

       protected void btnTransID_Click(object sender, EventArgs e)
       {
           
           //string idProduct = Request.QueryString["prodId"];
           string idTrans = transID.Text;
           transByID = acc.GetTransaction(idTrans);
           //string idProduct = "BK1";
           prod = acc.GetProduct(transByID.Product.ID);

           prodImg.ImageUrl = "~/Image/" + prod.PhotoPath;
           detProduct.Visible = true;
       }
    }
}