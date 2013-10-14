using System;
using System.Configuration;
using System.IO;
using BetterCms.Configuration;
using BetterCms.Core.DataAccess.DataContext.Migrations;
using FluentMigrator;

namespace BetterCMS.Module.Demo.Models.Migrations
{
    [Migration(201310091000)]
    public class InitialSetup : DefaultMigration
    {
        public InitialSetup()
            : base(InstallDataModuleDescriptor.ModuleName)
        {
        }

        public override void Up()
        {
            if (CanContinue()) {
                IfSqlServer().Execute.EmbeddedScript("Migration201310091000.sqlserver.sql");

                var codeBase = System.Reflection.Assembly.GetExecutingAssembly().CodeBase;
                var uri = new UriBuilder(codeBase);
                var path = Uri.UnescapeDataString(uri.Path);
                var rootPath = Path.GetDirectoryName(Path.GetDirectoryName(path));
                var serverUrl = GetServerUrl();

                var script1 = string.Format("UPDATE [bcms_media].[MediaFiles] SET [FileUri] = REPLACE([FileUri], '[WebSiteRootPath]', '{0}')", rootPath);
                IfSqlServer().Execute.Sql(script1);

                var script2 = string.Format("UPDATE [bcms_media].[MediaImages] SET [OriginalUri] = REPLACE([OriginalUri], '[WebSiteRootPath]', '{0}'), [ThumbnailUri] = REPLACE([ThumbnailUri], '[WebSiteRootPath]', '{0}')", rootPath);
                IfSqlServer().Execute.Sql(script2);

                var script3 = string.Format("UPDATE [bcms_media].[MediaFiles] SET [PublicUrl] = REPLACE([PublicUrl], '[WebServerPath]', '{0}')", serverUrl);
                IfSqlServer().Execute.Sql(script3);

                var script4 = string.Format("UPDATE [bcms_media].[MediaImages] SET [PublicOriginallUrl] = REPLACE([PublicOriginallUrl], '[WebServerPath]', '{0}'), [PublicThumbnailUrl] = REPLACE([PublicThumbnailUrl], '[WebServerPath]', '{0}')", serverUrl);
                IfSqlServer().Execute.Sql(script4);
            }
        }

        public override void Down()
        {
            throw new NotImplementedException();
        }

        private string GetServerUrl()
        {
            var serverUrl = string.Empty;

            var configurationLoader = new DefaultConfigurationLoader();
            var configuration = configurationLoader.LoadCmsConfiguration();                            

            if (!string.IsNullOrEmpty(configuration.WebSiteUrl) && configuration.WebSiteUrl.ToLower() != "auto")
            {
                serverUrl = configuration.WebSiteUrl.ToLower().TrimEnd('/');
            }

            return serverUrl;
        }

        private bool CanContinue()
        {
            bool canContinue;
            var values = ConfigurationManager.AppSettings.GetValues("installDemoDataOnFirstRun");
            if (values == null || values.Length == 0 || !bool.TryParse(values[0], out canContinue))
            {
                // By default demo data should be installed
                canContinue = true;
            }

            return canContinue;
        }
    }
}
