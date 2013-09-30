using System;
using System.Net.Mail;
using System.Web.Mvc;

using BetterCms.Demo.Web.Helpers;
using BetterCms.Demo.Web.Models;

namespace BetterCms.Demo.Web.Controllers
{
    public class ContactController : Controller
    {
        [HttpPost]
        public virtual ActionResult ContactForm(ContactFormViewModel viewModel)
        {
            bool success;
            if (ModelState.IsValid)
            {
                using (var message = new MailMessage())
                {
                    message.From = new MailAddress("info@BetterCmsDemo.com");
                    message.ReplyToList.Add(new MailAddress(viewModel.Email));
                    message.To.Add(new MailAddress(viewModel.EmailTo));
                    message.Subject = string.Format("[BetterCmsDemo.com] Message from {0}", viewModel.Name);
                    message.IsBodyHtml = true;
                    message.Body = EmailHelper.FormatMessage(viewModel);

                    try
                    {
                        SmtpClient client = new SmtpClient();
                        client.Send(message);
                        success = true;
                    }
                    catch (Exception)
                    {
                        success = false;
                    }
                }
            }
            else
            {
                success = false;
            }

            return new JsonResult
            {
                Data = new
                {
                    success = success,
                    message = success ? "Your message successfully send." : "Sorry there has been an error while sending your message, please try again later."
                }
            };
        }
    }
}
