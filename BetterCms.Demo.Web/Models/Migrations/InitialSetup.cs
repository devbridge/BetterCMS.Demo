using System;
using System.Collections.Generic;
using BetterCms.Core.DataContracts.Enums;
using FluentMigrator;

namespace BetterCms.Demo.Web.Models.Migrations
{
    [Migration(201304110949)]
    public class InitialSetup : Migration
    {
        private const string demoDataCreationUser = "Admin";
        private const string RootSchemaName = "bcms_root";
        private const string PagesSchemaName = "bcms_pages";

        private const string LayoutsTableName = "Layouts";
        private const string RegionsTableName = "Regions";
        private const string LayoutRegionsTableName = "LayoutRegions";
        private const string PagesTableName = "Pages";
        private const string SitemapNodesTableName = "SitemapNodes";
        private const string ContentsTableName = "Contents";
        private const string HtmlContentsTableName = "HtmlContents";
        private const string PageContentsTableName = "PageContents";

        private static Guid MainPageTemplateId = new Guid("52EFCC37-5583-46D9-AE06-FA15CA84F286");
        private static Guid MainPageTopRegionId = new Guid("F83A3130-3CC8-4FE1-8585-09969BAA9CDE");
        private static Guid MainPageMainRegionId = new Guid("3C7F8C94-A36A-445E-B9BF-04A268619475");
        private static Guid MainPageRightSideRegionId = new Guid("F0E53FDC-AA67-49BE-A295-29D822BDFFB9");

        private static Guid MainPageId = new Guid("CF320C05-0C22-4512-B68A-F4CE9679C9AD");

        public override void Up()
        {
            CreateTemplates();
//            CreateHtmlWidgets();
//            CreateServerWidgets();
            RemoveDefaultRootPage();
            CreatePages();
            CreateContent();
        }

        public override void Down()
        {
            throw new NotImplementedException();
        }

        private void CreateTemplates()
        {
            AddTemplate(
                new Template
                    {
                        Id = MainPageTemplateId,
                        Name = "Main Page Template",
                        LayoutPath = "~/Views/Shared/CmsTemplates/_MainPageTemplate.cshtml"
                    },
                new[]
                    {
                        new Region
                            {
                                Id = MainPageTopRegionId,
                                RegionIdentifier = "Top"
                            },
                        new Region
                            {
                                Id = MainPageMainRegionId,
                                RegionIdentifier = "Main"
                            },
                        new Region
                            {
                                Id = MainPageRightSideRegionId,
                                RegionIdentifier = "RightSide"
                            },
                    });
        }

        private void RemoveDefaultRootPage()
        {
            Update
                .Table(PagesTableName)
                .InSchema(RootSchemaName)
                .Set(new
                    {
                        PageUrl = "/default/",
                        ModifiedOn = DateTime.Now,
                        ModifiedByUser = demoDataCreationUser
                    })
                .Where(new { PageUrl = "/" });
        }

        private void CreatePages()
        {
            AddPage(new Page
                {
                    Id = MainPageId,
                    LayoutId = MainPageTemplateId,
                    PageUrl = "/",
                    Title = "Home",
                    Description = "Better CMS main demo page.",
                    MetaTitle = "Ut wisi minim veniam.",
                    MetaKeywords = "doming id quod mazim placerat facer possim assum",
                    MetaDescription = "doming id quod mazim placerat facer possim assum"
                },
                new SitemapNode
                    {
                        Title = "Home",
                        Url = "/"
                    });
        }

        private void CreateContent()
        {
            AddContent(MainPageId, MainPageMainRegionId, 0, new HtmlContent
                {
                    Name = "About Us",
                    Html = @"<h1>About Us</h1><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p><p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis brodi autem vel feugait nulla... <a href='/AboutUs'>Read more About Us</a></p>",
                });

            AddContent(MainPageId, MainPageMainRegionId, 0, new HtmlContent
                {
                    Name = "About Us",
                    Html = @"<h1>About Us</h1><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p><p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis brodi autem vel feugait nulla... <a href='/AboutUs'>Read more About Us</a></p>",
                });
        }

        private void AddTemplate(Template template, IEnumerable<Region> regions)
        {
            Insert
                .IntoTable(LayoutsTableName)
                .InSchema(RootSchemaName)
                .Row(template);

            foreach (var region in regions)
            {
                Insert
                    .IntoTable(RegionsTableName)
                    .InSchema(RootSchemaName)
                    .Row(region);

                var layoutRegion = new LayoutRegion
                    {
                        Description = region.RegionIdentifier,
                        LayoutId = template.Id,
                        RegionId = region.Id
                    };

                Insert
                    .IntoTable(LayoutRegionsTableName)
                    .InSchema(RootSchemaName)
                    .Row(layoutRegion);
            }
        }

