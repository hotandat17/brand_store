using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Delicious_Food.Areas.Administrator.Controllers
{
    public class CustomerController : Controller
    {
        Models.ShopperEntities dbCus = new Models.ShopperEntities();

        [HandleError]
        public ActionResult Index(string name, string error)
        {
            if (Session["accname"] == null)
            {
                Session["accname"] = null;
                return RedirectToAction("Login", "Account");
            }
            else
            {
                ViewBag.CusError = error;
                var model = dbCus.Customers.ToList();
                if (!string.IsNullOrEmpty(name))
                {
                    model = model.Where(p => p.cusPhone.Contains(name)).ToList();
                }
                return View(model);
            }
        }
    }
}