using System;
using BetterCms.Core.Models;
using BetterCms.Module.MediaManager.Models;

namespace BetterCms.Module.Gallery.Models
{
    [Serializable]
    public class Album : EquatableEntity<Album>
    {
        public virtual string Title { get; set; }
        public virtual string Description { get; set; }
        public virtual DateTime? Date { get; set; }
        public virtual MediaImage Image { get; set; }
        public virtual MediaFolder Folder { get; set; }
    }
}