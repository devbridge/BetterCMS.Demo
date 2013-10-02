using System;
using System.IO;

using BetterCms.Core.DataAccess.DataContext.Migrations;
using FluentMigrator;

namespace BetterCMS.Module.Demo.Models.Migrations
{
    [Migration(201309271633)]
    public class InitialSetup : DefaultMigration
    {
        public InitialSetup()
            : base(InstallDataModuleDescriptor.ModuleName)
        {
        }

        public override void Up()
        {
            IfSqlServer().Execute.EmbeddedScript("Migration201309271633.sqlserver.sql");


            var codeBase = System.Reflection.Assembly.GetExecutingAssembly().CodeBase;
            var uri = new UriBuilder(codeBase);
            var path = Uri.UnescapeDataString(uri.Path);
            var rootPath = Path.GetDirectoryName(Path.GetDirectoryName(path));

            var script1 = string.Format("UPDATE [bcms_media].[MediaFiles] SET [FileUri] = REPLACE([FileUri], '[WebSiteRootPath]', '{0}')", rootPath);
            IfSqlServer().Execute.Sql(script1);

            var script2 = string.Format("UPDATE [bcms_media].[MediaImages] SET [OriginalUri] = REPLACE([OriginalUri], '[WebSiteRootPath]', '{0}'), [ThumbnailUri] = REPLACE([ThumbnailUri], '[WebSiteRootPath]', '{0}')", rootPath);
            IfSqlServer().Execute.Sql(script2);
        }

        public override void Down()
        {
            throw new System.NotImplementedException();
        }
    }
}
