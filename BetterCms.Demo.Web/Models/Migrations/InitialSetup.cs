using System;
using System.Collections.Generic;
using FluentMigrator;

namespace BetterCms.Demo.Web.Models.Migrations
{
    [Migration(201304110949)]
    public class InitialSetup : Migration
    {
        private const string RootSchemaName = "bcms_root";

        private const string LayoutsTableName = "Layouts";
        private const string RegionsTableName = "Regions";
        private const string LayoutRegionsTableName = "LayoutRegions";

        private static Guid MainPageTemplateId = new Guid("52EFCC37-5583-46D9-AE06-FA15CA84F286");
        private static Guid MainPageTopRegionId = new Guid("F83A3130-3CC8-4FE1-8585-09969BAA9CDE");


        public override void Up()
        {
            CreateTemplates();
//            RemoveDefaultRootPage();
//            CreatePages();
//            CreateSitemap();
//            CreateHtmlWidgets();
//            CreateServerWidgets();
        }

        public override void Down()
        {
            throw new NotImplementedException();
        }

        private void CreateTemplates()
        {
            foreach (var template in GetTemplates())
            {
                Insert
                    .IntoTable(LayoutsTableName)
                    .InSchema(RootSchemaName)
                    .Row(template);
            }

            foreach (var region in GetRegions())
            {
                Insert
                    .IntoTable(RegionsTableName)
                    .InSchema(RootSchemaName)
                    .Row(region);
            }

            foreach (var layoutRegion in GetLayoutRegions())
            {
                Insert
                    .IntoTable(LayoutRegionsTableName)
                    .InSchema(RootSchemaName)
                    .Row(layoutRegion);
            }
        }

        private static IEnumerable<Template> GetTemplates()
        {
            return new List<Template>
                {
                    new Template
                        {
                            Id = MainPageTemplateId,
                            LayoutPath = "~/Views/Shared/CmsTemplates/_MainPageTemplate.cshtml",
                            Name = "Main Page Template"
                        }
                };
        }

        private static IEnumerable<Region> GetRegions()
        {
            return new List<Region>
                {
                    new Region
                        {
                            Id = MainPageTopRegionId,
                            RegionIdentifier = "Top"
                        }
                };
        }

        private static IEnumerable<LayoutRegion> GetLayoutRegions()
        {
            return new List<LayoutRegion>
                {
                    new LayoutRegion
                        {
                            Description = "Top Content",
                            LayoutId = MainPageTemplateId,
                            RegionId = MainPageTopRegionId
                        }
                };
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
    }
}