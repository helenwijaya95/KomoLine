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
    public partial class EditHapusBarang : System.Web.UI.Page
    {
        Account acc;
        protected void Page_Load(object sender, EventArgs e)
        {
           acc = Session["user"] as Account;
        
             List<Product> res;
            List<SearchBy> Opt;
            
            if(acc.Role.Equals(UserRole.Admin))
            {
               Opt = new List<SearchBy>() { SearchBy.Name };

                res= acc.SearchProduct("", Opt);
            }
            else
            {
                Opt = new List<SearchBy>() { SearchBy.Owner };

                res = acc.SearchProduct(acc.Name, Opt);
            }

           
          
             if(res.Count==0)
             {
                 Session["message"] = "Tidak ada data barang";
                 Response.Redirect("~");
             }
             else
             {
                 editBarangRpt.DataSource = res;
                 editBarangRpt.DataBind();
             }
         
              
          
           

        }


        protected void btnHapusProd_Command(object sender, CommandEventArgs e)
        {
           
                string id = e.CommandArgument.ToString();
                Product oldProd = acc.GetProduct(id);
                acc.DeleteProduct(oldProd);
                Session["message"] = "Produk berhasil dihapus";
                Response.Redirect("~/Pages/ListBarang.aspx");
           
        }
    }
}