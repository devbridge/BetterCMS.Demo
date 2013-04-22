using System;
using BetterCms.Module.Root.Mvc.Grids;

namespace BetterCms.Module.Gallery.ViewModels
{
    public class SiteSettingsAlbumViewModel : IEditableGridItem
    {
        public virtual Guid Id { get; set; }
        public virtual int Version { get; set; }
        public virtual string Title { get; set; }
        public DateTime Date { get; set; }
        public string Description { get; set; }
    }
}