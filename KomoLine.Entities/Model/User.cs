using KomoLine.Entities.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Entities.Model
{
    public class User
    {
        public static User DefaultUser;

        private string username;
        private string name;
        private string address;
        private string phoneNumber;
        private string email;
        private string photoPath;
        private DateTime register;
        private DateTime? confirmed;
        private IAccess userAccess;

        static User()
        {
            DefaultUser = new User()
            {
                username = "Visitor",
                name = "Visitor",
                photoPath = "Default.jpg"
            };
            //DefaultUser.userAccess = new GuestAccess(DefaultUser);
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
            set { phoneNumber = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
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

        public void test()
        {
            komolineEntities DBContext = new komolineEntities();
        }
    }
}
