using System;
using System.Configuration;
using System.Text;

using BetterCms.Core.Environment.Host;

namespace BetterCms.Demo.Web.Tools
{
    public class Resetter
    {
        private readonly ICmsHost cmsHost;

        private DateTime endTime;

        private bool isActive;

        public Resetter(ICmsHost cmsHost)
        {
            this.cmsHost = cmsHost;

            int timeInMinutes;
            if (Int32.TryParse(ConfigurationManager.AppSettings["webSiteRestartTimeoutInMinutes"], out timeInMinutes)
                && timeInMinutes > 0)
            {
                isActive = true;
                endTime = DateTime.Now + new TimeSpan(0, timeInMinutes, 0);
            }
        }

        public void CheckTime()
        {
            if (isActive && endTime <= DateTime.Now)
            {
                cmsHost.RestartApplicationHost();
            }
        }

        private TimeSpan TimeLeft()
        {
            if (!isActive)
            {
                throw new InvalidOperationException("web site restarter is disabled. To enable it, set webSiteRestartTimeoutInMinutes in web.config.");
            }

            return endTime - DateTime.Now;
        }

        public string GetHtml()
        {
            if (!isActive)
            {
                return null;
            }

            var html = new StringBuilder();
            html.AppendLine("<div style=\"position: absolute;z-index: 101;top: 0;left: 50%;right: 0;\">");
            html.AppendLine("<div style=\"position: relative;width: 500px;left: -250px;background: #fde073;text-align: center;line-height: 2.5;overflow: hidden;-webkit-box-shadow: 0 0 5px black;-moz-box-shadow: 0 0 5px black;box-shadow: 0 0 5px black;\">");
            html.AppendLine("<span id=\"bcms-demo-timer\"></span>");
            html.AppendLine("<script type=\"text/javascript\">");
            html.AppendFormat("var count={0:0};", TimeLeft().TotalSeconds);
            html.AppendLine(string.Empty);
            html.AppendLine("var counter=setInterval(function(){");
            html.AppendLine("count=count-1;");
            html.AppendLine("if (count <= 0) {");
            html.AppendLine("window.location = '/';");
            html.AppendLine("return;");
            html.AppendLine("}");
            html.AppendLine("document.getElementById(\"bcms-demo-timer\").innerHTML=\"Website will reset itself to the default state in \" + count + \" secs!\";");
            html.AppendLine("}, 1000);");
            html.AppendLine("</script>");
            html.AppendLine("</div>");
            html.AppendLine("</div>");
            return html.ToString();
        }
    }
}
