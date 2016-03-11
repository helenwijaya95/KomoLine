using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Model
{
    public class Product
    {
        private string name;
        private double minOrder;
        private string description;
        private DateTime created;
        private double price;
        private string photoPath;

        private Account owner;
        private double rating;
        private Dictionary<Account, string> reviews;
        private string category;

        public string Category
        {
            get { return category; }
            internal set { category = value; }
        }

    }
}
