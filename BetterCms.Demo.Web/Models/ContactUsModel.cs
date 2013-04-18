using System.ComponentModel.DataAnnotations;

namespace BetterCms.Demo.Web.Models
{
    public class ContactUsModel
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string Message { get; set; }
    }
}