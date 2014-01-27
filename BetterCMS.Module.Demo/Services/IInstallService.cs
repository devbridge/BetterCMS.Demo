using BetterCMS.Module.Demo.ViewModels;

namespace BetterCMS.Module.Demo.Services
{
    public interface IInstallService
    {
        bool ShoulDatabaseBeSet();

        void NavigateToDatabaseSetup();

        bool SaveConnectionString(string connectionString);

        string TestConnectionString(SetupDatabaseViewModel model);

        string CreateDatabase(SetupDatabaseViewModel model);
    }
}
