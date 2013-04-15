using System;
using System.Collections.Generic;
using BetterCms.Core.DataContracts.Enums;
using FluentMigrator;

namespace BetterCms.Demo.Web.Models.Migrations
{
    [Migration(201304110949)]
    public class InitialSetup : Migration
    {
        public const string UpdatedBy = "Admin";
        public readonly DateTime UpdatedOn = DateTime.Now;

        #region Overrides

        public override void Up()
        {
            AddTemplates();
            AddWidgets();
            AddPages();
            AddContent();
        }

        public override void Down()
        {
            throw new NotImplementedException();
        }

        #endregion


        private void AddTemplates()
        {
            InsertTemplate("Two Columns with Header", "~/Views/Shared/CmsTemplates/_TwoColumnsWithHeader.cshtml", new[] { "Header", "CMSMainContent", "Right" });
            InsertTemplate("Two Columns", "~/Views/Shared/CmsTemplates/_TwoColumnsTemplate.cshtml", new[] { "CMSMainContent", "Right" });
            InsertTemplate("Three Columns Template", "~/Views/Shared/CmsTemplates/_ThreeColumnsTemplate.cshtml", new[] { "CMSMainContent", "Middle", "Right" });
        }

        private void AddWidgets()
        {
            InsertHtmlWidget("Social Media Links", @"<div class='side-box'> <h2>Find us on</h2> <div class='social-logo clearfix'> <a href='#nolink' class='facebook'>Facebook</a> <a href='#nolink' class='twitter'>Twitter</a> <a href='#nolink' class='linkedin'>LinkedIn</a> </div> <div class='social-logo clearfix'> <a href='#nolink' class='skype'>Skype</a> <a href='#nolink' class='youtube'>YouTube</a> <a href='#nolink' class='flickr'>Flikr</a> </div> </div>");
            InsertHtmlWidget("Aside bar", @"<div class='side-box'> <h2>Aside bar</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut <a href='#nolink'>laoreet dolore</a> magna aliquam erat volutpat.</p> <a href='#nolink'>&lt; Read More &gt;</a> </div>");
        }

        private void AddPages()
        {
            UpdateDefaultRootPage();
            InsertPage("Home", "Two Columns with Header", "/", "Better CMS main demo page.");
            InsertPage("About Us", "Three Columns Template", "/aboutus/", "About Us page.");
            InsertPage("Blog", "Two Columns", "/blog/", "Blog landing page.");
            InsertPage("News", "Two Columns", "/news/", "News page.");
        }

