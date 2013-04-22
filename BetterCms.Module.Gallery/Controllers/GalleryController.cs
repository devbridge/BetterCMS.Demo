using System.Web.Mvc;
using BetterCms.Core.Security;
using BetterCms.Module.Gallery.Commands.GetAlbumList;
using BetterCms.Module.Root.Mvc;
using BetterCms.Module.Root.Mvc.Grids.GridOptions;

namespace BetterCms.Module.Gallery.Controllers
{
    [BcmsAuthorize]
    public class GalleryController : CmsControllerBase
    {
        public ActionResult Index(SearchableGridOptions request)
        {
            var model = GetCommand<GetAlbumListCommand>().ExecuteCommand(request ?? new SearchableGridOptions());
            return View(model);
        }

    }
}
