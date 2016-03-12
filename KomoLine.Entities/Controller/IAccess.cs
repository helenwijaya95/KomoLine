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
        UserRole Role { get; set; }
        void Register(string Password, string Status = "buyer");
        List<Product> SearchProduct(string Query, List<SearchBy> Options);
        void DeleteProduct(Product OldProduct);
        void AddProduct(Product NewProduct);
        void SaveProduct(Product NewData);
        void Purchase(Product Item, double Quantity);
        void CancelPurchase(Transaction Purchase);
        void FinishPurchase(Transaction Purchase);
        void AcceptOrder(Transaction Purchase);
        List<Transaction> ViewHistory();
        void SaveProfile();
        void ReviewPurchase(Transaction Purchase, string Review);
        void RatePurchase(Transaction Purchase, int Rate);
        List<Account> ViewUsers();
        List<Transaction> ViewTransactions();
        void Login(string Username, string Password);
        Account GetUser(string Username);
        Product GetProduct(string ID);
        Transaction GetTransaction(string Code);
    }
}
