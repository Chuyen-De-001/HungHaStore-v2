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
    public class AProviderController : Controller
    {
        private Model1 db = new Model1();

        // GET: Admin/AProvider
        public ActionResult Index(int pageSize = 20, int page = 1)
        {
            IEnumerable<nha_cung_cap> nhaCungCaps = db.nha_cung_cap.OrderByDescending(s=>s.id).ToPagedList(page, pageSize);
            return View(nhaCungCaps);
        }

        // GET: Admin/AProvider/Details/5
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

        // GET: Admin/AProvider/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/AProvider/Create
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

        // GET: Admin/AProvider/Edit/5
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

        // POST: Admin/AProvider/Edit/5
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

        // GET: Admin/AProvider/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nha_cung_cap nha_cung_cap = db.nha_cung_cap.Find(id);
            db.nha_cung_cap.Remove(nha_cung_cap);
            db.SaveChanges();
            HttpContext.Session["typeAlert"] = "success";
            HttpContext.Session["messageAlert"] = "Xóa thông tin nhà cung cấp thành công.";
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
