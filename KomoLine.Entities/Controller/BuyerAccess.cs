using KomoLine.Controller;
using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public class BuyerAccess : GuestAccess
    {
        private static readonly InvalidOperationException REDUNDANT = new InvalidOperationException(ErrorMessage.ERR_REDUNDANT_LOGIN);
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

        internal BuyerAccess(Account Reference)
            : base(Reference)
        {
            Role = UserRole.Buyer;
        }

        public override void Login(string Username, string Password)
        {
            throw REDUNDANT;
        }

        public override void Register(string Password, string Status = "buyer")
        {
            throw REDUNDANT;
        }

        public override void SaveProfile()
        {
            komolineEntities DbContext = new komolineEntities();
            UserEntity user = Converter.ToEntity(Reference, DbContext.UserEntities
                .SingleOrDefault(x => x.username == Reference.Username && !(x.is_deleted ?? false)));
            DbContext.SaveChanges();
        }

        public override void Purchase(Product Item, double Quantity)
        {
            if (Quantity < Item.MinimalOrder)
            {
                string error = string.Format(ErrorMessage.ERR_NOT_ENOUGH, Item.MinimalOrder);
                throw new InvalidOperationException(error);
            }
            komolineEntities DbContext = new komolineEntities();
            Transaction t = new Transaction();
            t.StartOn = DateTime.Now;
            t.Quantity = Quantity;
            t.Status = TransactionStatus.Started;
            TransactionEntity te = Converter.ToEntity(t);
            te.product = SearchByID(Item.ID, DbContext).SingleOrDefault();
            te.user = DbContext.UserEntities
                .SingleOrDefault(x => !(x.is_deleted ?? false) && x.username == Reference.Username);
            DbContext.TransactionEntities.Add(te);
            DbContext.SaveChanges();
        }

        public override void RatePurchase(Transaction Purchase, int Rate)
        {
            komolineEntities DbContext = new komolineEntities();
            var trans = DbContext.TransactionEntities.SingleOrDefault(x => x.code == Purchase.Code);
            if (string.Equals(trans.status, Enum.GetName(typeof(TransactionStatus), TransactionStatus.Finished), StringComparison.CurrentCultureIgnoreCase))
            {
                throw new InvalidOperationException(ErrorMessage.ERR_NOT_FINISHED);
            }
            if (trans.rating == null)
            {
                RatingEntity re = new RatingEntity();
                re.rating = Rate;
                re.created_time = DateTime.Now;
                re.trans_id = trans.id;
                re.transaction = trans;
                DbContext.RatingEntities.Add(re);
            }
            else
            {
                trans.rating.rating = Rate;
                trans.rating.created_time = DateTime.Now;
            }
            DbContext.SaveChanges();
        }

        public override void ReviewPurchase(Transaction Purchase, string Review)
        {
            komolineEntities DbContext = new komolineEntities();
            var trans = DbContext.TransactionEntities.SingleOrDefault(x => x.code == Purchase.Code);
            if (string.Equals(trans.status, Enum.GetName(typeof(TransactionStatus), TransactionStatus.Finished), StringComparison.CurrentCultureIgnoreCase))
            {
                throw new InvalidOperationException(ErrorMessage.ERR_NOT_FINISHED);
            }
            if (trans.review == null)
            {
                ReviewEntity re = new ReviewEntity();
                re.content = Review;
                re.created_time = DateTime.Now;
                re.trans_id = trans.id;
                re.transaction = trans;
                DbContext.ReviewEntities.Add(re);
            }
            else
            {
                trans.review.content = Review;
                trans.review.created_time = DateTime.Now;
            }
            DbContext.SaveChanges();
        }

        public override void CancelPurchase(Transaction Purchase)
        {
            komolineEntities DbContext = new komolineEntities();
            var trans = DbContext.TransactionEntities.SingleOrDefault(x => x.code == Purchase.Code);
            if(string.Equals(trans.status,Enum.GetName(typeof(TransactionStatus), TransactionStatus.Started),StringComparison.CurrentCultureIgnoreCase)){
                throw new InvalidOperationException(ErrorMessage.ERR_CANNOT_CANCEL);
            }
            trans.status = Enum.GetName(typeof(TransactionStatus), TransactionStatus.Canceled);
            DbContext.SaveChanges();
        }

        public override void FinishPurchase(Transaction Purchase)
        {
            komolineEntities DbContext = new komolineEntities();
            var trans = DbContext.TransactionEntities.SingleOrDefault(x => x.code == Purchase.Code);
            if (string.Equals(trans.status, Enum.GetName(typeof(TransactionStatus), TransactionStatus.Accepted), StringComparison.CurrentCultureIgnoreCase))
            {
                throw new InvalidOperationException(ErrorMessage.ERR_CANNOT_CANCEL);
            }
            trans.status = Enum.GetName(typeof(TransactionStatus), TransactionStatus.Finished);
            DbContext.SaveChanges();
        }

        public override List<Transaction> ViewPurchases()
        {
            komolineEntities DbContext = new komolineEntities();
            return DbContext.TransactionEntities
                .Where(x => x.user.username == Reference.Username)
                .Select(x => Converter.ToModel(x, null))
                .ToList();
        }

        public override Transaction GetTransaction(string Code)
        {
            komolineEntities DbContext = new komolineEntities();
            var trans = DbContext.TransactionEntities.SingleOrDefault(x => x.code == Code);
            if (HasTransactionAccess(trans))
            {
                return Converter.ToModel(trans);
            }
            else
            {
                throw new InvalidOperationException(ErrorMessage.ERR_RESTRICTED_ITEM);
            }
        }

        private bool HasTransactionAccess(TransactionEntity trans)
        {
            bool isAdmin = Reference.Role == UserRole.Admin;
            bool isBuyer = trans.user.username == Reference.Username;
            bool isVendor = trans.product.user.username == Reference.Username;
            return isAdmin || isBuyer || isVendor;
        }
    }
}
