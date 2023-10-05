using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using caykimnho_studio.Models;
using caykimnho_studio.CheckRequest;
namespace caykimnho_studio.Controllers
{
    [CheckRequests]
    public class HomeController : Controller
    {
        aendysho_caykimnhoEntities model = new aendysho_caykimnhoEntities();
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

        [HttpPost]
        public ActionResult addCart(int id, int idColor, int idSize, int quantity)
        {
            var pro = model.Products.Find(id);
            var prodetail = pro.DetailProducts.Where(p => p.ID_Products == id && p.ID_Colors == idColor && p.ID_Size == idSize).First();

            if (prodetail == null || pro == null)
            {
                return Content("null");
            }

            if (Session["user-id"] == null)
            {
                if (Session["cart-local"] == null)
                {
                    var lstLocalCart = new List<ShoppingCart>();

                    ShoppingCart carts = new ShoppingCart();
                    carts.ID = Convert.ToInt32(Session["cart-id"].ToString());
                    carts.Total_Product = 1;
                    carts.First_Product_ID = id;
                    carts.First_Product_Name = pro.Name;
                    carts.First_Product_Images = prodetail.Images;


                    ShoppingCartDetail cartdetail = new ShoppingCartDetail();
                    cartdetail.ID_Cart = carts.ID;
                    cartdetail.ID_Products = id;
                    cartdetail.Product_Name = pro.Name;
                    cartdetail.Product_Color = prodetail.Colors.Name;
                    cartdetail.Product_Size = prodetail.Size.Name;
                    cartdetail.Product_Quantity = quantity;
                    cartdetail.Product_Price = prodetail.Price;
                    cartdetail.Product_Import_Price = prodetail.Import_Price;
                    cartdetail.Product_Sale = prodetail.Sale;
                    cartdetail.Add_Date = DateTime.Now;
                    cartdetail.ID_Color = prodetail.ID_Colors;
                    cartdetail.ID_Size = prodetail.ID_Size;
                    cartdetail.Product_Images = prodetail.Images;

                    carts.Total_Price = quantity * (prodetail.Price - (prodetail.Price * prodetail.Sale));

                    carts.ShoppingCartDetail.Add(cartdetail);
                    lstLocalCart.Add(carts);
                    Session["cart-local"] = lstLocalCart;
                    Session["cart-total"] = 1;
                    Session["cart-id"] = Convert.ToInt32(Session["cart-id"].ToString()) + 1;
                }
                else
                {
                    var lstLocalCart = Session["cart-local"] as List<ShoppingCart>;
                    var checkcart = lstLocalCart.FirstOrDefault(p => p.First_Product_ID == id);
                    if (checkcart != null)
                    {
                        var cartdetail = checkcart.ShoppingCartDetail.FirstOrDefault(p => p.ID_Products == id && p.ID_Color == idColor && p.ID_Size == idSize);
                        if (cartdetail != null)
                        {
                            int quantities = cartdetail.Product_Quantity;

                            if (quantities >= 100)
                            {
                                return Content("SL");
                            }
                            cartdetail.Product_Quantity = quantities + quantity;
                            checkcart.Total_Price += quantity * (prodetail.Price - (prodetail.Price * prodetail.Sale));

                            Session["cart-local"] = lstLocalCart;
                        }
                        else
                        {
                            checkcart.Total_Product = checkcart.Total_Product + 1;
                            ShoppingCartDetail cartdetails = new ShoppingCartDetail();
                            cartdetails.ID_Cart = checkcart.ID;
                            cartdetails.ID_Products = id;
                            cartdetails.Product_Name = pro.Name;
                            cartdetails.Product_Color = prodetail.Colors.Name;
                            cartdetails.Product_Size = prodetail.Size.Name;
                            cartdetails.Product_Quantity = quantity;
                            cartdetails.Product_Price = prodetail.Price;
                            cartdetails.Product_Import_Price = prodetail.Import_Price;
                            cartdetails.Product_Sale = prodetail.Sale;
                            cartdetails.Add_Date = DateTime.Now;
                            cartdetails.ID_Color = prodetail.ID_Colors;
                            cartdetails.ID_Size = prodetail.ID_Size;
                            cartdetails.Product_Images = prodetail.Images;

                            checkcart.Total_Price += (quantity * (prodetail.Price - (prodetail.Price * prodetail.Sale)));

                            checkcart.ShoppingCartDetail.Add(cartdetails);
                            Session["cart-local"] = lstLocalCart;
                        }
                    }
                    else
                    {
                        ShoppingCart carts = new ShoppingCart();
                        carts.ID = Convert.ToInt32(Session["cart-id"].ToString());
                        carts.Total_Product = 1;
                        carts.First_Product_ID = id;
                        carts.First_Product_Name = pro.Name;
                        carts.First_Product_Images = prodetail.Images;


                        ShoppingCartDetail cartdetail = new ShoppingCartDetail();
                        cartdetail.ID_Cart = carts.ID;
                        cartdetail.ID_Products = id;
                        cartdetail.Product_Name = pro.Name;
                        cartdetail.Product_Color = prodetail.Colors.Name;
                        cartdetail.Product_Size = prodetail.Size.Name;
                        cartdetail.Product_Quantity = quantity;
                        cartdetail.Product_Price = prodetail.Price;
                        cartdetail.Product_Import_Price = prodetail.Import_Price;
                        cartdetail.Product_Sale = prodetail.Sale;
                        cartdetail.Add_Date = DateTime.Now;
                        cartdetail.ID_Color = prodetail.ID_Colors;
                        cartdetail.ID_Size = prodetail.ID_Size;
                        cartdetail.Product_Images = prodetail.Images;

                        carts.Total_Price = quantity * (prodetail.Price - (prodetail.Price * prodetail.Sale));

                        carts.ShoppingCartDetail.Add(cartdetail);
                        lstLocalCart.Add(carts);
                        Session["cart-local"] = lstLocalCart;
                        Session["cart-total"] = Convert.ToInt32(Session["cart-total"].ToString()) + 1;
                        Session["cart-id"] = Convert.ToInt32(Session["cart-id"].ToString()) + 1;
                    }
                }
            }
            else
            {

            }

            return PartialView("_minicart");
        }
        [HttpPost]
        public ActionResult removeCartMainProduct(int id)
        {
            var lstLocalCart = Session["cart-local"] as List<ShoppingCart>;

            var mainProduct = lstLocalCart.Find(p => p.ID == id);
            if (mainProduct == null)
            {
                return Content("null");
            }

            lstLocalCart.Remove(mainProduct);
            Session["cart-local"] = lstLocalCart;
            Session["cart-total"] = Convert.ToInt32(Session["cart-total"].ToString()) - 1;

            return PartialView("_minicart");
        }

