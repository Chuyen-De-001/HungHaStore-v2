using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using HungHaStore.Helper;
using System.Text;
using System.IO;
using System.Web.UI;
using Newtonsoft.Json;

namespace HungHaStore.Controllers
{

    public class AjaxController : Controller
    {
        public static Model1 db = new Model1();
        // GET: Ajax
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(int id)
        {
            var currency = System.Globalization.CultureInfo.GetCultureInfo("vi-VN");
            Dictionary<string, string> response = new Dictionary<string, string>();
            san_pham sanPham = db.san_pham.Where(s => s.id == id).Single();
            List<Cart> list = CartHelper.Add(sanPham);
            //response["view"] = RenderRazorViewToString("~/Views/Ajax/Add.cshtml", list);
            response["count"] = CartHelper.getList().Count().ToString();
            response["sumMoney"] = String.Format(currency, "{0:c0}", CartHelper.sumMoney());
            return Content(JsonConvert.SerializeObject(response));
        }

        public string RenderRazorViewToString(string viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext,
                                                                         viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View,
                                             ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }
    }
}