using System;
using System.IO;

namespace BetterCms.Demo.Web.Tools
{
    public class DatabaseRefresher
    {
        private const string OriginalDatabaseFilename = "demo";

        private const string ConnectionStringPattern = @"Data Source=(LocalDb)\v11.0; Initial Catalog={0}; Integrated Security=SSPI; AttachDBFilename=|DataDirectory|\Temp\{0}.mdf";

        private readonly string originalDatabasePath;

        private readonly string tempBasePath;

        public string CurrentConnectionString
        {
            get;
            private set;
        }

        public DatabaseRefresher(string originalDatabasePath, string tempBasePath)
        {
            this.tempBasePath = tempBasePath;
            this.originalDatabasePath = originalDatabasePath;
        }

        public void BindNewDatabase()
        {
            var newName = string.Format("DemoDataSet_Temp_{0}", DateTime.Now.Ticks);
            CurrentConnectionString = string.Format(ConnectionStringPattern, newName);

            if (!Directory.Exists(tempBasePath))
            {
                Directory.CreateDirectory(tempBasePath);
            }
            else
            {
                ClearTempDatabases();
            }

            File.Copy(Path.Combine(originalDatabasePath, OriginalDatabaseFilename + ".mdf"), Path.Combine(tempBasePath, newName + ".mdf"));
            File.Copy(Path.Combine(originalDatabasePath, OriginalDatabaseFilename + "_log.ldf"), Path.Combine(tempBasePath, newName + "_log.ldf"));
        }

        public void ClearTempDatabases()
        {
            var dir = new DirectoryInfo(tempBasePath);
            foreach (var file in dir.GetFiles())
            {
                try
                {
                    file.Delete();
                }
                catch
                {
                    // Just ignore files that can not be removed.
                }
            }
        }
    }
}
