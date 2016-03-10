using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public interface IAccess
    {
        Account Reference { get; set; }
        string Name { get; set; }
        void Register(string Password, string Status = "buyer");
        List<Product> SearchProduct(string Query);
        void DeleteProduct(Product OldProduct);
        void AddProduct(Product NewProduct);
        void EditProduct(Product NewData);
        void Purchase(Product Item);
        void CancelPurchase(Transaction Purchase);
        List<Transaction> ViewHistory();
        void SaveProfile();
        void ReviewPurchase(Transaction Purchase, string Review);
        void RatePurchase(Transaction Purchase, int Rate);
        List<Account> ViewUsers();
        List<Transaction> ViewTransactions();
        void Login(string Username, string Password);
    }
}
