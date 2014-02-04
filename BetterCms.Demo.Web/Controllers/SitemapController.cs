using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

using BetterCms.Demo.Web.Models;

using BetterCms.Module.Api;
using BetterCms.Module.Api.Infrastructure;
using BetterCms.Module.Api.Infrastructure.Enums;
using BetterCms.Module.Api.Operations.Pages.Pages.Page.Exists;
using BetterCms.Module.Api.Operations.Pages.Sitemap;
using BetterCms.Module.Api.Operations.Pages.Sitemap.Nodes;
using BetterCms.Module.Api.Operations.Pages.Sitemap.Tree;

namespace BetterCms.Demo.Web.Controllers
{
    public class SiteMapController : Controller
    {
        private static Guid defaultSitemapId = new Guid("17ABFEE9-5AE6-470C-92E1-C2905036574B");

        public virtual ActionResult Index()
        {
            var menuItems = new List<MenuItemViewModel>();

            using (var api = ApiFactory.Create())
            {
                var sitemapId = GetSitemapId(api);
                if (sitemapId.HasValue)
                {
                    var request = new GetSitemapTreeRequest { SitemapId = sitemapId.Value };

                    var response = api.Pages.Sitemap.Tree.Get(request);
                    if (response.Data.Count > 0)
                    {
                        menuItems = response.Data.Select(mi => new MenuItemViewModel { Caption = mi.Title, Url = mi.Url }).ToList();
                    }
                }
            }

            return View(menuItems);
        }

        public virtual ActionResult SubMenu(string parentUrl)
        {
            var menuItems = new List<MenuItemViewModel>();

            using (var api = ApiFactory.Create())
            {
                var pageRequest = new PageExistsRequest { PageUrl = parentUrl };
                var pageResponse = api.Pages.Page.Exists(pageRequest);

                var sitemapId = GetSitemapId(api);
                if (sitemapId.HasValue)
                {
                    var parentRequest = new GetSitemapNodesRequest();
                    parentRequest.SitemapId = sitemapId.Value;
                    parentRequest.Data.Take = 1;
                    parentRequest.Data.Filter.Add("ParentId", null);

                    var filter = new DataFilter(FilterConnector.Or);
                    parentRequest.Data.Filter.Inner.Add(filter);
                    filter.Add("Url", parentUrl);
                    if (pageResponse.Data.Exists)
                    {
                        filter.Add("PageId", pageResponse.Data.PageId.Value);
                    }
                    parentRequest.Data.Order.Add("DisplayOrder");

                    var parentResponse = api.Pages.Sitemap.Nodes.Get(parentRequest);
                    if (parentResponse.Data.Items.Count == 1)
                    {
                        var request = new GetSitemapTreeRequest { SitemapId = sitemapId.Value };
                        request.Data.NodeId = parentResponse.Data.Items[0].Id;
                        var response = api.Pages.Sitemap.Tree.Get(request);
                        if (response.Data.Count > 0)
                        {
                            menuItems = response.Data.Select(mi => new MenuItemViewModel { Caption = mi.Title, Url = mi.Url }).ToList();
                            menuItems.Insert(0, new MenuItemViewModel { Caption = "Main", Url = parentUrl });
                        }
                    }
                }
            }

            return View(menuItems);            
        }

        private Guid? GetSitemapId(IApiFacade api)
        {
            var allSitemaps = api.Pages.Sitemap.Get(new GetSitemapsRequest());
            if (allSitemaps.Data.Items.Count > 0)
            {
                var sitemap = allSitemaps.Data.Items.FirstOrDefault(map => map.Id == defaultSitemapId) ?? allSitemaps.Data.Items.First();
                return sitemap.Id;
            }

            return null;
        }
    }
}
