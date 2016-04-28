using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KomoLine.Data.Model;
using KomoLine.Helper;
using System.IO;
using System.Linq;

namespace KomoLine.WebForm.Pages
{
    public partial class TambahBarang : System.Web.UI.Page
    {
        Account acc;
        Product prod;
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
               
            
        }

        protected void insertProd_Click(object sender, EventArgs e)
        {
            try
            {
                acc = Session["user"] as Account;
                prod = new Product();

                double mo;
                int hrg;
                if (double.TryParse(tbMinOrder.Text, out mo) && (int.TryParse(tbPrice.Text, out hrg)))
                {
                    if (UploadImage.HasFile)
                    {
                        FileTransferHelper.UploadFile(UploadImage.PostedFile, "~/Image/product");
                        prod.PhotoPath = Path.GetFileName(UploadImage.PostedFile.FileName);
                        ProductImage.ImageUrl = "~/Image/product/" + prod.PhotoPath;
                    }
                    else
                    {
                        prod.PhotoPath = "noPImage.png";
                        ProductImage.ImageUrl = "~/Image/" + prod.PhotoPath;
                    }
                    prod.Category = ddCat.SelectedItem.Text;
                    prod.Name = tbProdName.Text;
                    prod.MinimalOrder = double.Parse(tbMinOrder.Text);
                    prod.Description = tbDesc.Text;
                    prod.Price = int.Parse(tbPrice.Text);
                    acc.AddProduct(prod);
                    Session["message"] = "Produk berhasil ditambahkan";
                    Response.Redirect("~/Pages/ListBarang.aspx");
                }
                else
                {

                    error.Text = "Input data tidak valid";
                    error.Visible = true;
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