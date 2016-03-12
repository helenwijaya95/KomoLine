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
        protected delegate List<ProductEntity> SearchStrategy(String Query, komolineEntities DbContext);

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

        internal GuestAccess(Account Reference)
            : base(Reference)
        {
            Role = UserRole.Guest;
        }
        public override void Register(string Password, string Status = "buyer")
        {
            komolineEntities DbContext = new komolineEntities();
            if (DbContext.UserEntities.Any(x => x.username == Reference.Username))
            {
                throw new InvalidOperationException(ErrorMessage.ERR_ALREADY_EXIST);
            }
            UserEntity e = Converter.ToEntity(Reference);
            e.register_time = DateTime.Now;
            e.password = HashHelper.CreateHash(Password);
            e.status = Status;
            DbContext.UserEntities.Add(e);
            DbContext.SaveChanges();
            Login(Reference.Username, Password);
        }

        public override void Login(string Username, string Password)
        {
            komolineEntities DbContext = new komolineEntities();
            var User = DbContext.UserEntities.SingleOrDefault(x => x.username == Username && !(x.is_deleted ?? false));
            if (User != null && HashHelper.ValidatePassword(Password, User.password))
            {
                Converter.ToModel(User, Reference);
            }
            else
            {
                throw new ArgumentException(ErrorMessage.ERR_WRONG_LOGIN);
            }
        }

        public override List<Product> SearchProduct(string Query, List<SearchBy> Options)
        {
            List<ProductEntity> result = new List<ProductEntity>();
            komolineEntities DbContext = new komolineEntities();
            Options.ForEach(x => result.AddRange(SearchMethod[x](Query.ToLower(), DbContext)));
            return result.Select(x => Converter.ToModel(x)).ToList();
        }

        public override Product GetProduct(string ID)
        {
            komolineEntities DbContext = new komolineEntities();
            var product = SearchByID(ID, DbContext).SingleOrDefault();
            if (product == null)
            {
                string error = string.Format(ErrorMessage.ERR_MISSING, ID);
                throw new ArgumentException(error);
            }
            return Converter.ToModel(product);
        }

        public override Account GetUser(string Username)
        {
            komolineEntities DbContext = new komolineEntities();
            var acc = DbContext.UserEntities
                .Where(x => x.username == Username && !(x.is_deleted ?? false))
                .SingleOrDefault();
            if (acc == null)
            {
                string error = string.Format(ErrorMessage.ERR_MISSING, Username);
                throw new ArgumentException(error);
            }
            return Converter.ToModel(acc);
        }


        protected static SearchStrategy SearchByName =
            (n, db) =>
                db.ProductEntities
                .Where(x => !x.is_deleted && x.name
                    .ToLower()
                    .Contains(n))
                .ToList();
        protected static SearchStrategy SearchByCategory =
            (c, db) =>
                db.ProductEntities
                .Where(x => !x.is_deleted && x.category.name
                    .ToLower()
                    .Contains(c))
                .ToList();
        protected static SearchStrategy SearchByDescription =
            (d, db) =>
                db.ProductEntities
                .Where(x => !x.is_deleted && x.description
                    .ToLower()
                    .Contains(d))
                .ToList();
        protected static SearchStrategy SearchByTag =
            (tag, db) =>
                db.ProductEntities
                .Where(x => !x.is_deleted && x.tags
                    .Any(t => t.tag_name
                        .ToLower()
                        .Contains(tag)))
                .ToList();
        protected static SearchStrategy SearchByReview =
            (r, db) =>
                db.ProductEntities
                .Where(x => !x.is_deleted && x.transactions
                    .Any(t => t.review.content
                        .ToLower()
                        .Contains(r)))
                .ToList();
        protected static SearchStrategy SearchByID =
            (ID, db) => 
                db.ProductEntities
                .Where(x => x.id == ID && !x.is_deleted)
                .ToList();
        protected static SearchStrategy SearchByOwner =
            (Owner, db) =>
                db.ProductEntities
                .Where(x => !x.is_deleted && x.user.username == Owner)
                .ToList();
        protected static readonly Dictionary<SearchBy, SearchStrategy> SearchMethod = new Dictionary<SearchBy, SearchStrategy>()
        {
            {SearchBy.Category,SearchByCategory},
            {SearchBy.Description,SearchByDescription},
            {SearchBy.Name,SearchByName},
            {SearchBy.Review,SearchByReview},
            {SearchBy.Tags,SearchByTag},
            {SearchBy.ID,SearchByID},
            {SearchBy.Owner,SearchByOwner}
        };
    }
}