        public void AddContent()
        {
            InsertContent("Home", "Header", 0, new Content { Name = "Banner", Html = @"<div class='banner-image'> <div> <hgroup class='banner-text'> <h1>Ut wisi minim veniam</h1> <h2>doming id quod mazim placerat facer possim assum.</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 1' /> </div> <div> <hgroup class='banner-text'> <h1>Esse molestie consequa</h1> <h2>doming id quod mazim placerat facer possim assum.</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 2' /> </div> <div> <hgroup class='banner-text'> <h1>Congue nihil imperdiet</h1> <h2>doming id quod mazim placerat facer possim assum.</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 3' /> </div> <div> <hgroup class='banner-text'> <h1>Ut wisi enim ad minim veniam</h1> <h2>doming id quod mazim placerat facer possim assum. doming id quod mazim placerat facer possim assum</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 4' /> </div> </div> <div class='banner-nav' id='home-banner'> <a href='#1' class='banner-link link'>Ut wisi enim ad minim veniam</a> <div class='block'> <p> <br /> You've seen it coming! Buy now and get nothing for free! Well, at least no free beer. Perhaps a bear, if you can afford it. </p> </div> <a href='#2' class='banner-link link'>Esse molestie consequa</a> <div class='block'> <p>your bear, you have to admit it! No, we aren't selling bears.</p> </div> <a href='#3' class='banner-link link'>Congue nihil imperdiet</a> <div class='block'> <p>And now, for something completely different. And now, for something completely different. Period.</p> </div> <a href='#4' class='banner-link link'>Ut wisi enim ad minim veniam</a> <div class='block'> <br /> <p>And now, for something completely different. And now.</p> </div> </div> " });
            InsertContent("Home", "CMSMainContent", 0, new Content { Name = "About Us", Html = @"<h1>About Us</h1><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p><p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis brodi autem vel feugait nulla... <a href='/AboutUs'>Read more About Us</a></p>" });
            InsertContent("Home", "Right", 0, new Content { Name = "Gallery", Html = @"<h1>Gallery</h1>" });

            InsertContent("About Us", "CMSMainContent", 0, new Content { Name = "Lorem ipsum", Html = @"<hgroup> <h1>This is an Example of a Sub Head</h1> <h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2> </hgroup> <section class='content-image-1'> <img src='/Content/images/sample-45.jpg' alt='Sample 45'> <div class='info-box'> <h2>Consectetuer adipiscing</h2> <h3>doming id quod mazim placerat facer possim assum.</h3> </div> </section> <article class='content-article'> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> </article> <article class='content-article'> <h2>This is an Example of a Sub Head</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> </article>" });
            InsertContent("About Us", "Right", 1, "Social Media Links");
            InsertContent("About Us", "Right", 2, "Aside bar");

            InsertContent("Blog", "Right", 1, "Social Media Links");
            InsertContent("Blog", "Right", 2, "Aside bar");

            InsertContent("News", "CMSMainContent", 0, new Content { Name = "Lorem ipsum", Html = @"<hgroup> <h1>This is an Example of a Sub Head</h1> <h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2> </hgroup>" });
            InsertContent("News", "CMSMainContent", 1, new Content { Name = "Lorem ipsum", Html = @"<section class='content-image-2'> <img src='/Content/images/sample-32.jpg' alt='Sample 32'> <div class='info-box'> <h2>Consectetuer adipiscing</h2> <h3>doming id quod mazim placerat facer possim assum.</h3> </div> </section>" });
            InsertContent("News", "CMSMainContent", 2, new Content { Name = "Lorem ipsum", Html = @"<article class='content-article'> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> </article>" });
            InsertContent("News", "CMSMainContent", 3, new Content { Name = "Lorem ipsum", Html = @"<article class='content-article'> <h2>This is an Example of a Sub Head</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> </article>" });
            InsertContent("News", "CMSMainContent", 4, new Content { Name = "Lorem ipsum", Html = @"<article class='content-article'> <h2>This is an Example of a Sub Head</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p> <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. </p> <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p> </article>" });
            InsertContent("News", "CMSMainContent", 5, new Content { Name = "Lorem ipsum", Html = @"<section class='quotation'> <h2>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat:</h2> <dl> <dd><span></span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</dd> <dd><span></span>sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna </dd> <dd><span></span>aliquam erat volutpat. Ut wisi enim ad minim veniam</dd> </dl> </section>" });
            InsertContent("News", "Right", 1, "Social Media Links");
            InsertContent("News", "Right", 2, "Aside bar");

//            InsertContent("", "", 0, new Content{ Name = "", Html = "" });
        }

        private void UpdateDefaultRootPage()
        {
            Update
                .Table(Constants.DataBase.Tables.Pages)
                .InSchema(Constants.DataBase.Schemas.Root)
                .Set(new
                {
                    PageUrl = "/default/",
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy
                })
                .Where(new { PageUrl = "/" });
        }

        #region Infrastructure

        private readonly Dictionary<string, Guid> templates = new Dictionary<string, Guid>();
        private readonly Dictionary<string, Guid> regions = new Dictionary<string, Guid>();
        private readonly Dictionary<string, Guid> widgets = new Dictionary<string, Guid>();
        private readonly Dictionary<string, Guid> pages = new Dictionary<string, Guid>();
        private readonly Dictionary<string, Guid> nodes = new Dictionary<string, Guid>();

        private static class Constants
        {
            public static class DataBase
            {
                public static class Schemas
                {
                    public const string Root = "bcms_root";
                    public const string Pages = "bcms_pages";
                }

