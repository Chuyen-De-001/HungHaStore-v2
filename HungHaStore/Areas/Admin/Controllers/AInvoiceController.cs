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
    public class AInvoiceController : AuthorController
    {
        private Model1 db = new Model1();

        // GET: Admin/AInvoice
        public ActionResult Index()
        {
            var hoa_don = db.hoa_don.Include(h => h.nguoi_dung);
            return View(hoa_don.ToList());
        }

        // GET: Admin/AInvoice/Details/5
        public ActionResult Details(int? id)
        {
            hoa_don hoaDon = db.hoa_don.Where(s => s.id == id).SingleOrDefault();
            if(hoaDon != null)
            {
                List<chitiet_hd> chiTietHDs = db.chitiet_hd.Where(s => s.id_hd == id).ToList();
                ViewBag.chiTietHDs = chiTietHDs;
                return View(hoaDon);
            }
            return RedirectToAction("Index","Home");
        }

        // GET: Admin/AInvoice/Create
        public ActionResult Create()
        {
            ViewBag.id_nd = new SelectList(db.nguoi_dung, "id", "tai_khoan");
            return View();
        }

        // POST: Admin/AInvoice/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_nd,trang_thai,tong_tien,tg_tao")] hoa_don hoa_don)
        {
            if (ModelState.IsValid)
            {
                db.hoa_don.Add(hoa_don);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_nd = new SelectList(db.nguoi_dung, "id", "tai_khoan", hoa_don.id_nd);
            return View(hoa_don);
        }

        // GET: Admin/AInvoice/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoa_don hoa_don = db.hoa_don.Find(id);
            if (hoa_don == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_nd = new SelectList(db.nguoi_dung, "id", "tai_khoan", hoa_don.id_nd);
            return View(hoa_don);
        }

        // POST: Admin/AInvoice/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_nd,trang_thai,tong_tien,tg_tao")] hoa_don hoa_don)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoa_don).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_nd = new SelectList(db.nguoi_dung, "id", "tai_khoan", hoa_don.id_nd);
            return View(hoa_don);
        }

        // GET: Admin/AInvoice/Delete/5
        public ActionResult Delete(int? id)
        {
            hoa_don hoa_don = db.hoa_don.Find(id);
            db.hoa_don.Remove(hoa_don);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/AInvoice/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            hoa_don hoa_don = db.hoa_don.Find(id);
            db.hoa_don.Remove(hoa_don);
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
