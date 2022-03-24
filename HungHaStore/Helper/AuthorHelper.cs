using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HungHaStore.Models;

namespace HungHaStore.Helper
{
    public class AuthorHelper
    {
        public static Model1 db = new Model1();
        public static void setIdentity(nguoi_dung user)
        {
            HttpContext.Current.Session["loginSesstion"] = user;
        }

        public static nguoi_dung getIdentity()
        {
            try
            {
                nguoi_dung session = (nguoi_dung)HttpContext.Current.Session["loginSesstion"];
                if(session != null)
                {
                    nguoi_dung nguoiDung = db.nguoi_dung.Find(session.id);
                    return nguoiDung;
                }

            }
            catch
            {}
            return null;
        }

        public static void removeIdentity()
        {
            HttpContext.Current.Session["loginSesstion"] = null;
        }

        public static bool isLogin()
        {
            if (HttpContext.Current.Session["loginSesstion"] == null)
            {
                return false;
            }
            return true;
        }

        //Kiểm tra user đang đăng nhập có quyền admin hay không.
        //user.quyen == 1
        public static bool isAdmin(nguoi_dung nguoi_Dung)
        {
            if(nguoi_Dung.quyen == 1)
            {
                return true;
            }
            return false;
        }
    }
}