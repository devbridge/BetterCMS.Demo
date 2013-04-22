using BetterCms.Core.Modules;
using BetterCms.Core.Modules.Projections;
using BetterCms.Module.Gallery.Content.Resources;
using BetterCms.Module.Gallery.Controllers;

namespace BetterCms.Module.Gallery.Registration
{
    public class GalleryJsModuleIncludeDescriptor : JsIncludeDescriptor
    {
        public GalleryJsModuleIncludeDescriptor(ModuleDescriptor module)
            : base(module, "bcms.gallery")
        {
            Links = new IActionProjection[]
                {
                    new JavaScriptModuleLinkTo<GalleryController>(this, "loadSiteSettingsGalleryUrl", c => c.Index(null)),
                };

            Globalization = new IActionProjection[]
                {
                    new JavaScriptModuleGlobalization(this, "createNewAlbumDialogTitle", () => GalleryGlobalization.CreateNewAlbum_Dialog_Title),
                };
        }
    }
}