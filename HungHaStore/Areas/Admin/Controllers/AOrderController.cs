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
    public class AOrderController : AuthorController
    {
        private Model1 db = new Model1();

        // GET: Admin/AOrder
        public ActionResult Index(int pageSize = 20, int page = 1)
        {
            IEnumerable<dat_hang> datHangs = db.dat_hang.OrderByDescending(s=>s.id).ToPagedList(page, pageSize);
            return View(datHangs);
        }

        // GET: Admin/AOrder/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            dat_hang dat_hang = db.dat_hang.Find(id);
            if (dat_hang == null)
            {
                return HttpNotFound();
            }
            return View(dat_hang);
        }

        // GET: Admin/AOrder/Create
        public ActionResult Create()
        {
            ViewBag.id_sp = new SelectList(db.san_pham, "id", "ten");
            return View();
        }

        // POST: Admin/AOrder/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,email,id_sp,tg_tao")] dat_hang dat_hang)
        {
            if (ModelState.IsValid)
            {
                db.dat_hang.Add(dat_hang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_sp = new SelectList(db.san_pham, "id", "ten", dat_hang.id_sp);
            return View(dat_hang);
        }

        // GET: Admin/AOrder/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            dat_hang dat_hang = db.dat_hang.Find(id);
            if (dat_hang == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_sp = new SelectList(db.san_pham, "id", "ten", dat_hang.id_sp);
            return View(dat_hang);
        }

        // POST: Admin/AOrder/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,email,id_sp,tg_tao")] dat_hang dat_hang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dat_hang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_sp = new SelectList(db.san_pham, "id", "ten", dat_hang.id_sp);
            return View(dat_hang);
        }

        // GET: Admin/AOrder/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            dat_hang dat_hang = db.dat_hang.Find(id);
            if (dat_hang == null)
            {
                return HttpNotFound();
            }
            return View(dat_hang);
        }

        // POST: Admin/AOrder/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            dat_hang dat_hang = db.dat_hang.Find(id);
            db.dat_hang.Remove(dat_hang);
            db.SaveChanges();
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