                public static class Tables
                {
                    public const string Layouts = "Layouts";
                    public const string Regions = "Regions";
                    public const string LayoutRegions = "LayoutRegions";
                    public const string Pages = "Pages";
                    public const string SitemapNodes = "SitemapNodes";
                    public const string Contents = "Contents";
                    public const string HtmlContents = "HtmlContents";
                    public const string PageContents = "PageContents";
                    public const string Widgets = "Widgets";
                    public const string HtmlContentWidgets = "HtmlContentWidgets";
                }
            }
        }

        private class Content
        {
            public string Name { get; set; }
            public string Html { get; set; }
        }

        private void InsertTemplate(string name, string url, IEnumerable<string> regionNames)
        {
            // Add template.
            var templateId = Guid.NewGuid();
            templates.Add(name, templateId);

            Insert
                .IntoTable(Constants.DataBase.Tables.Layouts)
                .InSchema(Constants.DataBase.Schemas.Root)
                .Row(new
                {
                    Version = 1,
                    IsDeleted = false,
                    CreatedOn = UpdatedOn,
                    CreatedByUser = UpdatedBy,
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy,

                    Id = templateId,
                    Name = name,
                    LayoutPath = url,
                });

            // Assign regions.
            foreach (var region in regionNames)
            {
                var regionId = Guid.NewGuid();

                if (!regions.ContainsKey(region))
                {
                    // Add region.
                    if (region == "CMSMainContent")
                    {
                        // Special case: BetterCMS contains CMSMainContent region by default.
                        regionId = new Guid("4161FA8D-299E-460B-8CA1-D27BA455B7B4");
                    }
                    else 
                    {
                        Insert
                            .IntoTable(Constants.DataBase.Tables.Regions)
                            .InSchema(Constants.DataBase.Schemas.Root)
                            .Row(new
                            {
                                Version = 1,
                                IsDeleted = false,
                                CreatedOn = UpdatedOn,
                                CreatedByUser = UpdatedBy,
                                ModifiedOn = UpdatedOn,
                                ModifiedByUser = UpdatedBy,

                                Id = regionId,
                                RegionIdentifier = region,
                            });
                    }

                    regions.Add(region, regionId);
                }
                else
                {
                    regionId = regions[region];
                }

                // Assign region to template.
                Insert
                    .IntoTable(Constants.DataBase.Tables.LayoutRegions)
                    .InSchema(Constants.DataBase.Schemas.Root)
                    .Row(new
                    {
                        Version = 1,
                        IsDeleted = false,
                        CreatedOn = UpdatedOn,
                        CreatedByUser = UpdatedBy,
                        ModifiedOn = UpdatedOn,
                        ModifiedByUser = UpdatedBy,

                        Id = Guid.NewGuid(),
                        LayoutId = templateId,
                        RegionId = regionId,
                    });
            }
        }

        private void InsertHtmlWidget(string name, string html)
        {
            var id = Guid.NewGuid();
            widgets.Add(name, id);

            Insert
                .IntoTable(Constants.DataBase.Tables.Contents)
                .InSchema(Constants.DataBase.Schemas.Root)
                .Row(new
                {
                    Version = 1,
                    IsDeleted = false,
                    CreatedOn = UpdatedOn,
                    CreatedByUser = UpdatedBy,
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy,

                    Id = id,
                    Name = name,
                    Status = (int)ContentStatus.Published,
                    PublishedOn = UpdatedOn,
                    PublishedByUser = UpdatedBy
                });

            Insert
                .IntoTable(Constants.DataBase.Tables.Widgets)
                .InSchema(Constants.DataBase.Schemas.Root)
                .Row(new { Id = id });

            Insert
                .IntoTable(Constants.DataBase.Tables.HtmlContentWidgets)
                .InSchema(Constants.DataBase.Schemas.Pages)
                .Row(new
                {
                    Id = id,
                    UseCustomCss = false,
                    UseCustomJs = false,
                    UseHtml = true,
                    Html = html,
                    EditInSourceMode = false
                });
        }

