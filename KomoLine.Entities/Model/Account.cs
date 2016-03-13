using KomoLine.Data.Controller;
using KomoLine.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Model
{
    public class Account
    {
        //Fields
        private string username;
        private string name;
        private string address;
        private string phoneNumber;
        private string email;
        private string photoPath;
        private DateTime register;
        private DateTime? confirmed;
        private IAccess userAccess;
        private UserRole role;
        //Properties
        public UserRole Role
        {
            get { return role; }
            internal set { role = value; }
        }
        
        public string Username
        {
            get{ return username; }
            set{ username = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        public string PhoneNumber
        {
            get { return phoneNumber; }
            set
            {
                if (RegexHelper.IsValidPhoneNumber(value))
                {
                    phoneNumber = value;
                }
                else
                {
                    throw new FormatException("Invalid Phone number format");
                }
            }
        }
        public string Email
        {
            get { return email; }
            set 
            {
                if (RegexHelper.IsValidEmail(value))
                {
                    email = value; 
                }
                else
                {
                    throw new FormatException("Invalid Email Format");
                }
            }
        }
        public string Photo
        {
            get { return photoPath; }
            set { photoPath = value; }
        }
        public DateTime RegisterOn
        {
            get { return register; }
            set { register = value; }
        }
        public DateTime? ConfirmedOn
        {
            get { return confirmed; }
            set { confirmed = value; }
        }

        internal IAccess AccessType
        {
            get { return userAccess; }
            set { userAccess = value; }
        }
        //Constructor
        public Account()
        {
            Account.SetDefault(this);
        }
        #region Guest Features
        //Methods: Guest
        public void Login(string Username, string Password)
        {
            userAccess.Login(Username, Password);
        }

        public void LogOut()
        {
            Account.SetDefault(this);
        }

        public void Register(string Password, string Status = "buyer")
        {
            userAccess.Register(Password, Status);
        }

        public List<Product> SearchProduct(string Query, List<SearchBy> Options)
        {
            return userAccess.SearchProduct(Query, Options);
        }

        public Product GetProduct(string ID)
        {
            return userAccess.GetProduct(ID);
        }

        public Account GetProfile(string Username)
        {
            return userAccess.GetUser(Username);
        }
        #endregion
        #region Buyer Features
        //Methods: Buyer
        public Transaction GetTransaction(string Code)
        {
            return userAccess.GetTransaction(Code);
        }
        public void SaveProfile()
        {
            userAccess.SaveProfile();
        }
        public void Purchase(Product Item, double Quantity)
        {
            userAccess.Purchase(Item,Quantity);
        }

        public void CancelPurchase(Transaction Purchase)
        {
            userAccess.CancelPurchase(Purchase);
        }

        public void FinishPurchase(Transaction Purchase)
        {
            userAccess.FinishPurchase(Purchase);
        }

        public void ReviewPurchase(Transaction Purchase, string Review)
        {
            userAccess.ReviewPurchase(Purchase, Review);
        }

        public void RatePurchase(Transaction Purchase, int Rate)
        {
            userAccess.RatePurchase(Purchase, Rate);
        }

        public List<Transaction> ViewPurchase()
        {
            return userAccess.ViewPurchases();
        }
        #endregion
        #region Vendor Features
        //Methods: Vendor
        public void DeleteProduct(Product OldProduct)
        {
            userAccess.DeleteProduct(OldProduct);
        }

        public void AddProduct(Product NewProduct)
        {
            userAccess.AddProduct(NewProduct);
        }

        public void SaveProduct(Product NewData)
        {
            userAccess.SaveProduct(NewData);
        }

        public void AcceptOrder(Transaction Order)
        {
            userAccess.AcceptOrder(Order);
        }

        public List<Transaction> ViewSales()
        {
            return userAccess.ViewSales();
        }
        #endregion
        #region Admin Features
        public List<Account> ViewUsers()
        {
            return userAccess.ViewUsers();
        }

        public List<Transaction> ViewTransactions()
        {
            return userAccess.ViewTransactions();
        }

        public void ConfirmVendor(Account Vendor)
        {
            userAccess.ConfirmVendor(Vendor);
        }

        public void BlockUser(Account User)
        {
            userAccess.BlockUser(User);
        }
        #endregion

        private static void SetDefault(Account u)
        {
            u.username = "Guest";
            u.name = "Guest";
            u.phoneNumber = null;
            u.photoPath = "Default.jpg";
            u.address = null;
            u.register = DateTime.Now;
            u.email = "example@domain.com";
            u.userAccess = new GuestAccess(u);
        }
    }

    public enum UserRole
    {
        Guest,
        Buyer,
        Vendor,
        Admin,
        Invalid
    }
}
