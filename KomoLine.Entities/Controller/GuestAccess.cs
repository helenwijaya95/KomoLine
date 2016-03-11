using KomoLine.Controller;
using KomoLine.Data.Model;
using KomoLine.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public class GuestAccess : NoAccess
    {
        public override string Name
        {
            get { return base.Name; }
            set { base.Name = value; }
        }

        public override Account Reference
        {
            get { return base.Reference; }
            set { base.Reference = value; }
        }

        internal GuestAccess(Account Reference)
            : base(Reference)
        {
            Name = "guest";
        }
        public override void Register(string Password, string Status = "buyer")
        {
            komolineEntities DbContext = new komolineEntities();
            UserEntity e = Converter.ToEntity(Reference);
            e.register_time = DateTime.Now;
            e.password = HashHelper.CreateHash(Password);
            e.status = Status;
            DbContext.UserEntities.Add(e);
            DbContext.SaveChanges();
        }

        public override void Login(string Username, string Password)
        {
            komolineEntities DbContext = new komolineEntities();
            var User = DbContext.UserEntities.SingleOrDefault(x => x.username == Username);
            if (User != null && HashHelper.ValidatePassword(Password, User.password))
            {
                Converter.ToModel(User, Reference);
            }
            else
            {
                throw new ArgumentException(ErrorMessage.ERR_WRONG_LOGIN);
            }
        }

        public override List<Product> SearchProduct(string Query)
        {
            return base.SearchProduct(Query);
        }
    }
}
