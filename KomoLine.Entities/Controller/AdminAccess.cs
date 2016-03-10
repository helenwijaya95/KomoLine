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

        public AdminAccess(Account Reference)
            : base(Reference)
        {
            Name = "admin";
        }
    }
}
