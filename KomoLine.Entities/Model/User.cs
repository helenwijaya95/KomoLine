using KomoLine.Entities.Controller;
using KomoLine.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Entities.Model
{
    public class User
    {

        private string username;
        private string name;
        private string address;
        private string phoneNumber;
        private string email;
        private string photoPath;
        private DateTime register;
        private DateTime? confirmed;
        private IAccess userAccess;
        
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
            set { phoneNumber = value; }
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

        public static User GenerateDefaultUser()
        {
            return new User()
            {
                username = "Guest",
                name = "Guest",
                photoPath = "Default.jpg",
                address = null,
                phoneNumber = null,
                register = new DateTime(),
                userAccess = null
            };
            //DefaultUser.userAccess = new GuestAccess(DefaultUser);
        }

        public void LogOut()
        {
            User Default = GenerateDefaultUser();
            username = Default.username;
            name = Default.username;
            phoneNumber = Default.phoneNumber;
            photoPath = Default.photoPath;
            address = Default.address;
            register = Default.register;
            userAccess = Default.userAccess;

        }
    }
}
