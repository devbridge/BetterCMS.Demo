using BetterCMS.Module.Demo.ViewModels;

namespace BetterCMS.Module.Demo.Services
{
    public interface IInstallService
    {
        bool ShoulDatabaseBeSet();

        void NavigateToDatabaseSetup();

        bool SaveConnectionString(string connectionString);

        string CreateConnectionString(SetupDatabaseViewModel model);

        bool TestConnectionString(string connectionString);
    }
}
