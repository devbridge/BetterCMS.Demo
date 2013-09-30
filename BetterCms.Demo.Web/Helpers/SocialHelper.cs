using System;
using System.Web.Mvc;

using BetterCms.Module.Root.ViewModels.Cms;

namespace BetterCms.Demo.Web.Helpers
{
    public static class SocialHelper
    {
        public static MvcHtmlString TitleForSocial(this HtmlHelper<RenderWidgetViewModel> htmlHelper)
        {
            var model = htmlHelper.ViewData.Model;
            return MvcHtmlString.Create(OptionsHelper.GetValue(model.Options, "title"));
        }

        public static MvcHtmlString LinkForSocial(this HtmlHelper<RenderWidgetViewModel> htmlHelper, string renderOptionName, string urlOptionName, string titleOptionName, string cssClassOptionName)
        {
            var model = htmlHelper.ViewData.Model;
            var renderOption = OptionsHelper.GetValue(model.Options, renderOptionName);
            var urlOption = OptionsHelper.GetValue(model.Options, urlOptionName);
            var titleOption = OptionsHelper.GetValue(model.Options, titleOptionName);
            var cssClassOption = OptionsHelper.GetValue(model.Options, cssClassOptionName);

            if (!string.IsNullOrWhiteSpace(renderOption) && Convert.ToBoolean(renderOption))
            {
                return MvcHtmlString.Create(
                    string.Format("<a href=\"{0}\" class=\"{1}\">{2}</a>", urlOption ?? string.Empty, cssClassOption ?? string.Empty, titleOption ?? string.Empty));
            }

            return MvcHtmlString.Empty;
        }
    }
}