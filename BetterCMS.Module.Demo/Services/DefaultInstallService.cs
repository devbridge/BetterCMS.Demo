using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;

using BetterCMS.Module.Demo.Content.Resources;
using BetterCMS.Module.Demo.ViewModels;

using BetterCms;
using BetterCms.Core.Exceptions.Mvc;
using BetterCms.Core.Web;

namespace BetterCMS.Module.Demo.Services
{
    public class DefaultInstallService : IInstallService
    {
        private readonly ICmsConfiguration configuration;
        
        private readonly IHttpContextAccessor httpAccessor;

        public DefaultInstallService(ICmsConfiguration configuration, IHttpContextAccessor httpAccessor)
        {
            this.configuration = configuration;
            this.httpAccessor = httpAccessor;
        }

        public bool ShoulDatabaseBeSet()
        {
            if (!string.IsNullOrWhiteSpace(configuration.Database.ConnectionStringName))
            {
                foreach (ConnectionStringSettings cs in ConfigurationManager.ConnectionStrings)
                {
                    if (cs.Name == configuration.Database.ConnectionStringName 
                        && string.IsNullOrWhiteSpace(cs.ConnectionString))
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        public void NavigateToDatabaseSetup()
        {
            const string url = "/" + InstallDataModuleDescriptor.SetupDatabaseRoute;
            const string testConnectionUrl = "/" + InstallDataModuleDescriptor.TestConnectionRoute;

            var http = httpAccessor.GetCurrent();

            if (http != null && http.Request != null && http.Request.Url != null)
            {
                if (!http.Request.Url.PathAndQuery.StartsWith(url) && !http.Request.Url.PathAndQuery.StartsWith(testConnectionUrl))
                {
                    http.Response.Redirect(url, true);
                }
            }
        }

        public bool SaveConnectionString(string connectionString)
        {
            ConnectionStringSettings setting = null;
            foreach (ConnectionStringSettings cs in ConfigurationManager.ConnectionStrings)
            {
                if (cs.Name == configuration.Database.ConnectionStringName)
                {
                    setting = cs;
                    break;
                }
            }

            var context = httpAccessor.GetCurrent();
            Configuration config = WebConfigurationManager.OpenWebConfiguration(context.Request.ApplicationPath);

            if (setting != null)
            {
                config.ConnectionStrings.ConnectionStrings[configuration.Database.ConnectionStringName].ConnectionString = connectionString;
            }
            else
            {
                setting = new ConnectionStringSettings(configuration.Database.ConnectionStringName, connectionString);
                config.ConnectionStrings.ConnectionStrings.Add(setting);
            }

            config.Save();

            return true;
        }

        public string CreateConnectionString(SetupDatabaseViewModel model)
        {
            if (model.EditConnectionString)
            {
                if (string.IsNullOrWhiteSpace(model.ConnectionString))
                {
                    var message = InstallGlobalization.TestDatabaseConnection_ConnectionStringIsNotSet;
                    throw new ValidationException(() => message, message);
                }

                return model.ConnectionString;
            }
            
            if (string.IsNullOrWhiteSpace(model.Server))
            {
                var message = InstallGlobalization.TestDatabaseConnection_ServerNameIsNotSet;
                throw new ValidationException(() => message, message);
            }
                
            if (string.IsNullOrWhiteSpace(model.Database))
            {
                var message = InstallGlobalization.TestDatabaseConnection_DatabaseNameIsNotSet;
                throw new ValidationException(() => message, message);
            }

            if (!model.IsIntegratedSecurity)
            {
                if (string.IsNullOrWhiteSpace(model.Username))
                {
                    var message = InstallGlobalization.TestDatabaseConnection_UserNameIsNotSet;
                    throw new ValidationException(() => message, message);
                }

                if (string.IsNullOrWhiteSpace(model.Password))
                {
                    var message = InstallGlobalization.TestDatabaseConnection_PasswordIsNotSet;
                    throw new ValidationException(() => message, message);
                }
            }

            var connectionString = string.Format("Server={0};Database={1};", model.Server, model.Database);

            connectionString = model.IsIntegratedSecurity 
                ? string.Format("{0}Integrated Security=SSPI;", connectionString) 
                : string.Format("{0}User Id={1};Password={2};", connectionString, model.Username, model.Password);

            return connectionString;
        }

        public bool TestConnectionString(string connectionString)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open(); // throws if invalid
                }
            }
            catch (Exception exc)
            {
                throw new ValidationException(() => exc.Message, exc.Message, exc);
            }

            return true;
        }
    }
}
