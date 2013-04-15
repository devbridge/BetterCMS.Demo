using System.Web.Mvc;
using System.Web.Routing;

namespace BetterCms.Demo.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("login", "login", new { controller = "AuthController", action = "Login" });
        }
    }
}