using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using caykimnho_studio.Models;
using caykimnho_studio.CheckCarts;
namespace caykimnho_studio.Controllers
{
    [CheckCartsLocal]
    public class HomeController : Controller
    {
        caykimnhoEntities model = new caykimnhoEntities();
        public ActionResult Index()
        {
            var lstProduct = model.Products.ToList();
            return View("index", lstProduct);
        }

        public ActionResult ProductDetail(int id)
        {
            var pro = model.Products.Find(id);
            Session["relate-product"] = model.Products.Where(p => p.ID_Category == pro.ID_Category).Take(8).ToList();
            return View("productdetail", pro);
        }

        [HttpPost]
        public ActionResult QuickViewProduct(int id)
        {
            var pro = model.Products.Find(id);
            return PartialView("_productQuickView", pro);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
    }
}