        private void InsertPage(string name, string templateName, string url, string description, string parentNodeName = null)
        {
            var id = Guid.NewGuid();
            pages.Add(name, id);

            Insert
                .IntoTable(Constants.DataBase.Tables.Pages)
                .InSchema(Constants.DataBase.Schemas.Root)
                .Row(new
                {
                    Version = 1,
                    IsDeleted = false,
                    CreatedOn = UpdatedOn,
                    CreatedByUser = UpdatedBy,
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy,

                    Id = id,
                    PageUrl = url,
                    Title = name,
                    LayoutId = templates[templateName],
                    PublishedOn = UpdatedOn,
                    MetaTitle = "Ut wisi minim veniam.",
                    MetaKeywords = "doming id quod mazim placerat facer possim assum",
                    MetaDescription = "doming id quod mazim placerat facer possim assum",
                    IsPublic = true,
                    Status = (int)PageStatus.Published,
                });

            Insert
                .IntoTable(Constants.DataBase.Tables.Pages)
                .InSchema(Constants.DataBase.Schemas.Pages)
                .Row(new
                {
                    Id = id,
                    Description = description,
                    // page.ImageId,
                    // CanonicalUrl,
                    // CustomCss,
                    // CustomJS,
                    UseCanonicalUrl = false,
                    UseNoFollow = false,
                    UseNoIndex = false,
                    PublishedOn = UpdatedOn,
                    // page.CategoryId,
                    NodeCountInSitemap = 1
                });

            var sitemapNodeId = Guid.NewGuid();
            nodes.Add(name, sitemapNodeId);

            Insert
                .IntoTable(Constants.DataBase.Tables.SitemapNodes)
                .InSchema(Constants.DataBase.Schemas.Pages)
                .Row(new
                {
                    Version = 1,
                    IsDeleted = false,
                    CreatedOn = UpdatedOn,
                    CreatedByUser = UpdatedBy,
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy,

                    Title = name,
                    Url = url,
                    DisplayOrder = 0,
                    // TODO: ParentNodeId = nodes[parentNodeName]
                });
        }

        private void InsertContent(string pageName, string regionName, int order, object content)
        {
            var contentId = Guid.NewGuid();

            var widgetName = content as string;
            var htmlContent = content as Content;
            if (htmlContent != null)
            {
                Insert
                    .IntoTable(Constants.DataBase.Tables.Contents)
                    .InSchema(Constants.DataBase.Schemas.Root)
                    .Row(new
                    {
                        Version = 1,
                        IsDeleted = false,
                        CreatedOn = UpdatedOn,
                        CreatedByUser = UpdatedBy,
                        ModifiedOn = UpdatedOn,
                        ModifiedByUser = UpdatedBy,

                        Id = contentId,
                        Name = htmlContent.Name,
                        Status = (int)ContentStatus.Published,
                        PublishedOn = UpdatedOn,
                        PublishedByUser = UpdatedBy,
                    });

                Insert
                    .IntoTable(Constants.DataBase.Tables.HtmlContents)
                    .InSchema(Constants.DataBase.Schemas.Pages)
                    .Row(new
                    {
                        Id = contentId,
                        ActivationDate = UpdatedOn,
                        UseCustomCss = false,
                        UseCustomJs = false,
                        Html = htmlContent.Html,
                        EditInSourceMode = false
                    });

            }
            else if (widgetName != null)
            {
                contentId = widgets[widgetName];
            }

            Insert
                .IntoTable(Constants.DataBase.Tables.PageContents)
                .InSchema(Constants.DataBase.Schemas.Root)
                .Row(new
                {
                    Version = 1,
                    IsDeleted = false,
                    CreatedOn = UpdatedOn,
                    CreatedByUser = UpdatedBy,
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy,

                    Id = Guid.NewGuid(),
                    PageId = pages[pageName],
                    ContentId = contentId,
                    RegionId = regions[regionName],
                    Order = order
                });
        }

        #endregion
    }
}