using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;
using KomoLine.Helper;
using System.IO;

namespace KomoLine.WebForm.Pages
{
    public partial class EditBarang : System.Web.UI.Page
    {
        public Product prod;
        Account acc;
        protected void Page_Load(object sender, EventArgs e)
        {

            ddCat.Items.Insert(0, new ListItem("Fats and Oils"));
            ddCat.Items.Insert(1, new ListItem("Beef Products"));
            ddCat.Items.Insert(2, new ListItem("Dairy and Egg Products"));
            ddCat.Items.Insert(3, new ListItem("Finfish and Shellfish Products"));
            ddCat.Items.Insert(4, new ListItem("Fruits and Fruit Juices"));
            ddCat.Items.Insert(5, new ListItem("Lamb, Veal, and Game Products"));
            ddCat.Items.Insert(6, new ListItem("Legumes and Legume Products"));
            ddCat.Items.Insert(7, new ListItem("Nut and Seed Products"));
            ddCat.Items.Insert(8, new ListItem("Pork Products"));
            ddCat.Items.Insert(9, new ListItem("Poultry Products"));
            ddCat.Items.Insert(10, new ListItem("Vegetables and Vegetable Products"));
            ddCat.Items.Insert(11, new ListItem("Spices and Herbs"));

            Account acc = Session["user"] as Account;
            if (acc == null)
            {
                Session["message"] = "Shouldn't you login first?";
                Response.Redirect("~");
            }
            try
            {
                Product prod = acc.GetProduct(Request.QueryString["id"]);
                if (IsPostBack)
                {
                    if (UploadImage.HasFile)
                    {
                        FileTransferHelper.UploadFile(UploadImage.PostedFile, "~/Image/product");
                        prod.PhotoPath = Path.GetFileName(UploadImage.PostedFile.FileName);
                        ProductImage.ImageUrl = "~/Image/product/" + prod.PhotoPath;
                    }

                    prod.MinimalOrder = int.Parse(tbMinOrder.Text);
                    prod.Name = tbProdName.Text;
                    prod.Price = int.Parse(tbPrice.Text);
                    prod.Category = ddCat.SelectedItem.Text;
                    prod.Description = tbDesc.Text;
                    acc.SaveProduct(prod);


                    Session["message"] = "Barang berhasil diedit!";
                    Response.Redirect("~/Pages/ListBarang.aspx");
                }
                else
                {
                    ProductImage.ImageUrl = "~/Image/product/" + prod.PhotoPath;
                    tbDesc.Text = prod.Description;
                    tbMinOrder.Text = "" + prod.MinimalOrder;
                    tbPrice.Text = "" + prod.Price;
                    tbProdName.Text = prod.Name;
                }
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
    }
}