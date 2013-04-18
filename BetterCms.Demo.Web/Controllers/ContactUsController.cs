using System.Web.Mvc;
using BetterCms.Demo.Web.Models;

namespace BetterCms.Demo.Web.Controllers
{
    [AllowAnonymous]
    public class ContactUsController : Controller
    {
        [ChildActionOnly]
        public ActionResult GetContactUs()
        {
            return PartialView("CmsWidgets/ContactUsForm", new ContactUsModel());
        }

        [HttpPost]
        public virtual ActionResult PostContactUs(ContactUsModel model)
        {
            return Content("Message successfully received. Thank you.", "text/html");
        }
    }
}