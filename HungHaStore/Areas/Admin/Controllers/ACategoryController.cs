using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using HungHaStore.Helper;
using PagedList;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class ACategoryController : AuthorController
    {
        private Model1 db = new Model1();

        // GET: Admin/Category
        public ActionResult Index(int pageSize = 20, int page = 1)
        {
            IEnumerable<loai_sp> loaiSPs = db.loai_sp.OrderByDescending(s=>s.id).ToPagedList(page, pageSize);
            return View(loaiSPs);
        }

        // GET: Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            loai_sp loai_sp = db.loai_sp.Find(id);
            if (loai_sp == null)
            {
                return HttpNotFound();
            }
            return View(loai_sp);
        }

        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,ten,mo_ta,tg_tao")] loai_sp loai_sp)
        {
            if (ModelState.IsValid)
            {
                db.loai_sp.Add(loai_sp);
                db.SaveChanges();
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Tạo danh mục sản phẩm thanh công";
                return RedirectToAction("Index");
            }

            return View(loai_sp);
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (AuthorHelper.getIdentity() == null && AuthorHelper.isAdmin(AuthorHelper.getIdentity()) == false)
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            loai_sp loai_sp = db.loai_sp.Find(id);
            if (loai_sp == null)
            {
                return HttpNotFound();
            }
            return View(loai_sp);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,ten,mo_ta,tg_tao")] loai_sp loai_sp)
        {
            if (AuthorHelper.getIdentity() == null && AuthorHelper.isAdmin(AuthorHelper.getIdentity()) == false)
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }
            if (ModelState.IsValid)
            {
                db.Entry(loai_sp).State = EntityState.Modified;
                db.SaveChanges();
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Sửa thông tin danh mục sản phẩm thành công.";
                return RedirectToAction("Index");
            }
            return View(loai_sp);
        }

        // GET: Admin/Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (AuthorHelper.getIdentity() == null && AuthorHelper.isAdmin(AuthorHelper.getIdentity()) == false)
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }
            loai_sp model = db.loai_sp.Find(id);
            List<san_pham> sanPhams = db.san_pham.Where(s => s.id_loai_sp == model.id).ToList();
            foreach(san_pham item in sanPhams)
            {
                kho kho = item.kho;
                db.san_pham.Remove(item);
                db.SaveChanges();
                db.khoes.Remove(kho);
                db.SaveChanges();
            }
            db.loai_sp.Remove(model);
            db.SaveChanges();
            HttpContext.Session["typeAlert"] = "success";
            HttpContext.Session["messageAlert"] = "Xóa danh mục sản phẩm thành công.";
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
