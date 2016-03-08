using KomoLine.Entities.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Entities.Controller
{
    public interface IAccess
    {
        void Register(User Biodata, string Password, string Status = "buyer");
        User Login(string Username, string Password);
        List<Product> Search(string Query);
        List<Transaction> ViewPurchase(User Reference);
        List<Transaction> ViewSales(User Reference);
        void CancelTransaction(User Reference, Transaction Transaction);
        void Rate(User Reference, Transaction Transaction, double Rating);
        void Review(User Reference, Transaction Transaction, string Content);
        void SaveProfile(User Reference);
        void AddProduct(User Reference, Product NewProduct);
        void DeleteProduct(User Reference, Product OldProduct);
        void EditProduct(User Reference, Product NewProduct);

    }
}
