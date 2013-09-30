using System.Web.Mvc;
using System.Web.Routing;

namespace BetterCms.Demo.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("contacts-form", "contacts/submit-form", new { area = string.Empty, controller = "Contact", action = "ContactForm" }, new[] { "BetterCms.Demo.Web.Controllers" });
            routes.MapRoute("menu-top", "menu/top", new { area = string.Empty, controller = "SiteMap", action = "Index" }, new[] { "BetterCms.Demo.Web.Controllers" });
            routes.MapRoute("menu-sub", "menu/submenu/{parentUrl}", new { area = string.Empty, controller = "SiteMap", action = "SubMenu" }, new[] { "BetterCms.Demo.Web.Controllers" });
            routes.MapRoute("blog-latest", "blog/latest/{categoryId}", new { area = string.Empty, controller = "Blog", action = "Index", categoryId = UrlParameter.Optional }, new[] { "BetterCms.Demo.Web.Controllers" });
            routes.MapRoute("blog-last", "blog/last", new { area = string.Empty, controller = "Blog", action = "Last" }, new[] { "BetterCms.Demo.Web.Controllers" });
            routes.MapRoute("blog-categories", "blog/categories", new { area = string.Empty, controller = "Blog", action = "GetCategories" }, new[] { "BetterCms.Demo.Web.Controllers" });
            routes.MapRoute("blog-feed", "blog/feed", new { area = string.Empty, controller = "Blog", action = "Feed" }, new[] { "BetterCms.Demo.Web.Controllers" });
        }
    }
}