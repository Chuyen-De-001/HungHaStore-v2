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
                nguoi_dung nguoidung = (nguoi_dung)HttpContext.Current.Session["loginSesstion"];
                if(nguoidung == null)
                {
                    return null;
                }
                nguoi_dung identity = db.nguoi_dung.Where(s=>s.id == nguoidung.id).SingleOrDefault();
                return identity;
            }
            catch
            {
                return null;
            }
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
    }
}