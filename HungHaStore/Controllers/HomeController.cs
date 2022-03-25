using HungHaStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Helper;
using System.Net;
using System.Data.Entity;
using PagedList;

namespace HungHaStore.Controllers
{
    public class HomeController : Controller
    {
        public static Model1 db = new Model1();
        public ActionResult Index()
        {
            string daterange = "2022/03/26 - 2022/03/26";
            var query = db.hoa_don.OrderByDescending(s => s.id);
            string[] date = daterange.Split('-');
            DateTime dateStart = DateTime.ParseExact(date[0].Trim(), "yyyy/MM/dd", null);
            DateTime dateEnd = DateTime.ParseExact(date[1].Trim(), "yyyy/MM/dd", null);
            query = (IOrderedQueryable<hoa_don>)query.Where(s => s.tg_tao > dateStart && s.tg_tao < dateEnd);
            IEnumerable<hoa_don> hoaDons = query.ToPagedList(1, 10);

            // lấy dữ liệu từ database
            var loaiSanPham = db.loai_sp.SqlQuery("select * from loai_sp").ToList(); 
            var sanPhamNoiBat = db.san_pham.SqlQuery("select TOP 16 * from san_pham ").ToList(); 
            var sanPhamMoiNhat = db.san_pham.SqlQuery("select TOP 4 * from san_pham order by tg_tao desc").ToList();
            var sanPhamXemNhieu = db.san_pham.SqlQuery("select TOP 4 * from san_pham order by luot_xem desc").ToList();
            var sanPhamGiamGia = db.san_pham.SqlQuery("select TOP 4 * from san_pham where giam_gia > 0 order by giam_gia desc").ToList();
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

        public ActionResult ListInvoice()
        {
            nguoi_dung identity = AuthorHelper.getIdentity();
            if(identity == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<hoa_don> hoaDons = db.hoa_don.Where(s => s.id_nd == identity.id).ToList();
            return View(hoaDons);
        }
    }
}