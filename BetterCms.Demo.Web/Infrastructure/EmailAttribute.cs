using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace BetterCms.Demo.Web.Infrastructure
{
    public class EmailAttribute : RegularExpressionAttribute, IClientValidatable
    {
        public EmailAttribute()
            : base(@"^[\w_\+-]+(\.[\w_\+-]+)*@[\w-]+(\.[\w-]+)*\.([a-zA-Z]{2,4})$")
        {
        }

        public IEnumerable<ModelClientValidationRule> GetClientValidationRules(ModelMetadata metadata, ControllerContext context)
        {
            yield return 
                new ModelClientValidationRule
                {
                    ErrorMessage = FormatErrorMessage(metadata.GetDisplayName()),
                    ValidationType = "customemail"
                };
        }
    }
}