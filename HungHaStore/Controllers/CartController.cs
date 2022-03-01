using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Helper;

namespace HungHaStore.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            List<Cart> list = CartHelper.getList();
            return View(list);
        }
    }
}