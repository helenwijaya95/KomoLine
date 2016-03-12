using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KomoLine.Data.Model
{
    public class Transaction
    {
        private string code;
        private DateTime startTime;
        private DateTime? finishTime;
        private TransactionStatus status;
        private string review;
        private double? rating;
        private double quantity;
        private Product product;
        private Account buyer;

        public Account Buyer
        {
            get { return buyer; }
            internal set { buyer = value; }
        }

        public Product Product
        {
            get { return product; }
            internal set { product = value; }
        }

        public double Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }

        public double? Rating
        {
            get { return rating; }
            internal set { rating = value; }
        }

        public string Review
        {
            get { return review; }
            internal set { review = value; }
        }

        public TransactionStatus Status
        {
            get { return status; }
            internal set { status = value; }
        }

        public DateTime? ConfirmedOn
        {
            get { return finishTime; }
            set { finishTime = value; }
        }

        public DateTime StartOn
        {
            get { return startTime; }
            set { startTime = value; }
        }

        public string Code
        {
            get { return code; }
            internal set { code = value; }
        }

    }

    public enum TransactionStatus
    {
        Started,
        Accepted,
        Canceled,
        Finished
    }
}