        [HttpPost]
        public ActionResult removeCartChildProduct(string contents)
        {
            var lstLocalCart = Session["cart-local"] as List<ShoppingCart>;
            int idPro = Convert.ToInt32(contents.Split('-')[0]);
            int idSize = Convert.ToInt32(contents.Split('-')[1]);
            int idColor = Convert.ToInt32(contents.Split('-')[2]);

            var mainProduct = lstLocalCart.Find(p => p.First_Product_ID == idPro);
            if (mainProduct == null)
            {
                return Content("null");
            }

            var detailProduLstct = mainProduct.ShoppingCartDetail.ToList();
            if (detailProduLstct.Count <= 1)
            {
                lstLocalCart.Remove(mainProduct);
                Session["cart-local"] = lstLocalCart;
                Session["cart-total"] = Convert.ToInt32(Session["cart-total"].ToString()) - 1;

                return PartialView("_minicart");
            }
            else
            {
                var detailPro = detailProduLstct.Find(p => p.ID_Products == idPro && p.ID_Size == idSize && p.ID_Color == idColor);
                if (detailPro == null)
                {
                    return Content("null");
                }

                detailProduLstct.Remove(detailPro);

                Session["cart-local"] = lstLocalCart;
                return PartialView("_minicart");
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
    }
}