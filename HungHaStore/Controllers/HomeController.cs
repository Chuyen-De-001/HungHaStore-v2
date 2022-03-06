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
            
            var loaiSanPham = db.loai_sp.SqlQuery("select * from loai_sp").ToList(); 
            var sanPhamNoiBat = db.san_pham.SqlQuery("select TOP 16 * from san_pham ").ToList(); 
            var sanPhamMoiNhat = db.san_pham.SqlQuery("select TOP 6 * from san_pham order by tg_tao desc").ToList();
            var sanPhamXemNhieu = db.san_pham.SqlQuery("select TOP 6 * from san_pham order by luot_xem desc").ToList();
            var sanPhamGiamGia = db.san_pham.SqlQuery("select TOP 6 * from san_pham order by giam_gia desc").ToList();
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

        public ActionResult Test()
        {
            List<san_pham> list = db.san_pham.SqlQuery("select * from san_pham").ToList();
            Random rnd = new Random();
            foreach (san_pham item in list)
            {
                kho kho = new kho();
                kho.so_luong = rnd.Next(1, 50);
                db.khoes.Add(kho);
                db.SaveChanges();
                Response.Write(kho.id);
                item.id_kho = kho.id;
                UpdateModel(item);
                db.SaveChanges();
            }
            
            return View();
        }
    }
}