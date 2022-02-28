using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using HungHaStore.Models;
using PagedList;

namespace HungHaStore.Controllers
{
    public class ProductController : Controller
    {

        public static Model1 db = new Model1();

        // GET: Product
        public ActionResult Index(int page = 1,string search = "",int pageSize = 15)
        {
            IEnumerable<san_pham> model;
            IEnumerable<loai_sp> loaiSanPham;

            loaiSanPham = db.loai_sp.ToList();
            if (search == "")
            {
                model = (IEnumerable<san_pham>)db.san_pham.OrderByDescending(s=>s.id).ToPagedList(page, pageSize);
            }
            else
            {
                model = (IEnumerable<san_pham>)db.san_pham.Where(s => s.ten.Contains(search)).OrderByDescending(s => s.id).ToPagedList(page, pageSize);
            }
            ViewBag.pageSize = pageSize;
            ViewBag.loaiSanPham = loaiSanPham;
            return View(model);
        }

        public ActionResult Detail()
        {
            return View();
        }
    }
}