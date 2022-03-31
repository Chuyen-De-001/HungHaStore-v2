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
        //Kiểm tra số lượng sản phẩm trong kho. Nếu không đủ thì sẽ thông báo.
        public ActionResult Add(int id,int? soluong)
        {
            var currency = System.Globalization.CultureInfo.GetCultureInfo("vi-VN");
            Dictionary<string, string> response = new Dictionary<string, string>();
            response["status"] = "200";
            response["message"] = "";
            response["count"] = "";
            response["sumMoney"] = "";
            san_pham sanPham = db.san_pham.Find(id);
            Cart cart = CartHelper.getList().Find(s => s.id_san_pham == sanPham.id);
            if (cart == null)
            {
                if(soluong > sanPham.kho.so_luong)
                {
                    response["status"] = "400";
                    response["message"] = "Số lượng sản phẩm không đủ. Trong kho chỉ còn "+sanPham.kho.so_luong+" sản phẩm";
                }
            }
            else
            {
                if(cart.so_luong + soluong > sanPham.kho.so_luong)
                {
                    response["status"] = "400";
                    response["message"] = "Số lượng sản phẩm không đủ. Trong kho chỉ còn " + sanPham.kho.so_luong + " sản phẩm";
                }
            }
            if(response["status"] == "200")
            {
                List<Cart> list = CartHelper.Add(sanPham, soluong);
                response["count"] = CartHelper.getList().Count().ToString();
                response["sumMoney"] = String.Format(currency, "{0:c0}", CartHelper.sumMoney());
            }
            return Content(JsonConvert.SerializeObject(response));   
        }

        public ActionResult Order(string email,int id_sp)
        {
            DateTime date = DateTime.Now;
            try
            {
                string query = "INSERT INTO [dbo].[dat_hang]([email],[id_sp],[tg_tao]) VALUES ('" + email + "', " + id_sp + ", '" + date.ToString("yyyy-MM-dd") + "')";
                db.Database.ExecuteSqlCommand(query);
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


        //Cập nhập số lượng sản phẩm trong giỏ h
        public ActionResult Quantity(int id,int soluong)
        {
            try
            {
                san_pham sanPham = db.san_pham.Find(id);
                List<Cart> list = CartHelper.getList();
                if (soluong < 1)
                {
                    list.RemoveAll(s => s.id_san_pham == id);
                    return Content("true");
                }
                Cart model = new Cart();
                foreach (Cart item in list)
                {
                    if (item.id_san_pham == sanPham.id)
                    {
                        model = item;
                    }
                }
                model.so_luong = soluong;
                model.tong = soluong * CalculatorHelper.priceSale(sanPham.giam_gia, sanPham.gia_tien);
                CartHelper.updateOne(model, list);
                return Content("true");
            }
            catch(Exception e)
            {
                return Content("false");
            }
        }

    }
}