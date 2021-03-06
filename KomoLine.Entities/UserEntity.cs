//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KomoLine.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserEntity
    {
        public UserEntity()
        {
            this.products = new HashSet<ProductEntity>();
            this.transactions = new HashSet<TransactionEntity>();
        }
    
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string phone_number { get; set; }
        public string email { get; set; }
        public string photo_path { get; set; }
        public System.DateTime register_time { get; set; }
        public Nullable<System.DateTime> confirmed_time { get; set; }
        public Nullable<bool> is_deleted { get; set; }
        public string status { get; set; }
        public Nullable<bool> request_promotion { get; set; }
    
        public virtual ICollection<ProductEntity> products { get; set; }
        public virtual ICollection<TransactionEntity> transactions { get; set; }
    }
}
