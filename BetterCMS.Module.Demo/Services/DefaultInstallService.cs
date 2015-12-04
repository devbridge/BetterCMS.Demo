using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
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
        private const string DefaultUserName = "BetterCmsUser";

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
                var allowableExtensions = new[] { ".js", ".css", ".gif" };
                var extension = System.IO.Path.GetExtension(http.Request.Url.PathAndQuery.ToLower());
                var allow = allowableExtensions.Contains(extension);

                var isUrl = http.Request.Url.PathAndQuery.StartsWith(url);
                var isTestUrl = http.Request.Url.PathAndQuery.StartsWith(testConnectionUrl);

                if (!allow && !isUrl && !isTestUrl)
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

        private string CreateConnectionString(SetupDatabaseViewModel model, string database = null)
        {
            database = database ?? model.Database;

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

            if (string.IsNullOrWhiteSpace(database))
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

            var connectionString = string.Format("Server={0};Database={1};", model.Server, database);

            connectionString = model.IsIntegratedSecurity 
                ? string.Format("{0}Integrated Security=SSPI;", connectionString) 
                : string.Format("{0}User Id={1};Password={2};", connectionString, model.Username, model.Password);

            return connectionString;
        }

        public string TestConnectionString(SetupDatabaseViewModel model)
        {
            string connectionString;
            var isMaster = false;
            if (model.CreateDatabase)
            {
                isMaster = true;
                connectionString = CreateConnectionString(model, "master");
            }
            else
            {
                connectionString = CreateConnectionString(model);
            }

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open(); // throws if invalid
                }
            }
            catch (Exception exc)
            {
                var message = exc.Message;
                if (isMaster)
                {
                    message = string.Format("{0} {1}", InstallGlobalization.TestDatabaseConnection_AdminIsRequired, message);
                }
                throw new ValidationException(() => message, message, exc);
            }

            return connectionString;
        }

        public string CreateDatabase(SetupDatabaseViewModel model)
        {
            var connectionString = CreateConnectionString(model, "master");

            // Validating database
            var regex = new Regex("^[\\w]*$", RegexOptions.CultureInvariant);
            if (!regex.IsMatch(model.Database))
            {
                var message = InstallGlobalization.CreateDatabase_DatabaseNameIsInvalid;
                throw new ValidationException(() => message, message);
            }

            // Creating database
            using (var conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    var sql = string.Format("CREATE DATABASE {0}", model.Database);

                    var command = new SqlCommand(sql, conn);
                    command.ExecuteNonQuery();
                }
                catch (Exception exc)
                {
                    var message = exc.Message;
                    throw new ValidationException(() => message, message, exc);
                }
            }

            // Creating user
            connectionString = CreateConnectionString(model);
            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                var transaction = conn.BeginTransaction("BCMSTransaction");

                try
                {
                    // Check if user exists
                    string user = DefaultUserName;
                    var password = Guid.NewGuid().ToString().Replace("-", string.Empty);

                    var userCommand = new SqlCommand("select TOP 1 1 from sys.syslogins where name=@user", conn);
                    userCommand.Transaction = transaction;
                    userCommand.Parameters.Add("user", SqlDbType.NVarChar).Value = user;
                    if (userCommand.ExecuteScalar() != null)
                    {
                        user = string.Format("BetterCmsUser{0}", DateTime.Now.ToString("yyyyMMddhhmmss"));
                    }

                    // Create user
                    var command = new SqlCommand();
                    command.Transaction = transaction;
                    command.Connection = conn;

                    command.CommandText = string.Format("CREATE LOGIN {0} WITH PASSWORD = '{1}'", user, password);
                    command.ExecuteNonQuery();

                    command.CommandText = string.Format("CREATE USER {0} FOR LOGIN {0}", user);
                    command.ExecuteNonQuery();

                    command.CommandText = string.Format("EXEC sp_addrolemember 'db_ddladmin', {0}", user);
                    command.ExecuteNonQuery();

                    command.CommandText = string.Format("EXEC sp_addrolemember 'db_securityadmin', {0}", user);
                    command.ExecuteNonQuery();

                    command.CommandText = string.Format("EXEC sp_addrolemember 'db_datareader', {0}", user);
                    command.ExecuteNonQuery();

                    command.CommandText = string.Format("EXEC sp_addrolemember 'db_datawriter', {0}", user);
                    command.ExecuteNonQuery();

                    transaction.Commit();

                    var clonedModel = (SetupDatabaseViewModel) model.Clone();
                    clonedModel.Username = user;
                    clonedModel.Password = password;
                    clonedModel.IsIntegratedSecurity = false;
                    clonedModel.CreateDatabase = false;
                    connectionString = CreateConnectionString(clonedModel);
                }
                catch (Exception exc)
                {
                    var message = exc.Message;

                    // Try rollback transaction
                    try
                    {
                        transaction.Rollback();
                    }
                    catch
                    {
                        // Do nothing
                    }

                    // Try close connection
                    try
                    {
                        conn.Close();
                        conn.Dispose();
                    }
                    catch
                    {
                        // Do nothing
                    }

                    // Trying to drop database, if user creation fails
                    try
                    {
                        using (var dropConn = new SqlConnection(CreateConnectionString(model, "master")))
                        {
                            dropConn.Open();
                            var sql = string.Format("DROP DATABASE {0}", model.Database);

                            var command = new SqlCommand(sql, dropConn);
                            command.ExecuteNonQuery();
                        }
                    }
                    catch
                    {
                        message = string.Format("{0}. Please drop created database manually.", message);
                    }

                    message = string.Format("Failed to create user for database {0}. {1}", model.Database, message);
                    throw new ValidationException(() => message, message, exc);
                }
            }

            return connectionString;
        }
    }
}
