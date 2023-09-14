using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using caykimnho_studio.Models;

namespace caykimnho_studio.Controllers
{
    public class HomeController : Controller
    {
        caykimnhoEntities model = new caykimnhoEntities();
        public ActionResult Index()
        {
            var lstProduct = model.Products.ToList();
            Session["lst-category"] = model.Categories.ToList();
            return View("Index", lstProduct);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
    }
}