using KomoLine.Data;
using KomoLine.Data.Controller;
using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Controller
{
    internal static class Converter
    {
        public static UserEntity ToEntity(Account User, UserEntity Storage = null)
        {
            UserEntity e = Storage ?? new UserEntity();
            if (User == null) { return e; }
            e.address = User.Address;
            e.confirmed_time = User.ConfirmedOn;
            e.email = User.Email;
            e.name = User.Name;
            e.phone_number = User.PhoneNumber;
            e.photo_path = User.Photo;
            e.register_time = User.RegisterOn;
            e.status = Enum.GetName(typeof(UserRole),User.AccessType);
            e.username = User.Username;
            return e;
        }

        public static Account ToModel(UserEntity UserEntity, Account Storage = null)
        {
            Account u = Storage ?? new Account();
            if (UserEntity == null) { return u; }
            u.Address = UserEntity.address;
            u.ConfirmedOn = UserEntity.confirmed_time;
            u.Email = UserEntity.email;
            u.Name = UserEntity.name;
            u.PhoneNumber = UserEntity.phone_number;
            u.Photo = UserEntity.photo_path;
            u.RegisterOn = UserEntity.register_time;
            u.Username = UserEntity.username;
            u.AccessType = GetUserAccess(UserEntity.status, u);
            return u;
        }

        public static Product ToModel(ProductEntity ProductEntity, Product Storage = null)
        {
            Product p = Storage ?? new Product();
            if (ProductEntity == null) { return p; }
            p.Category = ProductEntity.category.name;
            p.CreatedOn = ProductEntity.created_time;
            p.Description = ProductEntity.description;
            p.ID = ProductEntity.id;
            p.MinimalOrder = ProductEntity.min_order ?? 0;
            p.Name = ProductEntity.name;
            p.Owner = ToModel(ProductEntity.user);
            p.PhotoPath = ProductEntity.photo_path;
            p.Price = ProductEntity.price ?? 0;
            p.Rating = ProductEntity.transactions
                .Where(x => x.rating != null)
                .Select(x => x.rating.rating)
                .DefaultIfEmpty(0)
                .Average();
            p.Reviews = ProductEntity.transactions
                .Where(x => x.review != null)
                .Select(x => new {owner = x.user, content = x.review.content })
                .ToDictionary(t => ToModel(t.owner), t => t.content);
            p.Tags = ProductEntity.tags.Select(x => x.tag_name).ToList();
            return p;
        }

        public static ProductEntity ToEntity(Product Product, ProductEntity Storage = null)
        {
            ProductEntity pe = Storage ?? new ProductEntity();
            pe.id = Product.ID ?? Converter.GenerateID();
            pe.created_time = Product.CreatedOn;
            pe.description = Product.Description;
            pe.min_order = Product.MinimalOrder;
            pe.name = Product.Name;
            pe.photo_path = Product.PhotoPath;
            pe.price = Product.Price;
            return pe;
        }

        public static Transaction ToModel(TransactionEntity TransactionEntity, Transaction Storage = null)
        {
            Transaction t = Storage ?? new Transaction();
            t.Buyer = ToModel(TransactionEntity.user);
            t.Code = TransactionEntity.code;
            t.ConfirmedOn = TransactionEntity.finish_time;
            t.Product = ToModel(TransactionEntity.product);
            t.Quantity = TransactionEntity.quantity ?? 0;
            t.Rating = TransactionEntity.rating == null? (double?)null : TransactionEntity.rating.rating;
            t.Review = TransactionEntity.review == null ? null : TransactionEntity.review.content;
            t.StartOn = TransactionEntity.start_time;
            t.Status = (TransactionStatus) Enum.Parse(typeof(TransactionStatus), TransactionEntity.status, true);
            return t;
        }

        public static TransactionEntity ToEntity(Transaction Transaction, TransactionEntity Storage = null)
        {
            TransactionEntity te = Storage ?? new TransactionEntity();
            te.code = Transaction.Code ?? Converter.GenerateID();
            te.finish_time = Transaction.ConfirmedOn;
            te.quantity = Transaction.Quantity;
            te.start_time = Transaction.StartOn;
            te.status = Enum.GetName(typeof(TransactionStatus),Transaction.Status);
            return te;
        }

        private static IAccess GetUserAccess(string Name, Account Reference)
        {
            switch (Name.ToLower())
            {
                case "guest": return new GuestAccess(Reference);
                case "buyer": return new BuyerAccess(Reference);
                case "vendor": return new VendorAccess(Reference);
                case "admin": return new AdminAccess(Reference);
                default: return new NoAccess(Reference);
            }
        }
        
        internal static string GenerateID()
        {
            Guid g = Guid.NewGuid();
            string ID = Convert.ToBase64String(g.ToByteArray());
            return ID
                .Replace("=", "")
                .Replace("+", "-")
                .Replace("/", "_");
        }
    }
}
