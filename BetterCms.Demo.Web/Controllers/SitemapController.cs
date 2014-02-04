using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

using BetterCms.Demo.Web.Models;
using BetterCms.Module.Api;
using BetterCms.Module.Api.Operations.Pages.Sitemap.Nodes;

namespace BetterCms.Demo.Web.Controllers
{
    public class SiteMapController : Controller
    {
        public virtual ActionResult Index()
        {
            var menuItems = new List<MenuItemViewModel>();

            using (var api = ApiFactory.Create())
            {
                var request = new GetSitemapNodesRequest
                    {
                        SitemapId = new Guid("17ABFEE9-5AE6-470C-92E1-C2905036574B")
                    };
                request.Data.Filter.Add("ParentId", null);
                request.Data.Order.Add("DisplayOrder");

                var response = api.Pages.Sitemap.Nodes.Get(request);
                if (response.Data.Items.Count > 0)
                {
                    menuItems = response.Data.Items
                        .Select(mi => new MenuItemViewModel { Caption = mi.Title, Url = mi.Url })
                        .ToList();
                }
            }

            return View(menuItems);
        }

        public virtual ActionResult SubMenu(string parentUrl)
        {
            IList<MenuItemViewModel> menuItems = null;

            using (var api = ApiFactory.Create())
            {
                var parentRequest = new GetSitemapNodesRequest();
                parentRequest.Data.Take = 1;
                parentRequest.Data.Filter.Add("ParentId", null);
                parentRequest.Data.Filter.Add("Url", parentUrl);
                parentRequest.Data.Order.Add("DisplayOrder");
                
                var parentResponse = api.Pages.Sitemap.Nodes.Get(parentRequest);
                if (parentResponse.Data.Items.Count == 1)
                {
                    var request = new GetSitemapNodesRequest();
                    request.Data.Filter.Add("ParentId", parentResponse.Data.Items[0].Id);
                    request.Data.Order.Add("DisplayOrder");
                    
                    var response = api.Pages.Sitemap.Nodes.Get(request);
                    if (response.Data.Items.Count > 0)
                    {
                        menuItems = response.Data.Items
                            .Select(mi => new MenuItemViewModel { Caption = mi.Title, Url = mi.Url })
                            .ToList();

                        menuItems.Insert(0, new MenuItemViewModel { Caption = "Main", Url = parentUrl } );
                    }
                }
            }

            return View(menuItems);            
        }
    }
}
