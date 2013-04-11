using BetterCms.Configuration;
using BetterCms.Core.DataAccess.DataContext.Migrations;
using BetterCms.Core.Environment.Assemblies;
using BetterCms.Core.Modules;

namespace BetterCms.Demo.Web.Models.Migrations
{
    public class MigrationRunner
    {
        private class FakeModuleDescriptor : ModuleDescriptor
        {
            public FakeModuleDescriptor(ICmsConfiguration configuration)
                : base(configuration)
            {
            }

            public override string Name
            {
                get { return "demo"; }
            }

            public override string Description
            {
                get { return "Demo data module."; }
            }
        }

        public void AddDemoDataToDB()
        {
            var configurationLoader = new DefaultConfigurationLoader();
            var cmsConfiguration = configurationLoader.LoadCmsConfiguration();
            var runner = new DefaultMigrationRunner(new DefaultAssemblyLoader(), cmsConfiguration);

            runner.Migrate(new[] { new FakeModuleDescriptor(cmsConfiguration) }, true);
        }
    }
}