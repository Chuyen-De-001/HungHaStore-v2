using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class AProvidController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/AProvid
        public ActionResult Index()
        {
            return View(db.nha_cung_cap.ToList());
        }

        // GET: Admin/AProvid/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nha_cung_cap nha_cung_cap = db.nha_cung_cap.Find(id);
            if (nha_cung_cap == null)
            {
                return HttpNotFound();
            }
            return View(nha_cung_cap);
        }

        // GET: Admin/AProvid/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/AProvid/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,ten,dia_chi,sdt,email")] nha_cung_cap nha_cung_cap)
        {
            if (ModelState.IsValid)
            {
                db.nha_cung_cap.Add(nha_cung_cap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nha_cung_cap);
        }

        // GET: Admin/AProvid/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nha_cung_cap nha_cung_cap = db.nha_cung_cap.Find(id);
            if (nha_cung_cap == null)
            {
                return HttpNotFound();
            }
            return View(nha_cung_cap);
        }

        // POST: Admin/AProvid/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,ten,dia_chi,sdt,email")] nha_cung_cap nha_cung_cap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nha_cung_cap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nha_cung_cap);
        }

        // GET: Admin/AProvid/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nha_cung_cap nha_cung_cap = db.nha_cung_cap.Find(id);
            if (nha_cung_cap == null)
            {
                return HttpNotFound();
            }
            return View(nha_cung_cap);
        }

        // POST: Admin/AProvid/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            nha_cung_cap nha_cung_cap = db.nha_cung_cap.Find(id);
            db.nha_cung_cap.Remove(nha_cung_cap);
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
