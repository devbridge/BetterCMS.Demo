using System.Web.Mvc;
using System.Web.Routing;

namespace BetterCms.Demo.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("Login", "login", new { controller = "Auth", action = "Login" });

            routes.MapRoute("Contact", "contact-form", new { controller = "ContactUs", action = "GetContactUs" });
            routes.MapRoute("ContactSubmit", "contact-form-submit", new { controller = "ContactUs", action = "PostContactUs" });
        }
    }
}