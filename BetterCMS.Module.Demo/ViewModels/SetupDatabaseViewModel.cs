namespace BetterCMS.Module.Demo.ViewModels
{
    public class SetupDatabaseViewModel : System.ICloneable
    {
        public string Server { get; set; }
        
        public string Database { get; set; }

        public bool CreateDatabase { get; set; }

        public bool IsIntegratedSecurity { get; set; }
        
        public string Username { get; set; }
        
        public string Password { get; set; }

        public bool EditConnectionString { get; set; }
        
        public string ConnectionString { get; set; }

        public object Clone()
        {
            return new SetupDatabaseViewModel
                       {
                           Server = Server,
                           Database = Database,
                           IsIntegratedSecurity = IsIntegratedSecurity,
                           Username = Username,
                           Password = Password,
                           EditConnectionString = EditConnectionString,
                           ConnectionString = ConnectionString
                       };
        }
    }
}
