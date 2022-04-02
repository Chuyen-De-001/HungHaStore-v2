using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class DefaultController : AuthorController
    {
        private Model1 db = new Model1();
        // GET: Admin/Default
        public ActionResult Index()
        {
            List<hoa_don> hoaDonGanNhat = db.hoa_don.Take(5).OrderByDescending(s=>s.tg_tao).ToList();
            List<hoa_don> HDHomNay = db.hoa_don.Where(s=>s.tg_tao == DateTime.Now).ToList();
            int soHDHomNay = 0;
            int tongTienHomNay = 0;

            DateTime dateStart = DateTime.Now.AddDays(-7);
            List<hoa_don> HD7Day = db.hoa_don.Where(s => s.tg_tao > dateStart && s.tg_tao <= DateTime.Now).ToList();
            int soHD7Day = 0;
            int tongTien7Day = 0;

            dateStart = DateTime.Now.AddMonths(-1);
            List<hoa_don> HD30Day = db.hoa_don.Where(s => s.tg_tao > dateStart && s.tg_tao <= DateTime.Now).ToList();
            int soHD30Day = 0;
            int tongTien30Day = 0;

            if (HDHomNay != null)
            {
                soHDHomNay = HDHomNay.Count();
                foreach(hoa_don item in HDHomNay)
                {
                    tongTienHomNay += item.tong_tien;
                }
            }
            if (HD7Day != null)
            {
                soHD7Day = HD7Day.Count();
                foreach (hoa_don item in HD7Day)
                {
                    tongTien7Day += item.tong_tien;
                }
            }

            if (HD30Day != null)
            {
                soHD30Day = HD30Day.Count();
                foreach (hoa_don item in HD30Day)
                {
                    tongTien30Day += item.tong_tien;
                }
            }


            ViewBag.hoaDonGanNhat = hoaDonGanNhat;
            ViewBag.soHDHomNay = soHDHomNay;
            ViewBag.tongTienHomNay = tongTienHomNay;
            ViewBag.soHD7Day = soHD7Day;
            ViewBag.tongTien7Day = tongTien7Day;
            ViewBag.soHD30Day = soHD30Day;
            ViewBag.tongTien30Day = tongTien30Day;
            return View();
        }
    }
}