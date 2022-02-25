using HungHaStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HungHaStore.Controllers
{
    public class HomeController : Controller
    {
        public static Model1 db = new Model1();
        public ActionResult Index()
        {
            // lấy dữ liệu từ database
            var loaiSanPham = db.loai_sp.ToList(); 
            var sanPhamNoiBat = db.san_pham.Take(16).ToList(); 
            var sanPhamMoiNhat = db.san_pham.OrderByDescending(s => s.tg_tao).Take(6).ToList();
            var sanPhamXemNhieu = db.san_pham.OrderByDescending(s=>s.luot_xem).Take(6).ToList();
            var sanPhamGiamGia = db.san_pham.OrderByDescending(s => s.giam_gia).Take(6).ToList();
            //----------------------------------


            //truyền DL sang view
            ViewBag.sanPhamGiamGia = sanPhamGiamGia;
            ViewBag.sanPhamXemNhieu = sanPhamXemNhieu;
            ViewBag.sanPhamMoiNhat = sanPhamMoiNhat;
            ViewBag.sanPhamNoiBat = sanPhamNoiBat; 
            ViewBag.loaiSanPham = loaiSanPham; 
            //------------------------
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}