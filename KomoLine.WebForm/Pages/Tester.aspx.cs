﻿using KomoLine.Data.Controller;
using KomoLine.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KomoLine.WebForm.Pages
{
    public partial class Tester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account lusi = new Account();
            lusi.Login("lusi", "lusiana");

            lusi.Name = "Kucing";
            lusi.SaveProfile();

            Transaction t = lusi.GetTransaction("fbDLZimumkGZFXad6m4Fpg");
            Random rng = new Random();
            lusi.RatePurchase(t, rng.Next(1,5));
        }
    }
}