using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using caykimnho_studio.Models;
namespace caykimnho_studio.CheckRequest
{
    public class CheckRequests : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session["lst-category"] == null)
            {
                aendysho_caykimnhoEntities model = new aendysho_caykimnhoEntities();
                filterContext.HttpContext.Session["lst-category"] = model.Categories.ToList();
            }

            if (filterContext.HttpContext.Session["cart-local"] == null
                || filterContext.HttpContext.Session["cart-total"] == null
                || filterContext.HttpContext.Session["cart-id"] == null)
            {
                filterContext.HttpContext.Session["cart-total"] = 0;
                filterContext.HttpContext.Session["cart-local"] = null;
                filterContext.HttpContext.Session["cart-id"] = 1;

            }

            if (filterContext.HttpContext.Session["user-id"] == null)
            {
                filterContext.HttpContext.Session["user-id"] = null;
            }
            return;
        }
    }
}