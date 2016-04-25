using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
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

            Account acc = new Account();
            acc.Login("lusilala", "lusi");
            if (IsPostBack)
            {
                //FileTransferHelper.UploadFile(pic, "../Image/profpic");

                if (ProfileImage.ImageUrl == "" || ProfileImage.ImageUrl == null)
                {
                    ProfileImage.ImageUrl = "~/Image/profpic/default.png";
                }
                else
                {

                }
                acc.Email = cemail.Text;
                acc.Username = cusername.Text;
                acc.Name = cname.Text;
                acc.Photo = ProfileImage.ImageUrl;
                acc.Address = caddress.Text;
                acc.PhoneNumber = cphnumber.Text;

                acc.SaveProfile();
            }
            else
            {
                ProfileImage.ImageUrl = "~/Image/profpic/"+acc.Photo;
                cemail.Text = acc.Email;
                cusername.Text = acc.Username;
                cname.Text = acc.Name;
                caddress.Text = acc.Address;
                cphnumber.Text = acc.PhoneNumber;

            }
        }
    }
}