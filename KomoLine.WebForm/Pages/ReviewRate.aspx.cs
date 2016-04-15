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
        protected void Page_Load(object sender, EventArgs e)
        {
            //string idProduct = Request.QueryString["prodId"];
            string idProduct = "BK1";

            acc = new Account();
            acc.Login("helen", "password");
            prod = acc.GetProduct(idProduct);
            trans = acc.GetTransaction("6");

            prodImg.ImageUrl = "~/Image/" + prod.PhotoPath;
        }

       protected void rate1_Command(object sender, CommandEventArgs e)
        {

            string temp = e.CommandArgument.ToString();
            string[] temp2 = temp.Split(',');
            acc.RatePurchase(trans, int.Parse(temp2[0]));
       }

       protected void btnKirim_Click(object sender, EventArgs e)
       {
           string rev = tbReview.Text;
           acc.ReviewPurchase(trans, rev);
       }
    }
}