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
        }

        public override void Down()
        {
            throw new System.NotImplementedException();
        }
    }
}
