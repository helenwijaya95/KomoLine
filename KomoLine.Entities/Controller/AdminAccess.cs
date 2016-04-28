using KomoLine.Controller;
using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public class AdminAccess : VendorAccess
    {
        public override UserRole Role
        {
            get { return base.Role; }
            set { base.Role = value; }
        }

        public override Account Reference
        {
            get { return base.Reference; }
            set { base.Reference = value; }
        }

        internal AdminAccess(Account Reference)
            : base(Reference)
        {
            Role = UserRole.Admin;
        }

        public override List<Account> ViewUsers()
        {
            komolineEntities DbContext = new komolineEntities();
            var res = DbContext.UserEntities.ToList();
            return res.Select(x => Converter.ToModel(x, null)).ToList();
        }

        public override List<Transaction> ViewTransactions()
        {
            komolineEntities DbContext = new komolineEntities();
            var res = DbContext.TransactionEntities.ToList();
            return res.Select(x => Converter.ToModel(x, null)).ToList();
        }

        public override void ConfirmVendor(Account Vendor)
        {
            komolineEntities DbContext = new komolineEntities();
            var user = DbContext.UserEntities.SingleOrDefault(x => x.username == Vendor.Username);
            user.confirmed_time = DateTime.Now;
            user.request_promotion = false;
            user.status = Enum.GetName(typeof(UserRole), UserRole.Vendor);
            DbContext.SaveChanges();
        }

        public override void BlockUser(Account User)
        {
            komolineEntities DbContext = new komolineEntities();
            var user = DbContext.UserEntities.SingleOrDefault(x => x.username == User.Username);
            user.is_deleted = true;
            DbContext.SaveChanges();
        }

        public override void UnblockUser(string Username)
        {
            komolineEntities DbContext = new komolineEntities();
            var user = DbContext.UserEntities.SingleOrDefault(x => x.username == Username);
            user.is_deleted = false;
            DbContext.SaveChanges();
        }
    }
}
