

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using PagedList;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class AProductController : AuthorController
    {
        private Model1 db = new Model1();

        // GET: Admin/Product
        public ActionResult Index(int pageSize = 20,int page = 1,string search="")
        {
            var query = db.san_pham.OrderByDescending(s => s.id);
            if(search != "")
            {
                query = (IOrderedQueryable<san_pham>)query.Where(s => s.ten.Contains(search));
            }
            IEnumerable<san_pham> model = query.ToPagedList(page, pageSize);
            ViewBag.search = search;
            return View(model);
        }

        // GET: Admin/Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            san_pham san_pham = db.san_pham.Find(id);
            if (san_pham == null)
            {
                return HttpNotFound();
            }
            return View(san_pham);
        }

        // GET: Admin/Product/Create
        public ActionResult Create()
        {
            ViewBag.id_kho = new SelectList(db.khoes, "id", "id");
            ViewBag.id_loai_sp = new SelectList(db.loai_sp, "id", "ten");
            ViewBag.id_ncc = new SelectList(db.nha_cung_cap, "id", "ten");
            san_pham model = new san_pham();
            model.giam_gia = 0;
            model.mo_ta = "hiện tại chưa có mô tả về sản phẩm.";
            return View(model);
        }

        // POST: Admin/Product/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ten,id_loai_sp,gia_tien,giam_gia,mo_ta,id_kho,id_ncc,hinh_anh,luot_xem,tg_tao")] san_pham san_pham, HttpPostedFileBase fileImg)
        {
            DateTime date = DateTime.Now;
            Random rnd = new Random();
            san_pham.tg_tao = date;
            if (fileImg != null && fileImg.ContentLength > 0)
            {
                string _path = Path.Combine(Server.MapPath("~/Assest/img/product/"), fileImg.FileName);
                fileImg.SaveAs(_path);
                san_pham.hinh_anh = fileImg.FileName;
            }
            if (ModelState.IsValid)
            {
                kho kho = new kho();
                kho.so_luong = 0;
                db.khoes.Add(kho);
                db.SaveChanges();
                san_pham.id_kho = kho.id;
                db.san_pham.Add(san_pham);
                db.SaveChanges();
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Tạo danh sản phẩm thanh công";
                return RedirectToAction("Index");
            }
            ViewBag.id_kho = new SelectList(db.khoes, "id", "id", san_pham.id_kho);
            ViewBag.id_loai_sp = new SelectList(db.loai_sp, "id", "ten", san_pham.id_loai_sp);
            ViewBag.id_ncc = new SelectList(db.nha_cung_cap, "id", "ten", san_pham.id_ncc);
            return View(san_pham);
        }

        // GET: Admin/Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            san_pham san_pham = db.san_pham.Find(id);
            if (san_pham == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_kho = new SelectList(db.khoes, "id", "id", san_pham.id_kho);
            ViewBag.id_loai_sp = new SelectList(db.loai_sp, "id", "ten", san_pham.id_loai_sp);
            ViewBag.id_ncc = new SelectList(db.nha_cung_cap, "id", "ten", san_pham.id_ncc);
            return View(san_pham);
        }

        // POST: Admin/Product/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,ten,id_loai_sp,gia_tien,giam_gia,mo_ta,id_kho,id_ncc,hinh_anh,luot_xem,tg_tao")] san_pham san_pham, HttpPostedFileBase fileImg)
        {
            if (ModelState.IsValid)
            {
                if (fileImg != null && fileImg.ContentLength > 0)
                {
                    string _path = Path.Combine(Server.MapPath("~/Assest/img/product/"), fileImg.FileName);
                    fileImg.SaveAs(_path);
                    san_pham.hinh_anh = fileImg.FileName;
                }
                db.Entry(san_pham).State = EntityState.Modified;
                db.SaveChanges();
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Thêm sản phẩm thành công.";
                return RedirectToAction("Index");
            }
            ViewBag.id_kho = new SelectList(db.khoes, "id", "id", san_pham.id_kho);
            ViewBag.id_loai_sp = new SelectList(db.loai_sp, "id", "ten", san_pham.id_loai_sp);
            ViewBag.id_ncc = new SelectList(db.nha_cung_cap, "id", "ten", san_pham.id_ncc);
            return View(san_pham);
        }

        // GET: Admin/Product/Delete/5
        public ActionResult Delete(int? id)
        {
            san_pham san_pham = db.san_pham.Find(id);
            db.khoes.Remove(san_pham.kho);
            db.san_pham.Remove(san_pham);
            db.SaveChanges();
            HttpContext.Session["typeAlert"] = "success";
            HttpContext.Session["messageAlert"] = "Xóa sản phẩm thành công.";
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
