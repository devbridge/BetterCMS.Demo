using System;
using System.Collections.Generic;
using FluentMigrator;

namespace BetterCms.Demo.Web.Models.Migrations
{
    [Migration(201304110949)]
    public class InitialSetup : Migration
    {
        private enum PageStatus
        {
            Preview = 1,
            Draft = 2,
            Published = 3,
            Unpublished = 4
        }

        private const string RootSchemaName = "bcms_root";
        private const string PagesSchemaName = "bcms_pages";

        private const string LayoutsTableName = "Layouts";
        private const string RegionsTableName = "Regions";
        private const string LayoutRegionsTableName = "LayoutRegions";
        private const string PagesTableName = "Pages";

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
//            CreateSitemap();
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
                        ModifiedByUser = "Admin"
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

        private void AddPage(Page page)
        {
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
                ModifiedByUser = CreatedByUser = "Admin";
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
    }
}