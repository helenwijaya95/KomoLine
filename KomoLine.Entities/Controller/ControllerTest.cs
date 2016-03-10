using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KomoLine.Data.Controller
{
    public static class ControllerTest
    {
        public static void RegistrationTest(Account Test, string Password, string Status)
        {
            Test.Register(Password, Status);
        }

        public static Account LoginTest(string Username, string Password)
        {
            Account test = new Account();
            test.Login(Username, Password);
            return test;
        }

    }
}
