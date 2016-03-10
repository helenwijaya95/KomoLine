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
        public static UserEntity Convert(Account User, UserEntity Storage = null)
        {
            UserEntity e;
            if (Storage == null)
            {
                e = new UserEntity()
                {
                    address = User.Address,
                    confirmed_time = User.ConfirmedOn,
                    email = User.Email,
                    name = User.Name,
                    phone_number = User.PhoneNumber,
                    photo_path = User.Photo,
                    register_time = User.RegisterOn,
                    status = User.AccessType.Name,
                    username = User.Username
                };
            }
            else
            {
                e = Storage;
                e.address = User.Address;
                e.confirmed_time = User.ConfirmedOn;
                e.email = User.Email;
                e.name = User.Name;
                e.phone_number = User.PhoneNumber;
                e.photo_path = User.Photo;
                e.register_time = User.RegisterOn;
                e.status = User.AccessType.Name;
                e.username = User.Username;
            }
            return e;
        }

        public static Account Convert(UserEntity UserEntity, Account Storage = null)
        {
            Account u;
            if (Storage == null)
            {
                u = new Account()
                {
                    Address = UserEntity.address,
                    ConfirmedOn = UserEntity.confirmed_time,
                    Email = UserEntity.email,
                    Name = UserEntity.name,
                    PhoneNumber = UserEntity.phone_number,
                    Photo = UserEntity.photo_path,
                    RegisterOn = UserEntity.register_time,
                    Username = UserEntity.username
                };
            }
            else
            {
                u = Storage;
                u.Address = UserEntity.address;
                u.ConfirmedOn = UserEntity.confirmed_time;
                u.Email = UserEntity.email;
                u.Name = UserEntity.name;
                u.PhoneNumber = UserEntity.phone_number;
                u.Photo = UserEntity.photo_path;
                u.RegisterOn = UserEntity.register_time;
                u.Username = UserEntity.username;
            }
            u.AccessType = GetUserAccess(UserEntity.status, u);
            return u;
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
    }
}
