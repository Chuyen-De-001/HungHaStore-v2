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

        //Thêm sản phẩm vào giở hàng.
        public ActionResult Add(int id)
        {
            var currency = System.Globalization.CultureInfo.GetCultureInfo("vi-VN");
            Dictionary<string, string> response = new Dictionary<string, string>();
            san_pham sanPham = db.san_pham.SqlQuery("select * from san_pham where id = " + id).Single();
            List<Cart> list = CartHelper.Add(sanPham);
            response["count"] = CartHelper.getList().Count().ToString();
            response["sumMoney"] = String.Format(currency, "{0:c0}", CartHelper.sumMoney());
            return Content(JsonConvert.SerializeObject(response));
        }


        // Xóa sản phẩm khỏi giỏ hàng
        public ActionResult Remove(int id)
        {
            try
            {
                List<Cart> list = CartHelper.getList();
                list.RemoveAll(s => s.id_san_pham == id);
                return Content("true");
            }
            catch (Exception e) { }
            return Content("false");
        }

        public string RenderRazorViewToString(string viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext,viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }
    }
}