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

namespace HungHaStore.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/Product
        public ActionResult Index()
        {
            var san_pham = db.san_pham.Include(s => s.kho).Include(s => s.loai_sp).Include(s => s.nha_cung_cap);
            return View(san_pham.ToList());
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
            return View();
        }

        // POST: Admin/Product/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,ten,id_loai_sp,gia_tien,giam_gia,mo_ta,id_kho,id_ncc,hinh_anh,luot_xem,tg_tao")] san_pham san_pham)
        {
            if (ModelState.IsValid)
            {
                db.san_pham.Add(san_pham);
                db.SaveChanges();
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
