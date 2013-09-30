using BetterCms;
using BetterCms.Core.Modules;

namespace BetterCms.Demo.InstallDataModule
{
    public class InstallDataModuleDescriptor : ModuleDescriptor
    {
        public const string ModuleName = "demo_data";

        public InstallDataModuleDescriptor(ICmsConfiguration configuration)
            : base(configuration)
        {
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
            get { return "BetterCmsDemo"; }
        }
    }
}
