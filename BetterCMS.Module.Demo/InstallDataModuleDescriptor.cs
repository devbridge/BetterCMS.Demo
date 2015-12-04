using Autofac;
using BetterCMS.Module.Demo.Services;
using BetterCms;
using BetterCms.Core.Modules;

using BetterModules.Core.Modules.Registration;
using BetterModules.Core.Web.Modules.Registration;

namespace BetterCMS.Module.Demo
{
    public class InstallDataModuleDescriptor : CmsModuleDescriptor
    {
        public const string ModuleName = "demo_data";

        public const string ModuleAreaName = "bcms-demo-data";
        
        public const string SetupDatabaseRoute = "bcms-setupdb";
        
        public const string TestConnectionRoute = "bcms-test-connection";

        public InstallDataModuleDescriptor(ICmsConfiguration configuration)
            : base(configuration)
        {
        }

        public override void RegisterCustomRoutes(WebModuleRegistrationContext context, ContainerBuilder containerBuilder)
        {
            context.MapRoute(
                        "bcms-setup-database-first-time",
                        SetupDatabaseRoute,
                        new
                            {
                                area = AreaName,
                                controller = "Install",
                                action = "SetupDatabase"
                            });
            
            context.MapRoute(
                        "bcms-setup-database-test-connection",
                        TestConnectionRoute,
                        new
                        {
                            area = AreaName,
                            controller = "Install",
                            action = "TestConnection"
                        });
        }

        public override void RegisterModuleTypes(ModuleRegistrationContext context, ContainerBuilder containerBuilder)
        {
            containerBuilder.RegisterType<DefaultInstallService>().AsImplementedInterfaces().InstancePerLifetimeScope();
        }

        public override string Name
        {
            get { return ModuleName; }
        }

        public override string Description
        {
            get { return "Installs required data for BetterCMS Demo project."; }
        }

        public override string AreaName
        {
            get { return ModuleAreaName; }
        }
    }
}
