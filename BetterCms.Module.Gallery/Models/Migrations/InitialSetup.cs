using System;
using BetterCms.Core.DataAccess.DataContext.Migrations;
using BetterCms.Core.DataContracts.Enums;
using BetterCms.Core.Models;
using FluentMigrator;

namespace BetterCms.Module.Gallery.Models.Migrations
{
    [Migration(201304110948)]
    public class InitialSetup : DefaultMigration
    {
        public static Guid GalleryWidgetId = new Guid("282BDAC2-E284-40B0-8B16-9CE5AA7DAB56");
        public static Guid AlbumWidgetId = new Guid("26BC6D8A-4826-41DF-B717-2B0FEB014912");

        public const string UpdatedBy = "Admin";
        public readonly DateTime UpdatedOn = DateTime.Now;

        public const string RootSchema = "bcms_root";
        public const string PagesSchema = "bcms_pages";
        public const string ContentsTable = "Contents";
        public const string WidgetsTable = "Widgets";
        public const string ServerControlWidgetsTable = "ServerControlWidgets";

        private readonly string mediaManagerSchemaName;

        public InitialSetup() : base(GalleryModuleDescriptor.ModuleName)
        {
            mediaManagerSchemaName = (new MediaManager.Models.Migrations.MediaManagerVersionTableMetaData()).SchemaName;
        }

        public override void Up()
        {
            CreateAlbumsTable();
            AddWidget("Gallery Widget", "~/Areas/bcms-gallery/Views/Shared/Widgets/GalleryWidget.cshtml");
        }

        public override void Down()
        {
            RemoveAlbumsTable();
        }

        private void CreateAlbumsTable()
        {
            Create
               .Table("Albums")
               .InSchema(SchemaName)

               .WithCmsBaseColumns()

               .WithColumn("Title").AsString(MaxLength.Name).NotNullable()
               .WithColumn("Date").AsDate().Nullable()
               .WithColumn("ImageId").AsGuid().Nullable()
               .WithColumn("FolderId").AsGuid().NotNullable();

            Create.ForeignKey("FK_Cms_Albums_ImageId_MediaImages_Id")
               .FromTable("Albums").InSchema(SchemaName).ForeignColumn("ImageId")
               .ToTable("MediaImages").InSchema(mediaManagerSchemaName).PrimaryColumn("Id");

            Create.ForeignKey("FK_Cms_Albums_FolderId_MediaFolders_Id")
               .FromTable("Albums").InSchema(SchemaName).ForeignColumn("FolderId")
               .ToTable("MediaFolders").InSchema(mediaManagerSchemaName).PrimaryColumn("Id");
        }

        private void RemoveAlbumsTable()
        {
            Delete.ForeignKey("FK_Cms_Albums_FolderId_MediaFolders_Id").OnTable("Albums").InSchema(SchemaName);
            Delete.ForeignKey("FK_Cms_Albums_ImageId_MediaImages_Id").OnTable("Albums").InSchema(SchemaName);
            Delete.Table("Albums").InSchema(SchemaName);
        }


        private void AddWidget(string name, string url)
        {
            Insert
                .IntoTable(ContentsTable)
                .InSchema(RootSchema)
                .Row(new
                {
                    Version = 1,
                    IsDeleted = false,
                    CreatedOn = UpdatedOn,
                    CreatedByUser = UpdatedBy,
                    ModifiedOn = UpdatedOn,
                    ModifiedByUser = UpdatedBy,

                    Id = GalleryWidgetId,
                    Name = name,
                    Status = (int)ContentStatus.Published,
                    PublishedOn = UpdatedOn,
                    PublishedByUser = UpdatedBy
                });

            Insert
                .IntoTable(WidgetsTable)
                .InSchema(RootSchema)
                .Row(new { Id = GalleryWidgetId });

            Insert
                .IntoTable(ServerControlWidgetsTable)
                .InSchema(PagesSchema)
                .Row(new
                {
                    Id = GalleryWidgetId,
                    Url = url,
                });
        }
    }
}