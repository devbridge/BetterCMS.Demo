using BetterCMS.Module.Demo.Services;
using BetterCMS.Module.Demo.ViewModels;
using BetterCms.Core.Mvc.Commands;

namespace BetterCMS.Module.Demo.Commands.SetupDatabase
{
    public class SetupDatabaseCommand : ICommandBase, ICommand<SetupDatabaseViewModel, bool>
    {
        private readonly IInstallService installService;

        public SetupDatabaseCommand(IInstallService installService)
        {
            this.installService = installService;
        }

        public ICommandContext Context { get; set; }

        public bool Execute(SetupDatabaseViewModel request)
        {
            if (installService.ShoulDatabaseBeSet())
            {
                string connectionString;
                if (request.CreateDatabase)
                {
                    connectionString = installService.CreateDatabase(request);
                }
                else
                {
                    connectionString = installService.TestConnectionString(request);
                }

                installService.SaveConnectionString(connectionString);

                return true;
            }

            return false;
        }
    }
}