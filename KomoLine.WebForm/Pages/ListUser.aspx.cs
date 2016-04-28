using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm.Pages
{
    public partial class ListUser : System.Web.UI.Page
    {
        Account acc;
        string SelectedID;
        protected void Page_Load(object sender, EventArgs e)
        {
            acc = Session["user"] as Account ?? new Account();
            if (acc.Role != UserRole.Admin)
            {
                Session["message"] = "You don't have the required access to this page";
                Response.Redirect("~");
            }
            var src = acc.ViewUsers();
            UserRepeater.DataSource = src;
            DetailRepeater.DataSource = src;
            UserRepeater.DataBind();
            DetailRepeater.DataBind();
        }

        protected void DetailRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var viewed = e.Item.DataItem as Account;
                var StatusLabel = e.Item.FindControl("StatusLabel") as Label;
                var NameLabel = e.Item.FindControl("NameLabel") as Label;
                var ProfilePicture = e.Item.FindControl("ProfilePicture") as Image;
                var AddressLabel = e.Item.FindControl("AddressLabel") as Label;
                var EmailLabel = e.Item.FindControl("EmailLabel") as Label;
                var PhoneLabel = e.Item.FindControl("PhoneLabel") as Label;
                var RegisterLabel = e.Item.FindControl("RegisterLabel") as Label;
                var ConfirmLabel = e.Item.FindControl("ConfirmLabel") as Label;

                StatusLabel.Text = Enum.GetName(typeof(UserRole), viewed.Role);
                NameLabel.Text = viewed.Username + " - " + viewed.Name;
                ProfilePicture.ImageUrl = "~/Image/profpic/" + viewed.Photo;
                AddressLabel.Text = viewed.Address;
                EmailLabel.Text = viewed.Email;
                PhoneLabel.Text = viewed.PhoneNumber;

                RegisterLabel.Text = viewed.RegisterOn.ToLongDateString();
                if (viewed.ConfirmedOn.HasValue)
                {
                    ConfirmLabel.Text = viewed.ConfirmedOn.Value.ToLongDateString();
                }
                else
                {
                    ConfirmLabel.Text = "Not confirmed";
                }
            }
        }
    }
}