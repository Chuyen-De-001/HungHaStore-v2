using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Helper;
using HungHaStore.Models;

namespace HungHaStore.Controllers
{

    
    public class CartController : Controller
    {
        public static Model1 db = new Model1();

        // GET: Cart
        public ActionResult Index()
        {
            List<Cart> list = CartHelper.getList();
            return View(list);
        }

        public ActionResult Checkout(int id)
        {
            hoa_don hoaDon = db.hoa_don.Where(s => s.id == id).SingleOrDefault();
            if(hoaDon != null)
            {
                List<chitiet_hd> chiTietHDs = db.chitiet_hd.Where(s => s.id_hd == id).ToList();
                ViewBag.chiTietHDs = chiTietHDs;
                return View(hoaDon);
            }
            return RedirectToAction("Index","Home");
        }

        public ActionResult CreateInvoice()
        {
            DateTime date = DateTime.Now;
            nguoi_dung identity = AuthorHelper.getIdentity();
            if(identity == null)
            {
                HttpContext.Session["typeAlert"] = "danger";
                HttpContext.Session["messageAlert"] = "Phải đăng nhập mới có thể tạo hóa đơn.";
                return RedirectToAction("Index", "Cart");
            }
            List<Cart> list = CartHelper.getList();
            if(list != null)
            {
                hoa_don invoice = new hoa_don();
                invoice.id_nd = AuthorHelper.getIdentity().id;
                invoice.trang_thai = hoa_don.TRANG_THAI_XU_LY;
                invoice.tong_tien = CartHelper.sumMoney();
                invoice.tg_tao = date;
                db.hoa_don.Add(invoice);
                db.SaveChanges();
                foreach(Cart item in list)
                {
                    chitiet_hd invoiceDetail = new chitiet_hd();
                    invoiceDetail.id_hd = invoice.id;
                    invoiceDetail.id_sp = item.id_san_pham;
                    invoiceDetail.so_luong = item.so_luong;
                    invoiceDetail.gia_tien = CalculatorHelper.priceSale(item.giam_gia,item.gia_tien);
                    db.chitiet_hd.Add(invoiceDetail);
                    db.SaveChanges();
                }
                CartHelper.setList(null);
                return RedirectToAction("Checkout", "Cart", new { id = invoice.id });
            }
            HttpContext.Session["typeAlert"] = "danger";
            HttpContext.Session["messageAlert"] = "Xảy ra lỗi khi tạo hóa đơn.";
            return RedirectToAction("Index", "Cart");
        }
    }
}