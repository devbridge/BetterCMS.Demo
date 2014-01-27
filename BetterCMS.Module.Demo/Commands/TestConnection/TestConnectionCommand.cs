using BetterCMS.Module.Demo.Services;
using BetterCMS.Module.Demo.ViewModels;
using BetterCms.Core.Mvc.Commands;

namespace BetterCMS.Module.Demo.Commands.TestConnection
{
    public class TestConnectionCommand : ICommandBase, ICommand<SetupDatabaseViewModel, bool>
    {
        private readonly IInstallService installService;

        public TestConnectionCommand(IInstallService installService)
        {
            this.installService = installService;
        }

        public ICommandContext Context { get; set; }

        public bool Execute(SetupDatabaseViewModel request)
        {
            installService.TestConnectionString(request);

            return true;
        }
    }
}