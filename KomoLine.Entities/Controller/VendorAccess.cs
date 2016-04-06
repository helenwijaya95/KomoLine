using KomoLine.Controller;
using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public class VendorAccess : BuyerAccess
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

        internal VendorAccess(Account Reference)
            : base(Reference)
        {
            Role = UserRole.Vendor;
        }

        public override void AddProduct(Product NewProduct)
        {
            komolineEntities DbContext = new komolineEntities();
            ProductEntity pe = Converter.ToEntity(NewProduct);
            var productIDs = DbContext.ProductEntities.Select(x => x.id);
            while (productIDs.Contains(pe.id))
            {
                pe.id = Converter.GenerateID();
            }
            pe.created_time = DateTime.Now;
            NewProduct.Owner = Reference;
            pe.category = DbContext.CategoryEntities.SingleOrDefault(x => x.name == NewProduct.Category);
            pe.tags = NewProduct.Tags
                .Select(x => new TagEntity()
                {
                    tag_name = x,
                    product_id = pe.id,
                    product = pe
                })
                .ToList();
            pe.user = DbContext.UserEntities.SingleOrDefault(x => x.username == NewProduct.Owner.Username);
            DbContext.ProductEntities.Add(pe);
            DbContext.SaveChanges();
        }

        public override void SaveProduct(Product NewData)
        {
            komolineEntities DbContext = new komolineEntities();
            ProductEntity pe = DbContext.ProductEntities.SingleOrDefault(x => x.id == NewData.ID);
            if (pe == null)
            {
                string error = string.Format(ErrorMessage.ERR_MISSING, NewData.ID);
                throw new ArgumentException(error);
            }
            if (pe.user.username != Reference.Username)
            {
                throw new InvalidOperationException(ErrorMessage.ERR_RESTRICTED_ITEM);
            }
            pe = Converter.ToEntity(NewData, pe);
            pe.category = DbContext.CategoryEntities.SingleOrDefault(x => x.name == NewData.Category) ?? pe.category;
            //Delete unused tags
            pe.tags
                .Where(x => !NewData.Tags
                    .Contains(x.tag_name))
                .ToList()
                .ForEach(x => pe.tags.Remove(x));
            //Add new tags
            NewData.Tags
                .Where(x => !pe.tags
                    .Select(t => t.tag_name)
                    .Contains(x))
                .Select(x => new TagEntity()
                {
                    tag_name = x,
                    product = pe,
                    product_id = pe.id
                })
                .ToList()
                .ForEach(x => pe.tags.Add(x));
            DbContext.SaveChanges();
        }

        public override void DeleteProduct(Product OldProduct)
        {
            komolineEntities DbContext = new komolineEntities();
            ProductEntity pe = DbContext.ProductEntities.SingleOrDefault(x => x.id == OldProduct.ID && !x.is_deleted);
            if (pe == null)
            {
                string error = string.Format(ErrorMessage.ERR_MISSING, OldProduct.ID);
                throw new ArgumentException(error);
            }
            if (pe.user.username != Reference.Username)
            {
                throw new InvalidOperationException(ErrorMessage.ERR_RESTRICTED_ITEM);
            }
            pe.is_deleted = true;
            DbContext.SaveChanges();
        }

        public override void AcceptOrder(Transaction Purchase)
        {
            komolineEntities DbContext = new komolineEntities();
            var trans = DbContext.TransactionEntities.SingleOrDefault(x => x.code == Purchase.Code);
            AlterTransaction(trans, TransactionStatus.Started, TransactionStatus.Accepted, ErrorMessage.ERR_CANNOT_ACCEPT);
            DbContext.SaveChanges();
        }

        public override List<Transaction> ViewSales()
        {
            komolineEntities DbContext = new komolineEntities();
            var res = DbContext.TransactionEntities
                .Where(x => x.product.user.username == Reference.Username)
                .ToList();
            return res.Select(x => Converter.ToModel(x, null)).ToList();
        }
    }
}
