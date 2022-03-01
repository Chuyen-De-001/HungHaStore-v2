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
        public ActionResult Index(int page = 1, string search = "", int pageSize = 15, string price = "")
        {
            string danh_muc_sp = Request.QueryString["danh_muc_sp"];
            IEnumerable<san_pham> model;
            IEnumerable<loai_sp> loaiSanPham;
            loaiSanPham = db.loai_sp.ToList();
            model = (IEnumerable<san_pham>)db.san_pham;
            if (search != "")
            {
                model = model.Where(s => s.ten.Contains(search));
            }

            if(price != "")
            {
                string[] price_arr;
                price_arr = price.Split(':');
                if(price_arr.Count() > 1)
                {
                    model = model.Where(s => s.gia_tien > Int32.Parse(price_arr[0])).Where(s => s.gia_tien < Int32.Parse(price_arr[1]));
                }
                else
                {
                    model = model.Where(s => s.gia_tien > Int32.Parse(price_arr[0]));
                }
               
            }
            if (danh_muc_sp != null)
            {
                string[] danh_muc_sp_arr = danh_muc_sp.Split(',');
                model = model.Where(s => danh_muc_sp_arr.Contains(s.id_loai_sp.ToString()));
            }
            model = model.OrderByDescending(s=>s.id).ToPagedList(page, pageSize);
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