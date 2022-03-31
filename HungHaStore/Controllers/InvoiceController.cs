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

namespace HungHaStore.Controllers
{
    public class InvoiceController : Controller
    {
        private Model1 db = new Model1();

        // GET: Invoice
        public ActionResult Index()
        {
            nguoi_dung identity = AuthorHelper.getIdentity();
            if (identity == null)
            {
                return RedirectToAction("Index", "Home");
            }
            var hoa_don = db.hoa_don.Include(h => h.nguoi_dung).Where(s=>s.id_nd == identity.id);
            return View(hoa_don.ToList());
        }

                //Yêu cầu hủy hóa đơn.
        public ActionResult RequestCancelInvoice(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoa_don hoaDon = db.hoa_don.Find(id);
            if(hoaDon == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoaDon.trang_thai = hoa_don.TRANG_THAI_YEU_CAU_HUY;
            db.SaveChanges();
            HttpContext.Session["typeAlert"] = "success";
            HttpContext.Session["messageAlert"] = "Yêu cầu hủy thành công, chờ quản trị viên xác nhận.";
            return RedirectToAction("Index", "Invoice");
        }


        // GET: Invoice/Delete/5
        public ActionResult Delete(int? id)
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
            return View(hoa_don);
        }

        // POST: Invoice/Delete/5
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
