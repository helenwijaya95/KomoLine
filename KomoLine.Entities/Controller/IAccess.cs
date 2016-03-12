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
        void Register(string Password, string Status = "buyer");//Guest only
        List<Product> SearchProduct(string Query, List<SearchBy> Options);//Guest+
        void DeleteProduct(Product OldProduct);//Vendor+
        void AddProduct(Product NewProduct);//Vendor+
        void SaveProduct(Product NewData);//Vendor+
        void Purchase(Product Item, double Quantity);//Buyer+
        void CancelPurchase(Transaction Purchase);//Buyer+
        void FinishPurchase(Transaction Purchase);//Buyer+
        void AcceptOrder(Transaction Purchase);//Vendor+
        List<Transaction> ViewPurchases();//Buyer+
        List<Transaction> ViewSales();//Vendor+
        void SaveProfile();//Buyer+
        void ReviewPurchase(Transaction Purchase, string Review);//Buyer+
        void RatePurchase(Transaction Purchase, int Rate);//Buyer+
        List<Account> ViewUsers();//Admin
        List<Transaction> ViewTransactions();//Admin
        void Login(string Username, string Password);//Guest only
        Account GetUser(string Username);//Guest+
        Product GetProduct(string ID);//Guest+
        Transaction GetTransaction(string Code);//Buyer+
    }
}
