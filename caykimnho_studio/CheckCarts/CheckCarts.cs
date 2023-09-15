using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using caykimnho_studio.Models;
namespace caykimnho_studio.CheckCarts
{
    public class CheckCartsLocal : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if(filterContext.HttpContext.Session["lst-category"] == null)
            {
                caykimnhoEntities model = new caykimnhoEntities();
                filterContext.HttpContext.Session["lst-category"] = model.Categories.ToList();
            }

            if (filterContext.HttpContext.Session["cart-local"] == null)
            {
                filterContext.HttpContext.Session["cart-local"] = 0;
            }
            return;
        }
    }
}