using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using PagedList;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class AInvoiceController : AuthorController
    {
        private Model1 db = new Model1();

        // GET: Admin/AInvoice
        public ActionResult Index(int pageSize = 20, int page = 1,string search = "",string daterange = "")
        {
            var query = db.hoa_don.OrderByDescending(s => s.id);
            if(search != "")
            {
                query = (IOrderedQueryable<hoa_don>)query.Where(s => s.ten_nguoi_nhan.Contains(search) || s.sdt_nhan.Contains(search));
            }
            if(daterange != "")
            {
                string[] date = daterange.Split('-');
                DateTime dateStart = DateTime.ParseExact(date[0].Trim(), "yyyy/MM/dd", null);
                DateTime dateEnd = DateTime.ParseExact(date[1].Trim(), "yyyy/MM/dd", null);
                query = (IOrderedQueryable<hoa_don>)query.Where(s => s.tg_tao >= dateStart && s.tg_tao <= dateEnd);
            }
            IEnumerable<hoa_don> hoaDons = query.ToPagedList(page, pageSize);
            ViewBag.search = search;
            ViewBag.daterange = daterange;
            return View(hoaDons);
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

        public ActionResult Payment(int id)
        {

            hoa_don hoaDon = db.hoa_don.Find(id);
            if (hoaDon == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoaDon.trang_thai = hoa_don.TRANG_THAI_HOPAN_THANH;
            db.SaveChanges();
            HttpContext.Session["typeAlert"] = "success";
            HttpContext.Session["messageAlert"] = "Cập nhập hóa đơn thành công.";
            return RedirectToAction("Index");
        }

        // GET: Admin/AInvoice/Delete/5
        public ActionResult Delete(int? id)
        {
            try
            {
                hoa_don hoaDon = db.hoa_don.Find(id);
                if (hoaDon == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                List<chitiet_hd> chiTietHDs = db.chitiet_hd.Where(s => s.id_hd == hoaDon.id).ToList();
                db.chitiet_hd.RemoveRange(chiTietHDs);
                db.hoa_don.Remove(hoaDon);
                db.SaveChanges();
                HttpContext.Session["typeAlert"] = "danger";
                HttpContext.Session["messageAlert"] = "Xóa hóa đơn thành công.";
                return RedirectToAction("Index");
            }catch(Exception e)
            {
                HttpContext.Session["typeAlert"] = "danger";
                HttpContext.Session["messageAlert"] = e.Message;
                return RedirectToAction("Index");
            }
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

        //Xác nhận hủy hóa đơn.
        public ActionResult ConfirmRequestCannel(int? id,string confirm)
        {
            if (id == null || confirm == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoa_don hoaDon = db.hoa_don.Find(id);
            if(hoaDon == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (confirm == "yes")
            {
                hoaDon.trang_thai = hoa_don.TRANG_THAI_HUY;
                HttpContext.Session["typeAlert"] = "success";
                HttpContext.Session["messageAlert"] = "Xác nhận hủy hóa đơn thành công.";
            }
            else
            {
                hoaDon.trang_thai = hoa_don.TRANG_THAI_XU_LY;
                HttpContext.Session["typeAlert"] = "danger";
                HttpContext.Session["messageAlert"] = "Từ chối hủy hóa đơn";
            }
            //UpdateModel(hoaDon);
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
