using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

using BetterCms.Core;
using BetterCms.Core.Environment.Host;
using BetterCms.Demo.Web.Tools;

namespace BetterCms.Demo.Web
{
    public class MvcApplication : HttpApplication
    {
        private static ICmsHost cmsHost;

        public static Resetter Resetter { get; private set; }

        protected void Application_Start()
        {
            cmsHost = CmsContext.RegisterHost();

            AreaRegistration.RegisterAllAreas();
            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            cmsHost.OnApplicationStart(this);

            Resetter = new Resetter(cmsHost);
        }

        protected void Application_BeginRequest()
        {
            Resetter.CheckTime();
            cmsHost.OnBeginRequest(this);
        }

        protected void Application_EndRequest()
        {
            cmsHost.OnEndRequest(this);
        }

        protected void Application_Error()
        {
            cmsHost.OnApplicationError(this);
        }

        protected void Application_End()
        {
            cmsHost.OnApplicationEnd(this);
        }
    }
}
