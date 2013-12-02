using Autofac;
using BetterCMS.Module.Demo.Services;
using BetterCms;
using BetterCms.Core.Modules;

namespace BetterCMS.Module.Demo
{
    public class InstallDataModuleDescriptor : ModuleDescriptor
    {
        public const string ModuleName = "demo_data";

        public const string ModuleAreaName = "bcms-demo-data";
        
        public const string SetupDatabaseRoute = "bcms-setupdb";
        
        public const string TestConnectionRoute = "bcms-test-connection";

        public InstallDataModuleDescriptor(ICmsConfiguration configuration)
            : base(configuration)
        {
            BetterCms.Events.CoreEvents.Instance.HostAuthenticateRequest += OnHostAuthenticateRequest;
            BetterCms.Events.CoreEvents.Instance.HostStart += OnHostStart;
        }

        private void OnHostStart(BetterCms.Events.SingleItemEventArgs<System.Web.HttpApplication> args)
        {
        }

        private void OnHostAuthenticateRequest(BetterCms.Events.SingleItemEventArgs<System.Web.HttpApplication> args)
        {
        }

        public override void RegisterCustomRoutes(ModuleRegistrationContext context, ContainerBuilder containerBuilder)
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
