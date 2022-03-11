using HungHaStore.Models;
using System;
using System.Linq;
using System.Web.Mvc;
using HungHaStore.Helper;

namespace HungHaStore.Controllers
{
    public class SecurityController : Controller
    {

        public static Model1 db = new Model1();

        // GET: Security
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(string username = null, string password=null,string submit = null)
        {
            if(submit != null)
            {
                if(username == null || password == null)
                {
                    HttpContext.Session["typeAlert"] = "danger";
                    HttpContext.Session["messageAlert"] = "Có lỗi xảy ra.";
                    return View();
                }
                string query = "SELECT * FROM [dbo].[nguoi_dung] where tai_khoan = '" + username + "' and mat_khau = '" + password + "'";
                nguoi_dung nguoiDung = db.nguoi_dung.SqlQuery(query).SingleOrDefault();
                if(nguoiDung == null)
                {
                    HttpContext.Session["typeAlert"] = "danger";
                    HttpContext.Session["messageAlert"] = "Sai thông tin tài khoản hoặc mật khẩu";
                }
                else
                {
                    AuthorHelper.setIdentity(nguoiDung);
                    return RedirectToAction("Index", "Home");
                }

            }
            return View();
        }

        public ActionResult Register(string username = null,string password = null,string email=null)
        {
            if(Request["submit"]!= null)
            {
                try
                {
                    DateTime date = DateTime.Now;
                    if (username == null || password == null || email == null)
                    {
                        HttpContext.Session["typeAlert"] = "danger";
                        HttpContext.Session["messageAlert"] = "Có lỗi xảy ra.";
                        return View();
                    }
                    int userExit = db.nguoi_dung.SqlQuery("SELECT * FROM [dbo].[nguoi_dung] where tai_khoan = '" + username + "'").Count();
                    if(userExit > 0)
                    {
                        HttpContext.Session["typeAlert"] = "danger";
                        HttpContext.Session["messageAlert"] = "Tài khoản đã tồn tại.";
                        return View();
                    }
                    string query = "INSERT INTO [dbo].[nguoi_dung]([tai_khoan],[mat_khau],[email],[tg_tao]) VALUES ('" + username + "','" + password + "','" + email + "','" + date.ToString("yyyy-MM-dd") + "')";
                    db.Database.ExecuteSqlCommand(query);
                    HttpContext.Session["typeAlert"] = "success";
                    HttpContext.Session["messageAlert"] = "Đăng ký tài khỏa thành công.";
                    return RedirectToAction("Login", "Security");
                }
                catch(Exception e){}
            }
            return View();
        }

        public ActionResult Logout()
        {
            AuthorHelper.removeIdentity();
            return RedirectToAction("Index", "Home");
        }
    }
}