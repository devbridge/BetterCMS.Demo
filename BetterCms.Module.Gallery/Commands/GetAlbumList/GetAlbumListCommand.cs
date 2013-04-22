using System.Linq;
using BetterCms.Core.Mvc.Commands;
using BetterCms.Module.Gallery.Models;
using BetterCms.Module.Gallery.ViewModels;
using BetterCms.Module.Root.Mvc;
using BetterCms.Module.Root.Mvc.Grids.Extensions;
using BetterCms.Module.Root.Mvc.Grids.GridOptions;
using BetterCms.Module.Root.ViewModels.SiteSettings;

using NHibernate.Criterion;
using NHibernate.Transform;

namespace BetterCms.Module.Gallery.Commands.GetAlbumList
{
    public class GetAlbumListCommand : CommandBase, ICommand<SearchableGridOptions, SearchableGridViewModel<SiteSettingsAlbumViewModel>>
    {
        public SearchableGridViewModel<SiteSettingsAlbumViewModel> Execute(SearchableGridOptions request)
        {
            SearchableGridViewModel<SiteSettingsAlbumViewModel> model;

            request.SetDefaultSortingOptions("Title");

            Album alias = null;
            SiteSettingsAlbumViewModel modelAlias = null;

            var query = UnitOfWork.Session
                .QueryOver(() => alias)
                .Where(() => !alias.IsDeleted);

            if (!string.IsNullOrWhiteSpace(request.SearchQuery))
            {
                var searchQuery = string.Format("%{0}%", request.SearchQuery);
                query = query.Where(Restrictions.InsensitiveLike(Projections.Property(() => alias.Title), searchQuery));
            }

            query = query
                .SelectList(select => select
                    .Select(() => alias.Id).WithAlias(() => modelAlias.Id)
                    .Select(() => alias.Version).WithAlias(() => modelAlias.Version)
                    .Select(() => alias.Title).WithAlias(() => modelAlias.Title)
                    .Select(() => alias.Date).WithAlias(() => modelAlias.Date)
                    .Select(() => alias.Description).WithAlias(() => modelAlias.Description))
                .TransformUsing(Transformers.AliasToBean<SiteSettingsAlbumViewModel>());

            var count = query.ToRowCountFutureValue();

            var blogPosts = query.AddSortingAndPaging(request).Future<SiteSettingsAlbumViewModel>();

            model = new SearchableGridViewModel<SiteSettingsAlbumViewModel>(blogPosts.ToList(), request, count.Value);

            return model;
        }
    }
}