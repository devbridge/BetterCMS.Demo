using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BetterCms.Demo.Web.Controllers
{
    [AllowAnonymous]
    public class AuthController : Controller
    {
        public ActionResult Login(string roles)
        {
            if (string.IsNullOrEmpty(roles))
            {
                roles = "Owner";
            }

            var authTicket = new FormsAuthenticationTicket(1, "Test User", DateTime.Now, DateTime.Now.AddMonths(1), true, roles);

            var cookieContents = FormsAuthentication.Encrypt(authTicket);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, cookieContents)
            {
                Expires = authTicket.Expiration,
                Path = FormsAuthentication.FormsCookiePath
            };

            HttpContext.Response.Cookies.Add(cookie);

            return Redirect("/");
        }
    }
}