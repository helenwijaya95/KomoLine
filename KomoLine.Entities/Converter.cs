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
    public static class Converter
    {
        public static UserEntity ToEntity(Account User, UserEntity Storage = null)
        {
            UserEntity e = Storage ?? new UserEntity();
            e.address = User.Address;
            e.confirmed_time = User.ConfirmedOn;
            e.email = User.Email;
            e.name = User.Name;
            e.phone_number = User.PhoneNumber;
            e.photo_path = User.Photo;
            e.register_time = User.RegisterOn;
            e.status = User.AccessType.Name;
            e.username = User.Username;
            return e;
        }

        public static Account ToModel(UserEntity UserEntity, Account Storage = null)
        {
            Account u = Storage ?? new Account();
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

            return p;
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
        
        private static string GenerateID()
        {
            Guid g = Guid.NewGuid();
            string ID = Convert.ToBase64String(g.ToByteArray());
            ID = ID.Replace("=", "").Replace("+", "_").Replace("/", "_");
            return ID;
        }
    }
}
