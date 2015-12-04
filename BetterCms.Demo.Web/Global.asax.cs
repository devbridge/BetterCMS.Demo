using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

using Autofac;

using BetterCMS.Module.Demo.Services;

using BetterModules.Core.Dependencies;

namespace BetterCms.Demo.Web
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_AuthenticateRequest()
        {
            using (var container = ContextScopeProvider.CreateChildContainer())
            {
                var installService = container.Resolve<IInstallService>();

                var dbShouldBeSet = installService.ShoulDatabaseBeSet();

                if (dbShouldBeSet)
                {
                    installService.NavigateToDatabaseSetup();
                }
            }
        }
    }
}
