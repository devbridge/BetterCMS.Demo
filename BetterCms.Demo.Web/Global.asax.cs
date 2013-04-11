using System;
using System.Security.Principal;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using BetterCms.Core;
using BetterCms.Core.Environment.Host;
using BetterCms.Demo.Web.Models.Migrations;

namespace BetterCms.Demo.Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        private static ICmsHost cmsHost;
        protected void Application_Start()
        {
            cmsHost = CmsContext.RegisterHost();
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            cmsHost.OnApplicationStart(this);

            new MigrationRunner().AddDemoDataToDB();
        }

        protected void Application_BeginRequest()
        {
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

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            var roles = new[] { "BcmsEditContent", 
                                "BcmsPublishContent", 
                                "BcmsDeleteContent", 
                                "BcmsAdministration" };
            var principal = new GenericPrincipal(new GenericIdentity("TestUser"),
                                                 roles);
            HttpContext.Current.User = principal;
            cmsHost.OnAuthenticateRequest(this);
        }
    }
}
