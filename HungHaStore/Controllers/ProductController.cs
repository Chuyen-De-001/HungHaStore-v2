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
            string query = "select * from san_pham where 1=1";
            IEnumerable<san_pham> model;
            IEnumerable<loai_sp> loaiSanPham;
            loaiSanPham = db.loai_sp.ToList();
            model = (IEnumerable<san_pham>)db.san_pham;
            if (search != "")
            {
                query = query + " and ten like N'%"+search+"%'";
                //model = model.Where(s => s.ten.Contains(search));
            }

            if(price != "" && price != null)
            {
                string[] price_arr;
                price_arr = price.Split(':');
                if(price_arr.Count() > 1)
                {
                    query = query + " and gia_tien > " + price_arr[0] + " and gia_tien < " + price_arr[1];
                    //model = model.Where(s => s.gia_tien > Int32.Parse(price_arr[0])).Where(s => s.gia_tien < Int32.Parse(price_arr[1]));
                }
                else
                {
                    query = query + " and gia_tien > " + price_arr[0];
                    //model = model.Where(s => s.gia_tien > Int32.Parse(price_arr[0]));
                }
            }
            if (danh_muc_sp != "" && danh_muc_sp != null)
            {
                query = query + " and id_loai_sp in (" + danh_muc_sp + ")";
            }

            query = query + " order by id desc";
            //model = model.OrderByDescending(s=>s.id).ToPagedList();
            model = db.san_pham.SqlQuery(query).ToPagedList(page, pageSize);
            ViewBag.pageSize = pageSize;
            ViewBag.loaiSanPham = loaiSanPham;
            return View(model);
        }

        //Xem chi tiết sản phẩm.
        public ActionResult Detail(int id)
        {
            san_pham model = db.san_pham.SqlQuery("select * from san_pham where id =" + id).Single();
            db.Database.ExecuteSqlCommand("UPDATE [dbo].[san_pham] SET [luot_xem] = "+(model.luot_xem + 1)+" WHERE id = "+model.id);
            List<san_pham> sanPhamLienQuan = db.san_pham.SqlQuery("select top 4 * from san_pham where id_loai_sp = " + model.id_loai_sp).ToList();
            ViewBag.sanPhamLienQuan = sanPhamLienQuan;
            return View(model);
        }
    }
}