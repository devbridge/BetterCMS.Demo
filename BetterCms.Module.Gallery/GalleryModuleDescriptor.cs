using System.Collections.Generic;
using Autofac;
using BetterCms.Core.Modules;
using BetterCms.Core.Modules.Projections;
using BetterCms.Module.Gallery.Content.Resources;
using BetterCms.Module.Gallery.Registration;

namespace BetterCms.Module.Gallery
{
    public class GalleryModuleDescriptor : ModuleDescriptor
    {
        internal const string ModuleName = "gallery";

        /// <summary>
        /// The gallery java script module descriptor
        /// </summary>
        private readonly GalleryJsModuleIncludeDescriptor galleryJsModuleIncludeDescriptor;

        /// <summary>
        /// Initializes a new instance of the <see cref="GalleryModuleDescriptor" /> class.
        /// </summary>
        public GalleryModuleDescriptor(ICmsConfiguration configuration) : base(configuration)
        {
            galleryJsModuleIncludeDescriptor = new GalleryJsModuleIncludeDescriptor(this);
        }

        /// <summary>
        /// Gets the module name.
        /// </summary>
        /// <value>
        /// The module name.
        /// </value>
        public override string Name
        {
            get { return ModuleName; }
        }

        /// <summary>
        /// Gets the module description.
        /// </summary>
        /// <value>
        /// The module description.
        /// </value>
        public override string Description
        {
            get { return "Gallery module for BetterCMS."; }
        }

        /// <summary>
        /// Registers the sidebar main projections.
        /// </summary>
        /// <param name="containerBuilder">The container builder.</param>
        /// <returns></returns>
        public override IEnumerable<IPageActionProjection> RegisterSidebarMainProjections(ContainerBuilder containerBuilder)
        {
            return new IPageActionProjection[] { };
        }

        /// <summary>
        /// Registers java script modules.
        /// </summary>        
        /// <returns>
        /// Enumerator of known JS modules list.
        /// </returns>
        public override IEnumerable<JsIncludeDescriptor> RegisterJsIncludes()
        {
            return new[]
                {
                    galleryJsModuleIncludeDescriptor
                };
        }

        /// <summary>
        /// Registers the style sheet files.
        /// </summary>        
        /// <returns>Enumerator of known module style sheet files.</returns>
        public override IEnumerable<CssIncludeDescriptor> RegisterCssIncludes()
        {
            return new[]
                {
                    new CssIncludeDescriptor(this, "bcms.gallery.css")
                };
        }

        /// <summary>
        /// Registers the site settings projections.
        /// </summary>
        /// <param name="containerBuilder">The container builder.</param>
        /// <returns>List of page action projections.</returns>
        public override IEnumerable<IPageActionProjection> RegisterSiteSettingsProjections(ContainerBuilder containerBuilder)
        {
            return new IPageActionProjection[]
                {
                    new LinkActionProjection(galleryJsModuleIncludeDescriptor, page => "loadSiteSettingsGallery")
                        {
                            Order = 2500,
                            Title = () => GalleryGlobalization.SiteSettings_GalleryMenuItem,
                            CssClass = page => "bcms-sidebar-link",
                        }
                };
        }
    }
}