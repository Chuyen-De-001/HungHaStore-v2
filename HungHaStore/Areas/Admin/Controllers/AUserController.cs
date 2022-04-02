using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using PagedList;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class AUserController : AuthorController
    {
        private Model1 db = new Model1();

        // GET: Admin/AUser
        public ActionResult Index(int pageSize = 20, int page = 1,string search = "")
        {
            var query = db.nguoi_dung.OrderByDescending(s => s.id);
            if(search != "")
            {
                query = (IOrderedQueryable<nguoi_dung>)query.Where(s => s.ho_ten.Contains(search) || s.email.Contains(search) || s.sdt.Contains(search) || s.tai_khoan.Contains(search));
            }
            IEnumerable<nguoi_dung> nguoiDungs = query.ToPagedList(page, pageSize);
            ViewBag.search = search;
            return View(nguoiDungs);
        }

        // GET: Admin/AUser/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoi_dung nguoi_dung = db.nguoi_dung.Find(id);
            if (nguoi_dung == null)
            {
                return HttpNotFound();
            }
            return View(nguoi_dung);
        }

        // GET: Admin/AUser/Create
        public ActionResult Create()
        {
            return View();
        }
        // GET: Admin/AUser/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nguoi_dung nguoi_dung = db.nguoi_dung.Find(id);
            if (nguoi_dung == null)
            {
                return HttpNotFound();
            }
            return View(nguoi_dung);
        }

        // POST: Admin/AUser/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,tai_khoan,mat_khau,email,ngay_sinh,sdt,dia_chi,gioi_tinh,quyen,tg_tao")] nguoi_dung nguoi_dung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoi_dung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nguoi_dung);
        }

        // GET: Admin/AUser/Delete/5
        public ActionResult Delete(int? id)
        {
            nguoi_dung nguoi_dung = db.nguoi_dung.Find(id);
            db.nguoi_dung.Remove(nguoi_dung);
            db.SaveChanges();
            HttpContext.Session["typeAlert"] = "success";
            HttpContext.Session["messageAlert"] = "Xóa khách hàng thành công.";
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
