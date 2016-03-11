using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Model
{
    public class Product
    {
        private string id;
        private string name;
        private double minOrder;
        private string description;
        private DateTime created;
        private double price;
        private string photoPath;
        private Account owner;

        private double rating;
        private List<string> tags = new List<string>();
        private Dictionary<Account, string> reviews = new Dictionary<Account,string>();
        private string category;

        public string ID
        {
            get { return id; }
            internal set { id = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public double MinimalOrder
        {
            get { return minOrder; }
            set { minOrder = value; }
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public DateTime CreatedOn
        {
            get { return created; }
            set { created = value; }
        }
        public double Price
        {
            get { return price; }
            set { price = value; }
        }
        public string PhotoPath
        {
            get { return photoPath; }
            set { photoPath = value; }
        }
        public Account Owner
        {
            get { return owner; }
            internal set { owner = value; }
        }
        public double Rating
        {
            get { return rating; }
            internal set { rating = value; }
        }
        public Dictionary<Account, string> Reviews
        {
            get { return reviews; }
            internal set { reviews = value; }
        }
        public string Category
        {
            get { return category; }
            set { category = value; }
        }
        public List<string> Tags
        {
            get { return tags; }
            set { tags = value; }
        }
    }
}
