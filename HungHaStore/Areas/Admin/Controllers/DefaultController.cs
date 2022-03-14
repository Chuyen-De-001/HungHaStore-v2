using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class DefaultController : AuthorController
    {
        // GET: Admin/Default
        public ActionResult Index()
        {
            return View();
        }
    }
}