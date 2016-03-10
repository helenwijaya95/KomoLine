using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public class IllegalAccessException : Exception
    {
        public IllegalAccessException(string Message): base(Message)
        {

        }
    }
}
