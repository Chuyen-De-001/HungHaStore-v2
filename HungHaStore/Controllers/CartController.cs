using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
            nguoi_dung nguoiDung = AuthorHelper.getIdentity();

            if(hoaDon.id_nd != null)
            {
                if(nguoiDung == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
                }
                else
                {
                    if(nguoiDung.id != hoaDon.id_nd)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
                    }
                }
                
            }
            if (hoaDon != null)
            {
                List<chitiet_hd> chiTietHDs = db.chitiet_hd.Where(s => s.id_hd == id).ToList();
                ViewBag.chiTietHDs = chiTietHDs;
                ViewBag.nguoiDung = nguoiDung;
                return View(hoaDon);
            }
            return RedirectToAction("Index","Home");
        }

        //Xóa tất cả sản phẩm khỏi giỏ hàng.
        public ActionResult RemoveCart()
        {
            CartHelper.setList(null);
            return RedirectToAction("Index", "Cart");
        }


        //Form nhập thông tin nhận hàng.
        public ActionResult OrderInfo()
        {
            List<Cart> list = CartHelper.getList();
            nguoi_dung nguoiDung = AuthorHelper.getIdentity();
            ViewBag.nguoiDung = nguoiDung;
            return View(list); 
        }


        //Tạo HD đơn.
        public ActionResult CreateInvoice(string ten_nguoi_nhan,string sdt_nhan,string dia_chi_nhan,int phuong_thuc)
        {
            DateTime date = DateTime.Now;
            nguoi_dung identity = AuthorHelper.getIdentity();
            List<Cart> list = CartHelper.getList();
            if(list != null)
            {
                hoa_don invoice = new hoa_don();
                if(identity != null)
                {
                    invoice.id_nd = identity.id;
                }
                else {
                    invoice.id_nd = null;
                }
                invoice.trang_thai = hoa_don.TRANG_THAI_XU_LY;
                invoice.tong_tien = CartHelper.sumMoney();
                invoice.ten_nguoi_nhan = ten_nguoi_nhan;
                invoice.dia_chi_nhan = dia_chi_nhan;
                invoice.sdt_nhan = sdt_nhan;
                invoice.phuong_thuc = phuong_thuc;
                invoice.tg_tao = date;
                db.hoa_don.Add(invoice);
                db.SaveChanges();
                foreach(Cart item in list)
                {
                    chitiet_hd invoiceDetail = new chitiet_hd();
                    invoiceDetail.id_hd = invoice.id;
                    invoiceDetail.id_sp = item.id_san_pham;
                    invoiceDetail.so_luong = item.so_luong;
                    invoiceDetail.ten_sp = item.ten;
                    invoiceDetail.gia_tien = CalculatorHelper.priceSale(item.giam_gia,item.gia_tien);
                    db.chitiet_hd.Add(invoiceDetail);
                    db.SaveChanges();
                }
                CartHelper.setList(null);
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Tạo hóa đơn thành công, chờ để được xử lý.";
                return RedirectToAction("Checkout", "Cart", new { id = invoice.id });
            }
            HttpContext.Session["typeAlert"] = "danger";
            HttpContext.Session["messageAlert"] = "Xảy ra lỗi khi tạo hóa đơn.";
            return RedirectToAction("Index", "Cart");
        }
    }
}