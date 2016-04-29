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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            acc = Session["user"] as Account ?? new Account();
            try
            {
             
                var src = acc.ViewUsers();
                UserRepeater.DataSource = src;
                DetailRepeater.DataSource = src;
                UserRepeater.DataBind();
                DetailRepeater.DataBind();
                
            }
            catch (InvalidOperationException ex)
            {
                Session["message"] = ex.Message;
                Response.Redirect("~");
            }
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
                var ConfirmButton = e.Item.FindControl("ConfirmButton") as Button;
                var DeleteButton = e.Item.FindControl("DeleteButton") as Button;
                var RestoreButton = e.Item.FindControl("RestoreButton") as Button;

                ConfirmButton.Visible = viewed.RequestPromotion ?? false;
                DeleteButton.Visible = !(viewed.IsDeleted ?? false);
                RestoreButton.Visible = viewed.IsDeleted ?? false;

                StatusLabel.Text = Enum.GetName(typeof(UserRole), viewed.Role) + " | " + ((viewed.IsDeleted ?? false) ? "Deleted" : "Active");
                NameLabel.Text = viewed.Username + " - " + viewed.Name;
                ProfilePicture.ImageUrl = "~/Image/profpic/" + viewed.Photo;
                AddressLabel.Text = viewed.Address;
                EmailLabel.Text = viewed.Email;
                PhoneLabel.Text = viewed.PhoneNumber;

                RegisterLabel.Text = viewed.RegisterOn.ToString("dd MMMM yyyy hh:mm:ss");
                if (viewed.ConfirmedOn.HasValue)
                {
                    ConfirmLabel.Text = viewed.ConfirmedOn.Value.ToString("dd MMMM yyyy hh:mm:ss");
                }
                else
                {
                    ConfirmLabel.Text = "Not confirmed";
                }
            }
        }

        protected void DetailRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                var ID = e.CommandArgument as string;
                switch (e.CommandName)
                {
                    case "Confirm":
                        {
                            var user = acc.GetProfile(ID);
                            acc.ConfirmVendor(user);
                            Session["message"] = "Congratulations, " + ID + " is now a vendor!";
                        } break;
                    case "Delete":
                        {
                            var user = acc.GetProfile(ID);
                            acc.BlockUser(user);
                            Session["message"] = "So, it has come to this. " + ID + " has been deleted!";
                        } break;
                    case "Restore":
                        {
                            acc.UnblockUser(ID);
                            Session["message"] = ID + " has been restored! Be careful now...";
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
            Response.Redirect("~/Pages/ListUser.aspx");
        }
    }
}