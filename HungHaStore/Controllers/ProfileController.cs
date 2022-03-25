﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using HungHaStore.Helper;

namespace HungHaStore.Controllers
{
    public class ProfileController : Controller
    {
        private Model1 db = new Model1();

        // GET: Profile/Edit/5
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

        // POST: Profile/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,tai_khoan,mat_khau,email,ngay_sinh,sdt,ho_ten,dia_chi,gioi_tinh,tg_tao")] nguoi_dung nguoi_dung)
        {
            if (ModelState.IsValid)
            {
                nguoi_dung identity = AuthorHelper.getIdentity();
                nguoi_dung.quyen = identity.quyen;
                db.Entry(nguoi_dung).State = EntityState.Modified;
                db.SaveChanges();
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Cập nhập thông tin tài khoản thành công.";
                return RedirectToAction("Edit", new { id = nguoi_dung.id });
            }
            return View(nguoi_dung);
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
