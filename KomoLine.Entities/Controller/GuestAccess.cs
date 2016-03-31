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
        protected delegate bool SearchStrategy(String Query, ProductEntity Product);

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
            komolineEntities DbContext = new komolineEntities();
            SearchStrategy SearchBy = (q, p) => false;
            Options.ForEach(x => 
                SearchBy = (q, p) => SearchBy(q, p) || SearchMethod[x](q, p));
            return DbContext.ProductEntities
                .Where(x => SearchBy(Query,x) && !x.is_deleted)
                .OrderBy(x => x.created_time)
                .Select(x => Converter.ToModel(x, null))
                .ToList();
        }

        public override Product GetProduct(string ID)
        {
            komolineEntities DbContext = new komolineEntities();
            var product = DbContext.ProductEntities
                .Where(x => SearchByID(ID, x) && !x.is_deleted)
                .SingleOrDefault();
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


        protected static SearchStrategy SearchByName = (q, p) => p.name.Contains(q);
        protected static SearchStrategy SearchByCategory = (q, p) => p.category.name.Contains(q);
        protected static SearchStrategy SearchByDescription = (q, p) => p.description.Contains(q);
        protected static SearchStrategy SearchByTag = (q, p) => p.tags.Any(x => x.tag_name.Contains(q));
        protected static SearchStrategy SearchByReview = (q, p) => p.transactions.Any(t => t.review.content.Contains(q));
        protected static SearchStrategy SearchByID = (ID, p) => p.id == ID;
        protected static SearchStrategy SearchByOwner = (Owner, p) => p.user.username == Owner;

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
