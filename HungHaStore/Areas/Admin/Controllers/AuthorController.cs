using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HungHaStore.Models;
using HungHaStore.Helper;
using System.Net;

namespace HungHaStore.Areas.Admin.Controllers
{
    public class AuthorController : Controller
    {
        // GET: Admin/Author
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if(AuthorHelper.getIdentity() == null || !AuthorHelper.isAdmin(AuthorHelper.getIdentity()))
            {
                filterContext.Result = new HttpStatusCodeResult(HttpStatusCode.Forbidden, "Forbidden");
            }

            base.OnActionExecuting(filterContext);
        }
    }
}