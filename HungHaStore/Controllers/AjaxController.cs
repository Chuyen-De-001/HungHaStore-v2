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

       public ActionResult Test()
        {
            return Content("false");
        }

        public ActionResult Order(string email,int id_sp)
        {
            DateTime date = DateTime.Now;
            try
            {
                string query = "INSERT INTO [dbo].[dat_hang]([email],[id_sp],[tg_tao]) VALUES ('" + email + "', " + id_sp + ", '" + date.ToString("yyyy-MM-dd") + "')";
                db.dat_hang.SqlQuery(query);
                return Content("true");
            }
            catch (Exception e){}
            return Content("false");
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

    }
}