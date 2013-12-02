namespace BetterCMS.Module.Demo.ViewModels
{
    public class SetupDatabaseViewModel
    {
        public string Server { get; set; }
        
        public string Database { get; set; }
        
        public bool IsIntegratedSecurity { get; set; }
        
        public string Username { get; set; }
        
        public string Password { get; set; }

        public bool EditConnectionString { get; set; }
        
        public string ConnectionString { get; set; }
    }
}
