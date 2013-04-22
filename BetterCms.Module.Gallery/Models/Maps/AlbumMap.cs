using BetterCms.Core.Models;

namespace BetterCms.Module.Gallery.Models.Maps
{
    public class AlbumMap : EntityMapBase<Album>
    {
        public AlbumMap() : base(GalleryModuleDescriptor.ModuleName)
        {
            Table("Albums");

            Map(x => x.Title).Not.Nullable().Length(MaxLength.Name);
            Map(x => x.Description).Nullable().Length(MaxLength.Text);
            Map(x => x.Date).Nullable();

            References(x => x.Image).Cascade.SaveUpdate().LazyLoad();
            References(x => x.Folder).Cascade.SaveUpdate().LazyLoad();
        }
    }
}
