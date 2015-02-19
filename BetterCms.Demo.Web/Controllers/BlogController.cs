using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

using BetterCms.Demo.Web.Models;

using BetterCms.Module.Api;
using BetterCms.Module.Api.Infrastructure;
using BetterCms.Module.Api.Infrastructure.Enums;
using BetterCms.Module.Api.Operations.Blog.BlogPosts;
using BetterCms.Module.Api.Operations.Root.Categories.Category;

namespace BetterCms.Demo.Web.Controllers
{
    public class BlogController : Controller
    {
        public virtual ActionResult Index(Guid? categoryId, string tagName)
        {
            IList<BlogItem> posts;
            
            using (var api = ApiFactory.Create())
            {
                var request = new GetBlogPostsModel { Take = 10, IncludeTags = true };

                var orFilter = new DataFilter(FilterConnector.Or);
                orFilter.Add("ExpirationDate", null);
                orFilter.Add("ExpirationDate", DateTime.Today, FilterOperation.GreaterOrEqual);

                request.Order.By.Add(new OrderItem("ActivationDate", OrderDirection.Desc));
                request.Order.By.Add(new OrderItem("Id"));
                request.Filter.Add("ActivationDate", DateTime.Today, FilterOperation.LessOrEqual);
                request.Filter.Inner.Add(orFilter);
                if (categoryId.HasValue)
                {
                    request.FilterByCategories = new List<Guid> { categoryId.Value };
                }

                if (!string.IsNullOrEmpty(tagName))
                {
                    request.FilterByTags.Add(tagName);
                }

                var pages = api.Blog.BlogPosts.Get(new GetBlogPostsRequest { Data = request });

                posts = pages.Data.Items.Select(
                        x => new BlogItem
                        {
                            IntroText = x.IntroText, 
                            PublishedOn = x.ActivationDate, 
                            Title = x.Title, 
                            Url = x.BlogPostUrl,
                            Author = x.AuthorName,
                            Tags = x.Tags
                        }).ToList();
            }
            
            return View(posts);
        }

        public virtual ActionResult Last()
        {
            BlogItem post = null;

            using (var api = ApiFactory.Create())
            {
                var requestLatestNewsModel = new GetBlogPostsModel { Take = 1, IncludeTags = true };

                var orFilter = new DataFilter(FilterConnector.Or);

                orFilter.Add("ExpirationDate", null);
                orFilter.Add("ExpirationDate", DateTime.Today, FilterOperation.GreaterOrEqual);

                requestLatestNewsModel.Order.By.Add(new OrderItem("ActivationDate", OrderDirection.Desc));
                requestLatestNewsModel.Order.By.Add(new OrderItem("Id"));
                requestLatestNewsModel.Filter.Add("ActivationDate", DateTime.Today, FilterOperation.LessOrEqual);

                requestLatestNewsModel.Filter.Inner.Add(orFilter);

                var request = new GetBlogPostsRequest { Data = requestLatestNewsModel };

                var pages = api.Blog.BlogPosts.Get(request);

                post = pages.Data.Items.Select(
                        x => new BlogItem
                        {
                            IntroText = x.IntroText,
                            PublishedOn = x.ActivationDate,
                            Title = x.Title,
                            Url = x.BlogPostUrl,
                            Author = x.AuthorName,
                            Tags = x.Tags
                        }).SingleOrDefault();
            }

            return View(post);            
        }

        public virtual ActionResult GetCategories()
        {
            IList<CategoryItem> categories;

            using (var api = ApiFactory.Create())
            {
                var request = new GetCategoryTreeRequest();
                
                request.CategoryTreeId = new Guid("98FD87B4-A25C-4DDE-933C-83826B6A94D7");
                request.Data.IncludeNodes = true;

                var pages = api.Root.Category.Get(request);

                categories = pages.Nodes.Where(n => n.ParentId == null && n.Id != new Guid("d837bebf-67de-4952-bc60-db03043b1524")).OrderBy(n => n.Name).Select(
                        x => new CategoryItem
                        {
                            Id = x.Id,
                            Name = x.Name
                        }).ToList();
            }

            return View(categories);
        }

        public virtual ActionResult Feed()
        {
            IList<BlogItem> posts;

            using (var api = ApiFactory.Create())
            {
                var request = new GetBlogPostsModel { Take = 10, IncludeTags = true };

                var orFilter = new DataFilter(FilterConnector.Or);
                orFilter.Add("ExpirationDate", null);
                orFilter.Add("ExpirationDate", DateTime.Today, FilterOperation.GreaterOrEqual);

                request.Order.By.Add(new OrderItem("ActivationDate", OrderDirection.Desc));
                request.Order.By.Add(new OrderItem("Id"));
                request.Filter.Add("ActivationDate", DateTime.Today, FilterOperation.LessOrEqual);

                var pages = api.Blog.BlogPosts.Get(new GetBlogPostsRequest { Data = request });

                posts = pages.Data.Items.Select(
                        x => new BlogItem
                        {
                            IntroText = x.IntroText,
                            PublishedOn = x.ActivationDate,
                            Title = x.Title,
                            Url = x.BlogPostUrl,
                            Author = x.AuthorName,
                            ImageUrl = x.MainImageUrl,
                            Tags = x.Tags
                        }).ToList();
            }

            return View(posts);
        }
    }
}
