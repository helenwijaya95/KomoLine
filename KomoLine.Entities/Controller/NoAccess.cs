using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KomoLine.Data.Model;

namespace KomoLine.Data.Controller
{
    public class NoAccess : IAccess
    {
        private static readonly IllegalAccessException RESTRICTED_ACCESS = new IllegalAccessException(ErrorMessage.ERR_RESTRICTED_FEATURE);
        public virtual Account Reference { get; set; }
        public virtual string Name { get; set; }

        internal NoAccess(Account Reference)
        {
            this.Reference = Reference;
            this.Name = "invalid";
        }

        public virtual void Register(string Password, string Status = "buyer")
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual List<Product> SearchProduct(string Query, List<SearchBy> Options)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void DeleteProduct(Product OldProduct)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void AddProduct(Product NewProduct)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void SaveProduct(Product NewData)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void Purchase(Product Item)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void CancelPurchase(Transaction Purchase)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual List<Transaction> ViewHistory()
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void SaveProfile()
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void ReviewPurchase(Transaction Purchase, string Review)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void RatePurchase(Transaction Purchase, int Rate)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual List<Account> ViewUsers()
        {
            throw RESTRICTED_ACCESS;
        }


        public virtual List<Transaction> ViewTransactions()
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual void Login(string Username, string Password)
        {
            throw RESTRICTED_ACCESS;
        }


        public virtual Account GetUser(string Username)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual Product GetProduct(string ID)
        {
            throw RESTRICTED_ACCESS;
        }

        public virtual Transaction GetTransaction(string Code)
        {
            throw RESTRICTED_ACCESS;
        }
    }
}
