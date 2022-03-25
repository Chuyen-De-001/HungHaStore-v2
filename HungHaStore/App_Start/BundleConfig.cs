using System.Web;
using System.Web.Optimization;

namespace HungHaStore
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-3.3.1.min.js",
                        //"~/Scripts/jquery.nice-select.min.js",
                        "~/Scripts/jquery-ui.min.js",
                        "~/Scripts/jquery.slicknav.js",
                        "~/Scripts/mixitup.min.js",
                        "~/Scripts/owl.carousel.min.js",
                        "~/Scripts/main.js",
                        "~/Scripts/moment.min.js",
                        "~/Scripts/daterangepicker.min.js",
                        "~/Scripts/popper.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/custom").Include(
            "~/Scripts/main.js", 
            "~/Scripts/custom.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.min.css",
                      "~/Content/font-awesome.min.css",
                      "~/Content/elegant-icons.css",
                      "~/Content/jquery-ui.min.css",
                      "~/Content/owl.carousel.min.css",
                      "~/Content/slicknav.min.css",
                      "~/Content/daterangepicker.css",
                      "~/Content/style.css",
                      "~/Content/custom.css"));

        }
    }
}
