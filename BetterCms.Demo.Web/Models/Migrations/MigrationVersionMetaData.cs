using FluentMigrator.VersionTableInfo;

namespace BetterCms.Demo.Web.Models.Migrations
{
    [VersionTableMetaData]
    public class MigrationVersionMetaData : IVersionTableMetaData
    {
        private const string Name = "templates"; // "root"; TODO: where to store version info?

        public string SchemaName
        {
            get { return "bcms_" + Name; }
        }

        public string TableName
        {
            get { return "VersionInfo"; }
        }

        public string ColumnName
        {
            get { return "Version"; }
        }

        public string UniqueIndexName
        {
            get { return "uc_VersionInfo_Verion_" + Name; }
        }
    }
}