        private void AddPage(Page page, SitemapNode node = null)
        {
            page.NodeCountInSitemap += node != null ? 1 : 0;

            Insert
                .IntoTable(PagesTableName)
                .InSchema(RootSchemaName)
                .Row(new
                    {
                        page.Id,
                        page.Version,
                        page.IsDeleted,
                        page.CreatedOn,
                        page.CreatedByUser,
                        page.ModifiedOn,
                        page.ModifiedByUser,
                        page.PageUrl,
                        page.Title,
                        page.LayoutId,
                        page.PublishedOn,
                        page.MetaTitle,
                        page.MetaKeywords,
                        page.MetaDescription,
                        page.IsPublic,
                        page.Status
                    });

            Insert
                .IntoTable(PagesTableName)
                .InSchema(PagesSchemaName)
                .Row(new
                    {
                        page.Id,
                        page.Description,
                        //page.ImageId,
                        page.CanonicalUrl,
                        page.CustomCss,
                        page.CustomJS,
                        page.UseCanonicalUrl,
                        page.UseNoFollow,
                        page.UseNoIndex,
                        page.PublishedOn,
                        //page.CategoryId,
                        page.NodeCountInSitemap
                    });

            if (node != null)
            {
                Insert
                    .IntoTable(SitemapNodesTableName)
                    .InSchema(PagesSchemaName)
                    .Row(node);
            }
        }

        private void AddContent(Guid pageId, Guid regionId, int order, HtmlContent content)
        {
            Insert
                .IntoTable(ContentsTableName)
                .InSchema(RootSchemaName)
                .Row(new
                    {
                        content.Id,
                        content.Version,
                        content.IsDeleted,
                        content.CreatedOn,
                        content.CreatedByUser,
                        content.ModifiedOn,
                        content.ModifiedByUser,
                        content.Name,
                        content.Status,
                        content.PublishedOn,
                        content.PublishedByUser
                    });

            Insert
                .IntoTable(HtmlContentsTableName)
                .InSchema(PagesSchemaName)
                .Row(new
                    {
                        content.Id,
                        content.ActivationDate,
                        content.UseCustomCss,
                        content.UseCustomJs,
                        content.Html,
                        content.EditInSourceMode
                    });

            Insert
                .IntoTable(PageContentsTableName)
                .InSchema(RootSchemaName)
                .Row(new
                    {
                        Id = Guid.NewGuid(),
                        Version = 1,
                        IsDeleted = false,
                        CreatedOn = DateTime.Now,
                        CreatedByUser = demoDataCreationUser,
                        ModifiedOn = DateTime.Now,
                        ModifiedByUser = demoDataCreationUser,
                        PageId = pageId,
                        ContentId = content.Id,
                        RegionId = regionId,
                        Order = order
                    });
        }

        private abstract class BaseModel
        {
            public Guid Id { get; set; }
            public int Version { get; set; }
            public string CreatedByUser { get; set; }
            public DateTime CreatedOn { get; set; }
            public string ModifiedByUser { get; set; }
            public DateTime ModifiedOn { get; set; }
            public bool IsDeleted { get; set; }

            public BaseModel()
            {
                ModifiedByUser = CreatedByUser = demoDataCreationUser;
                ModifiedOn = CreatedOn = DateTime.Now;
                IsDeleted = false;
                Version = 1;
                Id = Guid.NewGuid();
            }
        }

        private class Template : BaseModel
        {
            public string Name { get; set; }
            public string LayoutPath { get; set; }
        }

        private class Region : BaseModel
        {
            public string RegionIdentifier { get; set; }
        }

        private class LayoutRegion : BaseModel
        {
            public string Description { get; set; }
            public Guid LayoutId { get; set; }
            public Guid RegionId { get; set; }
        }

        private class Page : BaseModel
        {
            public string PageUrl { get; set; }
            public string Title { get; set; }
            public Guid LayoutId { get; set; }
            public DateTime PublishedOn { get; set; }
            public string MetaTitle { get; set; }
            public string MetaKeywords { get; set; }
            public string MetaDescription { get; set; }
            public bool IsPublic { get; set; }
            public int Status { get; set; }

            public string Description { get; set; }
            //public Guid ImageId { get; set; }
            public string CanonicalUrl { get; set; }
            public string CustomCss { get; set; }
            public string CustomJS { get; set; }
            public bool UseCanonicalUrl { get; set; }
            public bool UseNoFollow { get; set; }
            public bool UseNoIndex { get; set; }
            //public Guid CategoryId { get; set; }
            public int NodeCountInSitemap { get; set; }

            public Page()
            {
                Status = (int)PageStatus.Published;
                PublishedOn = DateTime.Now;
                IsPublic = true;
                UseCanonicalUrl = false;
                UseNoFollow = false;
                UseNoIndex = false;
                NodeCountInSitemap = 0;
            }
        }

        private class SitemapNode : BaseModel
        {
            public string Title { get; set; }
            public string Url { get; set; }
            public int DisplayOrder { get; set; }
            public Guid? ParentNodeId { get; set; }

            public SitemapNode()
            {
                DisplayOrder = 0;
                ParentNodeId = null;
            }
        }

        private class HtmlContent : BaseModel
        {
            public string Name { get; set; }
            public int Status { get; set; }
            public DateTime PublishedOn { get; set; }
            public string PublishedByUser { get; set; }

            public DateTime ActivationDate { get; set; }
            public bool UseCustomCss { get; set; }
            public bool UseCustomJs { get; set; }
            public string Html { get; set; }
            public bool EditInSourceMode { get; set; }

            public HtmlContent()
            {
                Status = (int)ContentStatus.Published;
                PublishedOn = DateTime.Now;
                PublishedByUser = demoDataCreationUser;

                ActivationDate = DateTime.Now;
                UseCustomCss = false;
                UseCustomJs = false;
                EditInSourceMode = false;
            }
        }
    }
}