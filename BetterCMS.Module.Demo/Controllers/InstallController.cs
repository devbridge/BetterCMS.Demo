using System.Web;
using System.Web.Mvc;
using BetterCMS.Module.Demo.Commands.SetupDatabase;
using BetterCMS.Module.Demo.Commands.TestConnection;
using BetterCMS.Module.Demo.Content.Resources;
using BetterCMS.Module.Demo.Services;
using BetterCMS.Module.Demo.ViewModels;
using BetterCms.Core.Environment.Host;
using BetterCms.Module.Root.Mvc;
using Microsoft.Web.Mvc;

namespace BetterCMS.Module.Demo.Controllers
{
    [ActionLinkArea(InstallDataModuleDescriptor.ModuleAreaName)]
    public class InstallController : CmsControllerBase
    {
        private readonly IInstallService installService;

        private readonly ICmsHost cmsHost;

        public InstallController(IInstallService installService, ICmsHost cmsHost)
        {
            this.installService = installService;
            this.cmsHost = cmsHost;
        }

        [HttpGet]
        public ActionResult SetupDatabase()
        {
            if (!installService.ShoulDatabaseBeSet())
            {
                throw new HttpException(403, "Database is already installed!");
            }

            var model = new SetupDatabaseViewModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult SetupDatabase(SetupDatabaseViewModel model)
        {
            if (!installService.ShoulDatabaseBeSet())
            {
                throw new HttpException(403, "Database is already installed!");
            }

            var success = false;
            if (ModelState.IsValid)
            {
                if (GetCommand<SetupDatabaseCommand>().ExecuteCommand(model))
                {
                    cmsHost.RestartApplicationHost();
                    success = true;
                    Messages.AddSuccess(InstallGlobalization.SetupDatabase_DatabaseIsOK_Reloading);
                }
            }

            return WireJson(success);
        }

        [HttpPost]
        public ActionResult TestConnection(SetupDatabaseViewModel model)
        {
            var success = false;
            if (ModelState.IsValid)
            {
                success = GetCommand<TestConnectionCommand>().ExecuteCommand(model);
                if (success)
                {
                    Messages.AddSuccess(InstallGlobalization.TestDatabaseConnection_ConnectionIsOK);
                }
            }

            return WireJson(success);
        }
    }
}