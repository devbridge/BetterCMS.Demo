using BetterCms.Demo.InstallDataModule;

using FluentMigrator.VersionTableInfo;

namespace BetterCMS.Demo.InstallDataModule.Models.Migrations
{
    [VersionTableMetaData]
    public class MigrationVersioning : IVersionTableMetaData
    {
        public string SchemaName { get { return "bcms_" + InstallDataModuleDescriptor.ModuleName; } }

        public string TableName { get { return "VersionInfo"; } }

        public string ColumnName { get { return "Version"; } }

        public string UniqueIndexName { get { return "uc_VersionInfo_Version_" + InstallDataModuleDescriptor.ModuleName; } }
    }
}
