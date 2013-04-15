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

        private static class TableNames
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

        private static class Ids
        {
            // Templates
            public static Guid MainPageTemplateId = new Guid("52EFCC37-5583-46D9-AE06-FA15CA84F286");
            public static Guid MainPageTopRegionId = new Guid("F83A3130-3CC8-4FE1-8585-09969BAA9CDE");
            public static Guid MainPageMainRegionId = new Guid("3C7F8C94-A36A-445E-B9BF-04A268619475");
            public static Guid MainPageRightSideRegionId = new Guid("F0E53FDC-AA67-49BE-A295-29D822BDFFB9");

            public static Guid TwoColumnsTemplateId = new Guid("40EFD7C1-18B3-456A-A2F2-3479C8C9960E");
            public static Guid LeftRegionId = new Guid("E79C245D-103E-4517-AACB-3707814C425C");
            public static Guid RightRegionId = new Guid("D0E17CE8-4FB7-45EA-A2C6-F0957EC2E875");

            public static Guid ThreeColumnsTemplateId = new Guid("3621324F-1835-48B4-9E11-CF525B5264A7");
            public static Guid MiddleRegionId = new Guid("06162761-174D-483E-98E2-48366A9B9E4A");

            // Widgets
            public static Guid WidgetSocialId = new Guid("7F393810-3771-48AD-BD02-A9D1A56B267E");

            // Pages
            public static Guid PageHomeId = new Guid("CF320C05-0C22-4512-B68A-F4CE9679C9AD");
            public static Guid PageAboutUsId = new Guid("B26A10C6-DF0C-48C2-8E3F-2798E928DDC0");
            public static Guid PageBlogId = new Guid("7709C3E9-7C4D-46EB-ABA6-58FB2C150918");
        }

        private void CreateTemplates()
        {
            AddTemplate(
                new Template
                    {
                        Id = Ids.MainPageTemplateId,
                        Name = "Main Page Template",
                        LayoutPath = "~/Views/Shared/CmsTemplates/_MainPageTemplate.cshtml"
                    },
                new[]
                    {
                        new Region
                            {
                                Id = Ids.MainPageTopRegionId,
                                RegionIdentifier = "Top"
                            },
                        new Region
                            {
                                Id = Ids.MainPageMainRegionId,
                                RegionIdentifier = "Main"
                            },
                        new Region
                            {
                                Id = Ids.MainPageRightSideRegionId,
                                RegionIdentifier = "RightSide"
                            },
                    });

            AddTemplate(
                new Template
                    {
                        Id = Ids.TwoColumnsTemplateId,
                        Name = "Two Columns Template",
                        LayoutPath = "~/Views/Shared/CmsTemplates/_TwoColumnsTemplate.cshtml"
                    },
                new[]
                    {
                        new Region
                            {
                                Id = Ids.LeftRegionId,
                                RegionIdentifier = "Left"
                            },
                        new Region
                            {
                                Id = Ids.RightRegionId,
                                RegionIdentifier = "Right"
                            },
                    });

            AddTemplate(
                new Template
                    {
                        Id = Ids.ThreeColumnsTemplateId,
                        Name = "Three Columns Template",
                        LayoutPath = "~/Views/Shared/CmsTemplates/_ThreeColumnsTemplate.cshtml"
                    },
                new[]
                    {
                        new Region
                            {
                                Id = Ids.LeftRegionId,
                            },
                        new Region
                            {
                                Id = Ids.MiddleRegionId,
                                RegionIdentifier = "Middle"
                            },
                        new Region
                            {
                                Id = Ids.RightRegionId,
                            },
                    });
        }

        private void CreateHtmlWidgets()
        {
            AddHtmlWidget(new HtmlWidget
                {
                    Id = Ids.WidgetSocialId,
                    Name = "Social Media Links",
                    Html = @"<div class='side-box'> <h2>Find us on</h2> <div class='social-logo clearfix'> <a href='#nolink' class='facebook'>Facebook</a> <a href='#nolink' class='twitter'>Twitter</a> <a href='#nolink' class='linkedin'>LinkedIn</a> </div> <div class='social-logo clearfix'> <a href='#nolink' class='skype'>Skype</a> <a href='#nolink' class='youtube'>YouTube</a> <a href='#nolink' class='flickr'>Flikr</a> </div> </div>"
                });
        }

        private void CreateServerWidgets()
        {
            // TODO
        }

        private void RemoveDefaultRootPage()
        {
            Update
                .Table(TableNames.Pages)
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
            AddMainPage();
            AddAboutUsPage();
            AddBlogPage();
        }

        private void AddMainPage()
        {
            AddPage(new Page
                        {
                            Id = Ids.PageHomeId,
                            LayoutId = Ids.MainPageTemplateId,
                            PageUrl = "/",
                            Title = "Home",
                            Description = "Better CMS main demo page.",
                        },
                    new SitemapNode
                        {
                            Title = "Home",
                            Url = "/"
                        });

            AddContent(Ids.PageHomeId, Ids.MainPageTopRegionId, 0, new HtmlContent
                {
                    Name = "Banner",
                    Html = @"<div class='banner-image'> <div> <hgroup class='banner-text'> <h1>Ut wisi minim veniam</h1> <h2>doming id quod mazim placerat facer possim assum.</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 1' /> </div> <div> <hgroup class='banner-text'> <h1>Esse molestie consequa</h1> <h2>doming id quod mazim placerat facer possim assum.</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 2' /> </div> <div> <hgroup class='banner-text'> <h1>Congue nihil imperdiet</h1> <h2>doming id quod mazim placerat facer possim assum.</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 3' /> </div> <div> <hgroup class='banner-text'> <h1>Ut wisi enim ad minim veniam</h1> <h2>doming id quod mazim placerat facer possim assum. doming id quod mazim placerat facer possim assum</h2> </hgroup> <a href='#nolink' class='btn-primary action-arrow'>Call to Action</a> <img src='/Content/images/sample-78.jpg' alt='Banner 4' /> </div> </div> <div class='banner-nav' id='home-banner'> <a href='#1' class='banner-link link'>Ut wisi enim ad minim veniam</a> <div class='block'> <p> <br /> You've seen it coming! Buy now and get nothing for free! Well, at least no free beer. Perhaps a bear, if you can afford it. </p> </div> <a href='#2' class='banner-link link'>Esse molestie consequa</a> <div class='block'> <p>your bear, you have to admit it! No, we aren't selling bears.</p> </div> <a href='#3' class='banner-link link'>Congue nihil imperdiet</a> <div class='block'> <p>And now, for something completely different. And now, for something completely different. Period.</p> </div> <a href='#4' class='banner-link link'>Ut wisi enim ad minim veniam</a> <div class='block'> <br /> <p>And now, for something completely different. And now.</p> </div> </div> ",
                });

            AddContent(Ids.PageHomeId, Ids.MainPageMainRegionId, 0, new HtmlContent
                {
                    Name = "About Us",
                    Html = @"<h1>About Us</h1><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p><p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis brodi autem vel feugait nulla... <a href='/AboutUs'>Read more About Us</a></p>",
                });

            AddContent(Ids.PageHomeId, Ids.MainPageRightSideRegionId, 0, new HtmlContent
                {
                    Name = "Gallery",
                    Html = @"<h1>Gallery</h1>",
                });
        }

        private void AddAboutUsPage()
        {
            AddPage(new Page
                        {
                            Id = Ids.PageAboutUsId,
                            LayoutId = Ids.ThreeColumnsTemplateId,
                            PageUrl = "/aboutus/",
                            Title = "About Us",
                            Description = "About Us page.",
                        },
                    new SitemapNode
                        {
                            Title = "About Us",
                            Url = "/aboutus/"
                        });

            AddContent(Ids.PageAboutUsId, Ids.LeftRegionId, 0, new HtmlContent
                {
                    Name = "Lorem ipsum",
                    Html = @"<hgroup> <h1>This is an Example of a Sub Head</h1> <h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2> </hgroup> <section class='content-image-1'> <img src='/Content/images/sample-45.jpg' alt='Sample 45'> <div class='info-box'> <h2>Consectetuer adipiscing</h2> <h3>doming id quod mazim placerat facer possim assum.</h3> </div> </section> <article class='content-article'> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> </article> <article class='content-article'> <h2>This is an Example of a Sub Head</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p> </article>",
                });

//            AddContent(Ids.PageAboutUsId, Ids.ThreeColumnsTemplateLeftRegionId, 0, new HtmlContent
//                {
//                    Name = "Lorem ipsum",
//                    Html = @"",
//                });
// TODO: add server widget
//            AddContent(Ids.PageAboutUsId, Ids.ThreeColumnsTemplateRightRegionId, 0, new HtmlContent
//                {
//                    Name = "Lorem ipsum",
//                    Html = @"",
//                });

            AddWidget(Ids.PageAboutUsId, Ids.RightRegionId, 1, Ids.WidgetSocialId);

            AddContent(Ids.PageAboutUsId, Ids.RightRegionId, 2, new HtmlContent
                {
                    Name = "Lorem ipsum",
                    Html = @"<div class='side-box'> <h2>Aside bar</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut <a href='#nolink'>laoreet dolore</a> magna aliquam erat volutpat.</p> <a href='#nolink'>&lt; Read More &gt;</a> </div>",
                });
        }

        private void AddBlogPage()
        {
            AddPage(new Page
                        {
                            Id = Ids.PageBlogId,
                            LayoutId = Ids.TwoColumnsTemplateId,
                            PageUrl = "/blog/",
                            Title = "Blog",
                            Description = "Blog landing page.",
                        },
                    new SitemapNode
                        {
                            Title = "Blog",
                            Url = "/blog/"
                        });

            AddWidget(Ids.PageBlogId, Ids.RightRegionId, 1, Ids.WidgetSocialId);
            AddContent(Ids.PageBlogId, Ids.RightRegionId, 2, new HtmlContent
            {
                Name = "Lorem ipsum",
                Html = @"<div class='side-box'> <h2>Aside bar</h2> <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut <a href='#nolink'>laoreet dolore</a> magna aliquam erat volutpat.</p> <a href='#nolink'>&lt; Read More &gt;</a> </div>",
            });
        }

        #region Infrastructure

        public override void Up()
        {
            CreateTemplates();
            CreateHtmlWidgets();
            CreateServerWidgets();
            RemoveDefaultRootPage();
            CreatePages();
        }

        public override void Down()
        {
            throw new NotImplementedException();
        }

        private void AddTemplate(Template template, IEnumerable<Region> regions)
        {
            Insert
                .IntoTable(TableNames.Layouts)
                .InSchema(RootSchemaName)
                .Row(template);

            foreach (var region in regions)
            {
                if (!string.IsNullOrEmpty(region.RegionIdentifier))
                {

                    Insert
                        .IntoTable(TableNames.Regions)
                        .InSchema(RootSchemaName)
                        .Row(region);
                }

                var layoutRegion = new LayoutRegion
                    {
                        Description = region.RegionIdentifier,
                        LayoutId = template.Id,
                        RegionId = region.Id
                    };

                Insert
                    .IntoTable(TableNames.LayoutRegions)
                    .InSchema(RootSchemaName)
                    .Row(layoutRegion);
            }
        }

        private void AddHtmlWidget(HtmlWidget widget)
        {
            Insert
                .IntoTable(TableNames.Contents)
                .InSchema(RootSchemaName)
                .Row(new
                {
                    widget.Id,
                    widget.Version,
                    widget.IsDeleted,
                    widget.CreatedOn,
                    widget.CreatedByUser,
                    widget.ModifiedOn,
                    widget.ModifiedByUser,
                    widget.Name,
                    widget.Status,
                    widget.PublishedOn,
                    widget.PublishedByUser
                });

            Insert
                .IntoTable(TableNames.Widgets)
                .InSchema(RootSchemaName)
                .Row(new { widget.Id });

            Insert
                .IntoTable(TableNames.HtmlContentWidgets)
                .InSchema(PagesSchemaName)
                .Row(new
                    {
                        widget.Id,
                        widget.UseCustomCss,
                        widget.UseCustomJs,
                        widget.UseHtml,
                        widget.Html,
                        widget.EditInSourceMode
                    });
        }

        private void AddPage(Page page, SitemapNode node = null)
        {
            page.NodeCountInSitemap += node != null ? 1 : 0;

            Insert
                .IntoTable(TableNames.Pages)
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
                .IntoTable(TableNames.Pages)
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
                    .IntoTable(TableNames.SitemapNodes)
                    .InSchema(PagesSchemaName)
                    .Row(node);
            }
        }

        private void AddContent(Guid pageId, Guid regionId, int order, HtmlContent content)
        {
            Insert
                .IntoTable(TableNames.Contents)
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
                .IntoTable(TableNames.HtmlContents)
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
                .IntoTable(TableNames.PageContents)
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

        private void AddWidget(Guid pageId, Guid regionId, int order, Guid widgetId)
        {
            Insert
                .IntoTable(TableNames.PageContents)
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
                    ContentId = widgetId,
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
                MetaTitle = "Ut wisi minim veniam.";
                MetaKeywords = "doming id quod mazim placerat facer possim assum";
                MetaDescription = "doming id quod mazim placerat facer possim assum";
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

        private class HtmlWidget : BaseModel
        {
            public string Name { get; set; }
            public int Status { get; set; }
            public DateTime PublishedOn { get; set; }
            public string PublishedByUser { get; set; }

            public bool UseCustomCss { get; set; }
            public bool UseCustomJs { get; set; }
            public bool UseHtml { get; set; }
            public string Html { get; set; }
            public bool EditInSourceMode { get; set; }

            public HtmlWidget()
            {
                Status = (int)ContentStatus.Published;
                PublishedOn = DateTime.Now;
                PublishedByUser = demoDataCreationUser;

                UseCustomCss = false;
                UseCustomJs = false;
                UseHtml = true;
                EditInSourceMode = false;
            }
        }
        #endregion
    }
}