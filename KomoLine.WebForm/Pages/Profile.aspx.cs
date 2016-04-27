using KomoLine.Data.Model;
using KomoLine.Helper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Account acc = Session["user"] as Account;
            if (acc == null)
            {
                Session["message"] = "Shouldn't you login first?";
                Response.Redirect("~");
            }
            if (IsPostBack)
            {
                try
                {
                    if (UploadImage.HasFile)
                    {
                        FileTransferHelper.UploadFile(UploadImage.PostedFile, "~/Image/profpic");
                        acc.Photo = Path.GetFileName(UploadImage.PostedFile.FileName);
                        ProfileImage.ImageUrl = "~/Image/profpic/"+acc.Photo;
                    }
                    acc.Email = cemail.Text;
                    acc.Username = cusername.Text;
                    acc.Name = cname.Text;
                    acc.Address = caddress.Text;
                    acc.PhoneNumber = cphnumber.Text;
                    acc.RequestPromotion = CheckPromotion.Checked;
                    acc.SaveProfile();
                    Session["message"] = "Your profile has been saved!";
                }
                catch (Exception ex)  
                {
                    if (ex is FormatException || ex is InvalidOperationException)
                    {
                        error.Text = ex.Message;
                        error.Visible = true;
                    }
                }
            }
            else
            {
                ProfileImage.ImageUrl = "~/Image/profpic/" + acc.Photo;
                cemail.Text = acc.Email;
                cusername.Text = acc.Username;
                cname.Text = acc.Name;
                caddress.Text = acc.Address;
                cphnumber.Text = acc.PhoneNumber;
                StatusLabel.Text = Enum.GetName(typeof(UserRole), acc.Role);
                CheckPromotion.Checked = acc.RequestPromotion ?? false;
            }
            PromotePlaceholder.Visible = acc.Role == UserRole.Buyer;
            RequestLabel.Text = acc.RequestPromotion ?? false ? "Your request is being processed. You can uncheck to cancel" : "Check the box to apply for vendor";
        }
    }
}