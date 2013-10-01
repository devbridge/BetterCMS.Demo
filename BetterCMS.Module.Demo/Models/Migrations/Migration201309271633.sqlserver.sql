-- disable all constraints
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

-- delete better cms installed default data
DECLARE @pageId UNIQUEIDENTIFIER
SELECT @pageId = [Id] FROM [bcms_root].[Pages] WHERE [PageUrl] = N'/'
DELETE [bcms_pages].[HtmlContents]  WHERE [Id] IN (SELECT [Id] FROM [bcms_root].[PageContents] WHERE [PageId] = @pageId)
DELETE [bcms_root].[PageContents] WHERE [PageId] = @pageId
DELETE [bcms_pages].[Pages] WHERE [Id] = @pageId
DELETE [bcms_root].[Pages] WHERE [Id] = @pageId

INSERT [bcms_users].[Users] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [UserName], [FirstName], [LastName], [Email], [Password], [Salt], [ImageId]) VALUES (N'a596da3f-d3e2-48e7-8e80-a23c00dc1784', 1, 0, CAST(0x0000A23C00DC1694 AS DateTime), N'Anonymous', CAST(0x0000A23C00DC1694 AS DateTime), N'Anonymous', NULL, NULL, N'user', N'user', N'user', N'user@user.com', N'MqlHBexw4Z8M7IUlK0Bqi0LkBR4=', N'gnXRLUGt+Pk=', NULL)

INSERT [bcms_users].[UserRoles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RoleId], [UserId]) 
SELECT NEWID(), 1, 0, [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], null, null, [Id], N'a596da3f-d3e2-48e7-8e80-a23c00dc1784' FROM [bcms_users].[Roles]  

INSERT [bcms_media].[MediaFiles] ([Id], [OriginalFileName], [OriginalFileExtension], [FileUri], [PublicUrl], [Size], [IsTemporary], [IsUploaded], [IsCanceled]) VALUES (N'9d6e121f-a5c8-4bd4-a0f6-a245010fc078', N'sample-3.jpg', N'.jpg', N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\76b0ce094175470d8d9bcbd4ef18a1ba\sample-3_1.jpg', N'http://localhost:17432/uploads/image/76b0ce094175470d8d9bcbd4ef18a1ba/sample-3_1.jpg', 15734, 0, 1, 0)
INSERT [bcms_media].[MediaFiles] ([Id], [OriginalFileName], [OriginalFileExtension], [FileUri], [PublicUrl], [Size], [IsTemporary], [IsUploaded], [IsCanceled]) VALUES (N'5c82979d-e3a5-4e71-a89f-a245010fc078', N'sample-2.jpg', N'.jpg', N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\a65fa022168f487c8f11a404152eddb3\sample-2_1.jpg', N'http://localhost:17432/uploads/image/a65fa022168f487c8f11a404152eddb3/sample-2_1.jpg', 13828, 0, 1, 0)
INSERT [bcms_media].[MediaFiles] ([Id], [OriginalFileName], [OriginalFileExtension], [FileUri], [PublicUrl], [Size], [IsTemporary], [IsUploaded], [IsCanceled]) VALUES (N'd4f30c0b-0b3a-414a-bb9f-a245010fc078', N'sample-1.jpg', N'.jpg', N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\81378d1f525c405a8c68533cd801173a\sample-1_1.jpg', N'http://localhost:17432/uploads/image/81378d1f525c405a8c68533cd801173a/sample-1_1.jpg', 11889, 0, 1, 0)

INSERT [bcms_blog].[Authors] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [ImageId]) VALUES (N'e2493e34-0b97-4852-9d9c-a24400c842ef', 1, 0, CAST(0x0000A24400C84204 AS DateTime), N'user', CAST(0x0000A24400C84204 AS DateTime), N'user', NULL, NULL, N'Joe Blogger', NULL)

INSERT [bcms_blog].[BlogPosts] ([Id], [AuthorId], [ActivationDate], [ExpirationDate]) VALUES (N'99614554-e15d-4152-8b3e-a24400fa536e', N'e2493e34-0b97-4852-9d9c-a24400c842ef', CAST(0x0000A24400000000 AS DateTime), NULL)
INSERT [bcms_blog].[BlogPosts] ([Id], [AuthorId], [ActivationDate], [ExpirationDate]) VALUES (N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'e2493e34-0b97-4852-9d9c-a24400c842ef', CAST(0x0000A24400000000 AS DateTime), NULL)
INSERT [bcms_blog].[BlogPosts] ([Id], [AuthorId], [ActivationDate], [ExpirationDate]) VALUES (N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'e2493e34-0b97-4852-9d9c-a24400c842ef', CAST(0x0000A24400000000 AS DateTime), NULL)
INSERT [bcms_blog].[BlogPosts] ([Id], [AuthorId], [ActivationDate], [ExpirationDate]) VALUES (N'e6cb8675-3b56-43e6-b796-a24500b622c5', N'e2493e34-0b97-4852-9d9c-a24400c842ef', CAST(0x0000A24500000000 AS DateTime), NULL)
INSERT [bcms_blog].[BlogPosts] ([Id], [AuthorId], [ActivationDate], [ExpirationDate]) VALUES (N'09bc1567-53b6-404d-a1a0-a24500b69caf', N'e2493e34-0b97-4852-9d9c-a24400c842ef', CAST(0x0000A24500000000 AS DateTime), NULL)
INSERT [bcms_blog].[BlogPosts] ([Id], [AuthorId], [ActivationDate], [ExpirationDate]) VALUES (N'b5d7b574-455a-4401-8df2-a24500b6eb94', N'e2493e34-0b97-4852-9d9c-a24400c842ef', CAST(0x0000A24500000000 AS DateTime), NULL)

INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'06ffe951-4dc7-41bf-9ead-a23d00af3c83', 1, 0, CAST(0x0000A23D00AF3B60 AS DateTime), N'user', CAST(0x0000A23D00AF3B60 AS DateTime), N'user', NULL, NULL, N'Scripts')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'7de1f47e-b13b-4163-bb88-a23d00b4335c', 1, 0, CAST(0x0000A23D00B432DC AS DateTime), N'user', CAST(0x0000A23D00B432DC AS DateTime), N'user', NULL, NULL, N'Content')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'956b26ab-07bc-4079-96f2-a23d00c26bc0', 1, 0, CAST(0x0000A23D00C26AB4 AS DateTime), N'user', CAST(0x0000A23D00C26AB4 AS DateTime), N'user', NULL, NULL, N'MainContent')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'1cfaa40f-c1cb-4487-8e1b-a23d00f77f6f', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'Map')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'3e0b88c8-615f-4ba9-9bea-a23d00f77f6f', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'Social')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'0e1b381f-8383-4d66-a7b9-a23d00f77f6f', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'ContactForm')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'96ae6cde-a97e-4296-ba69-a23d00f77f6f', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'Address')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'6f7e0aa0-faab-4a07-b202-a23d00ff1bcc', 1, 0, CAST(0x0000A23D00FF1B6C AS DateTime), N'user', CAST(0x0000A23D00FF1B6C AS DateTime), N'user', NULL, NULL, N'ContactParts')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'b33fd94a-9c00-4c74-8752-a23e009d447a', 1, 0, CAST(0x0000A23E009D43C4 AS DateTime), N'user', CAST(0x0000A23E009D43C4 AS DateTime), N'user', NULL, NULL, N'Form')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'f71a2724-3c02-47f8-9238-a24300c63b7f', 1, 0, CAST(0x0000A24300C63AE0 AS DateTime), N'user', CAST(0x0000A24300C63AE0 AS DateTime), N'user', NULL, NULL, N'SideBar')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'104e1dbc-bca8-42dc-8dfa-a24300c63b81', 1, 0, CAST(0x0000A24300C63AE0 AS DateTime), N'user', CAST(0x0000A24300C63AE0 AS DateTime), N'user', NULL, NULL, N'BannerMenu')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'5f067800-297d-4414-9561-a24300c63b81', 1, 0, CAST(0x0000A24300C63AE0 AS DateTime), N'user', CAST(0x0000A24300C63AE0 AS DateTime), N'user', NULL, NULL, N'Article')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'0fadcc42-fa9f-40e6-ad53-a24300c63b81', 1, 0, CAST(0x0000A24300C63AE0 AS DateTime), N'user', CAST(0x0000A24300C63AE0 AS DateTime), N'user', NULL, NULL, N'BannerContent')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'3d74a1fe-70e6-415a-af14-a2430122e559', 1, 0, CAST(0x0000A2430122E524 AS DateTime), N'user', CAST(0x0000A2430122E524 AS DateTime), N'user', NULL, NULL, N'Slider')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1, 0, CAST(0x0000A24400C4E834 AS DateTime), N'user', CAST(0x0000A24400C4E834 AS DateTime), N'user', NULL, NULL, N'ColRight')
INSERT [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 1, 0, CAST(0x0000A24501010544 AS DateTime), N'user', CAST(0x0000A24501010544 AS DateTime), N'user', NULL, NULL, N'ColMiddle')

INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'f7546627-8d57-41e5-9dc6-a24400fda692', 1, 0, CAST(0x0000A24400FDA598 AS DateTime), N'user', CAST(0x0000A24400FDA598 AS DateTime), N'user', NULL, NULL, N'99614554-e15d-4152-8b3e-a24400fa536e', N'5cf1cf48-9490-4b13-baaa-a24400d3f2e4')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'08dff32c-f16e-47ad-979d-a24400fda693', 1, 0, CAST(0x0000A24400FDA598 AS DateTime), N'user', CAST(0x0000A24400FDA598 AS DateTime), N'user', NULL, NULL, N'99614554-e15d-4152-8b3e-a24400fa536e', N'959ff449-6e3b-460b-ba42-a24400d3f2e7')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'77b0d6c5-1460-4658-9f34-a24400fda693', 1, 0, CAST(0x0000A24400FDA598 AS DateTime), N'user', CAST(0x0000A24400FDA598 AS DateTime), N'user', NULL, NULL, N'99614554-e15d-4152-8b3e-a24400fa536e', N'e9f0ebe1-6f4c-4e63-87c0-a24400d3f2e8')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'bd0506d1-fcb3-41a3-94fd-a244011c5d3c', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'5cf1cf48-9490-4b13-baaa-a24400d3f2e4')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'5b81e302-538d-449a-b0ba-a244011c5d3d', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'7d65e736-1478-4e93-b26d-a244011c5d3d')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'1363cb60-7d86-41c1-b578-a244011c5d3d', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'e9f0ebe1-6f4c-4e63-87c0-a24400d3f2e8')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'f69cef46-0885-4807-960f-a244011ca308', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'ec6bca8c-af2f-468c-883b-a244011ca308')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'3eb7379b-7fdb-4393-9a60-a244011ca308', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'3e99cc3a-bc4b-48b3-9158-a244011ca308')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'81e464da-6621-4eb4-b385-a244011ca308', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'1f9a6843-e8a7-46b1-980f-a244011ca308')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'93ec7f9f-f2bc-4edf-b730-a24500b622c8', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A24500B62290 AS DateTime), N'user', NULL, NULL, N'e6cb8675-3b56-43e6-b796-a24500b622c5', N'74d91649-a849-4ead-95c4-a24500b622c8')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'a804dfe9-5bb8-4a05-899a-a24500b69cb0', 1, 0, CAST(0x0000A24500B69C70 AS DateTime), N'user', CAST(0x0000A24500B69C70 AS DateTime), N'user', NULL, NULL, N'09bc1567-53b6-404d-a1a0-a24500b69caf', N'a5bd7349-37ac-4cac-8584-a24400d3f2e8')
INSERT [bcms_pages].[PageTags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [TagId]) VALUES (N'4a299202-8842-404f-ae06-a24500b6eb95', 1, 0, CAST(0x0000A24500B6EAF4 AS DateTime), N'user', CAST(0x0000A24500B6EAF4 AS DateTime), N'user', NULL, NULL, N'b5d7b574-455a-4401-8df2-a24500b6eb94', N'e9f0ebe1-6f4c-4e63-87c0-a24400d3f2e8')

INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'5cf1cf48-9490-4b13-baaa-a24400d3f2e4', 1, 0, CAST(0x0000A24400D3F1D0 AS DateTime), N'user', CAST(0x0000A24400D3F1D0 AS DateTime), N'user', NULL, NULL, N'Apps')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'959ff449-6e3b-460b-ba42-a24400d3f2e7', 1, 0, CAST(0x0000A24400D3F1D0 AS DateTime), N'user', CAST(0x0000A24400D3F1D0 AS DateTime), N'user', NULL, NULL, N'IOS')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'a5bd7349-37ac-4cac-8584-a24400d3f2e8', 1, 0, CAST(0x0000A24400D3F1D0 AS DateTime), N'user', CAST(0x0000A24400D3F1D0 AS DateTime), N'user', NULL, NULL, N'Research')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'e9f0ebe1-6f4c-4e63-87c0-a24400d3f2e8', 1, 0, CAST(0x0000A24400D3F1D0 AS DateTime), N'user', CAST(0x0000A24400D3F1D0 AS DateTime), N'user', NULL, NULL, N'Mobile')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'd743e3a4-39ed-49f8-a5b7-a24400d3f2e9', 1, 0, CAST(0x0000A24400D3F1D0 AS DateTime), N'user', CAST(0x0000A24400D3F1D0 AS DateTime), N'user', NULL, NULL, N'Technology')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'7d65e736-1478-4e93-b26d-a244011c5d3d', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'Android')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'ec6bca8c-af2f-468c-883b-a244011ca308', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'Linux')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'3e99cc3a-bc4b-48b3-9158-a244011ca308', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'OS')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'1f9a6843-e8a7-46b1-980f-a244011ca308', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'OpenSource')
INSERT [bcms_root].[Tags] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'74d91649-a849-4ead-95c4-a24500b622c8', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A24500B62290 AS DateTime), N'user', NULL, NULL, N'Business')

INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'EFDA86C6-3ED4-481E-A377-127489D7DF91', 1, 0, CAST(0x0000A2420115C1DC AS DateTime), N'user', CAST(0x0000A24501015878 AS DateTime), N'user', NULL, NULL, N'Gallery', N'/gallery/', 4, NULL)
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'1e50aede-c5db-442d-896e-a2420115c221', 1, 0, CAST(0x0000A2420115C1DC AS DateTime), N'user', CAST(0x0000A24501015878 AS DateTime), N'user', NULL, NULL, N'Contacts', N'/contacts/', 5, NULL)
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'5a6c8b41-08bb-4799-beac-a24300b9dda9', 1, 0, CAST(0x0000A24300B9DDA4 AS DateTime), N'user', CAST(0x0000A24300B9DDA4 AS DateTime), N'user', NULL, NULL, N'Home', N'/', 0, NULL)
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'1617c673-3747-4fa6-96c5-a2440112387f', 1, 0, CAST(0x0000A24401123800 AS DateTime), N'user', CAST(0x0000A24501015878 AS DateTime), N'user', NULL, NULL, N'Blog', N'/blog/', 3, NULL)
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'06407f6c-3f70-4628-b5ce-a24500e82289', 1, 0, CAST(0x0000A24500E821C8 AS DateTime), N'user', CAST(0x0000A24501015878 AS DateTime), N'user', NULL, NULL, N'News', N'/news/', 2, NULL)
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'73db7f89-6658-4263-9756-a24500ebd97b', 1, 0, CAST(0x0000A24500EBD958 AS DateTime), N'user', CAST(0x0000A24500ED08DC AS DateTime), N'user', NULL, NULL, N'Business', N'/news/business/', 0, N'06407f6c-3f70-4628-b5ce-a24500e82289')
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'f3e6f6c4-b860-4e26-b0b3-a24500ede78d', 1, 0, CAST(0x0000A24500EDE784 AS DateTime), N'user', CAST(0x0000A24500EDE784 AS DateTime), N'user', NULL, NULL, N'Technology', N'/news/technology/', 1, N'06407f6c-3f70-4628-b5ce-a24500e82289')
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'2132c3a3-a111-4863-bd8e-a2450101594f', 1, 0, CAST(0x0000A24501015878 AS DateTime), N'user', CAST(0x0000A24501015878 AS DateTime), N'user', NULL, NULL, N'About Us', N'/about-us/', 1, NULL)
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'212e90e3-9149-495b-9e28-a2450110b270', 1, 0, CAST(0x0000A2450110B1C4 AS DateTime), N'user', CAST(0x0000A2450110B1C4 AS DateTime), N'user', NULL, NULL, N'Business', N'/about-us/business/', 0, N'2132c3a3-a111-4863-bd8e-a2450101594f')
INSERT [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId]) VALUES (N'42b50cfe-5901-4e15-8b77-a2450110fa54', 1, 0, CAST(0x0000A2450110F940 AS DateTime), N'user', CAST(0x0000A2450110F940 AS DateTime), N'user', NULL, NULL, N'Research', N'/about-us/research/', 1, N'2132c3a3-a111-4863-bd8e-a2450101594f')

INSERT [bcms_media].[Medias] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [FolderId], [Title], [Type], [ContentType], [IsArchived], [OriginalId], [PublishedOn], [ImageId], [Description]) VALUES (N'9d6e121f-a5c8-4bd4-a0f6-a245010fc078', 1, 0, CAST(0x0000A245010FC05C AS DateTime), N'user', CAST(0x0000A245010FD31C AS DateTime), N'user', NULL, NULL, NULL, N'sample-3.jpg', 1, 1, 0, NULL, CAST(0x0000A245010FD31C AS DateTime), NULL, NULL)
INSERT [bcms_media].[Medias] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [FolderId], [Title], [Type], [ContentType], [IsArchived], [OriginalId], [PublishedOn], [ImageId], [Description]) VALUES (N'5c82979d-e3a5-4e71-a89f-a245010fc078', 1, 0, CAST(0x0000A245010FC05C AS DateTime), N'user', CAST(0x0000A245010FD31C AS DateTime), N'user', NULL, NULL, NULL, N'sample-2.jpg', 1, 1, 0, NULL, CAST(0x0000A245010FD31C AS DateTime), NULL, NULL)
INSERT [bcms_media].[Medias] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [FolderId], [Title], [Type], [ContentType], [IsArchived], [OriginalId], [PublishedOn], [ImageId], [Description]) VALUES (N'd4f30c0b-0b3a-414a-bb9f-a245010fc078', 1, 0, CAST(0x0000A245010FC05C AS DateTime), N'user', CAST(0x0000A245010FD31C AS DateTime), N'user', NULL, NULL, NULL, N'sample-1.jpg', 1, 1, 0, NULL, CAST(0x0000A245010FD31C AS DateTime), NULL, NULL)

INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'8677d6f4-5ff4-4c1f-919d-a23d00c7a288', 1, 0, CAST(0x0000A23D00C7A178 AS DateTime), N'user', CAST(0x0000A23D00CB5C8C AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'aeeda51b-b7c6-4658-b2fa-a23d00c7a288', 1, 0, CAST(0x0000A23D00C7A178 AS DateTime), N'user', CAST(0x0000A23D00C7A178 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'f7de75fb-4a64-43c4-a4ec-a243011d0afe', 1, 0, CAST(0x0000A243011D0A50 AS DateTime), N'user', CAST(0x0000A243011D0A50 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'8a7ce198-93d3-4edc-8dd1-a243011d0aff', 1, 0, CAST(0x0000A243011D0A50 AS DateTime), N'user', CAST(0x0000A243011D0A50 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'18d3cdbb-f4f0-4a02-a1a1-a24400fa5370', 1, 0, CAST(0x0000A24400FA52D0 AS DateTime), N'user', CAST(0x0000A24400FA52D0 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'4e8b0830-8703-4f20-b31b-a24400fa5370', 1, 0, CAST(0x0000A24400FA52D0 AS DateTime), N'user', CAST(0x0000A24400FA52D0 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'a83283ea-6a3b-4e70-add7-a24401121f7c', 1, 0, CAST(0x0000A24401121F64 AS DateTime), N'user', CAST(0x0000A24401121F64 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'cbd337e2-6a29-4bd4-aeb7-a24401121f7c', 1, 0, CAST(0x0000A24401121F64 AS DateTime), N'user', CAST(0x0000A24401121F64 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'36b4c61c-9aed-4e1a-9b58-a244011c5d30', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'80b3cb66-359b-4089-b846-a244011c5d30', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'aa7e6789-9237-4aea-9538-a244011ca304', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'8ed92f55-595a-45ca-889c-a244011ca305', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'1d08f183-42d6-47f2-81b8-a24500b622c5', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A24500B62290 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'f3b4c13a-c1ae-4a95-9fad-a24500b622c5', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A24500B62290 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'f021987a-0f26-4242-8208-a24500b69caf', 1, 0, CAST(0x0000A24500B69C70 AS DateTime), N'user', CAST(0x0000A24500B69C70 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'd0cb2577-0a6d-4d1d-8582-a24500b69caf', 1, 0, CAST(0x0000A24500B69C70 AS DateTime), N'user', CAST(0x0000A24500B69C70 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'c511ab72-995c-4439-8350-a24500b6eb94', 1, 0, CAST(0x0000A24500B6EAF4 AS DateTime), N'user', CAST(0x0000A24500B6EAF4 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'8a9f49ae-3fd8-4598-a751-a24500b6eb94', 1, 0, CAST(0x0000A24500B6EAF4 AS DateTime), N'user', CAST(0x0000A24500B6EAF4 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'64459cf2-500b-41e6-8ca7-a24500e7eab2', 1, 0, CAST(0x0000A24500E7E988 AS DateTime), N'user', CAST(0x0000A24500E7E988 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'796fb6a2-122a-40fd-a385-a24500e7eab3', 1, 0, CAST(0x0000A24500E7E988 AS DateTime), N'user', CAST(0x0000A24500E7E988 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'0e68525f-3df8-4833-a213-a24500ebcd64', 1, 0, CAST(0x0000A24500EBCC74 AS DateTime), N'user', CAST(0x0000A24500EBCC74 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'3f2ce764-6135-42e4-b333-a24500ebcd64', 1, 0, CAST(0x0000A24500EBCC74 AS DateTime), N'user', CAST(0x0000A24500EBCC74 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'8446225d-fe6a-4556-83a8-a24500edd4a1', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'6cd0765c-7e5b-4cd8-ac00-a24500edd4a1', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'd3dff254-8fe6-49a7-bbcf-a2450101437d', 1, 0, CAST(0x0000A24501014360 AS DateTime), N'user', CAST(0x0000A24501014360 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'f48762b1-46b0-45b0-be1f-a2450101437d', 1, 0, CAST(0x0000A24501014360 AS DateTime), N'user', CAST(0x0000A24501014360 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'76862ca7-e378-4702-af00-a2450110a709', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'a7e7a1d4-54ad-4cd9-af86-a2450110a709', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'fd27b36a-bea3-4516-802f-a2450110e9eb', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'Everyone', 2, 1)
INSERT [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'2a7cda16-4a5e-40ea-9dfa-a2450110e9eb', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'Authenticated Users', 3, 1)

INSERT [bcms_root].[Categories] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'00e8626b-d466-49f8-a6c2-a24500b3ca63', 1, 0, CAST(0x0000A24500B3C964 AS DateTime), N'user', CAST(0x0000A24500B3D51C AS DateTime), N'user', NULL, NULL, N'Technology')
INSERT [bcms_root].[Categories] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'9709d189-0c1c-4369-9ec4-a24500b42b23', 1, 0, CAST(0x0000A24500B42AA8 AS DateTime), N'user', CAST(0x0000A24500B42AA8 AS DateTime), N'user', NULL, NULL, N'Business')
INSERT [bcms_root].[Categories] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'00df0c2c-97b4-482a-940a-a24500b44302', 1, 0, CAST(0x0000A24500B44218 AS DateTime), N'user', CAST(0x0000A24500B44218 AS DateTime), N'user', NULL, NULL, N'Research')
INSERT [bcms_root].[Categories] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name]) VALUES (N'c4c42103-e280-4e11-8b43-a24500b4593a', 1, 0, CAST(0x0000A24500B4585C AS DateTime), N'user', CAST(0x0000A24500B4585C AS DateTime), N'user', NULL, NULL, N'Mobile')

INSERT [bcms_media].[MediaImages] ([Id], [Caption], [ImageAlign], [Width], [Height], [CropCoordX1], [CropCoordY1], [CropCoordX2], [CropCoordY2], [OriginalWidth], [OriginalHeight], [OriginalSize], [OriginalUri], [PublicOriginallUrl], [IsOriginalUploaded], [ThumbnailWidth], [ThumbnailHeight], [ThumbnailSize], [ThumbnailUri], [PublicThumbnailUrl], [IsThumbnailUploaded]) VALUES (N'9d6e121f-a5c8-4bd4-a0f6-a245010fc078', NULL, NULL, 220, 100, NULL, NULL, NULL, NULL, 220, 100, 15734, N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\76b0ce094175470d8d9bcbd4ef18a1ba\o_sample-3.jpg', N'http://localhost:17432/uploads/image/76b0ce094175470d8d9bcbd4ef18a1ba/o_sample-3.jpg', 1, 150, 150, 66275, N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\76b0ce094175470d8d9bcbd4ef18a1ba\t_sample-3_1.png', N'http://localhost:17432/uploads/image/76b0ce094175470d8d9bcbd4ef18a1ba/t_sample-3_1.png', 1)
INSERT [bcms_media].[MediaImages] ([Id], [Caption], [ImageAlign], [Width], [Height], [CropCoordX1], [CropCoordY1], [CropCoordX2], [CropCoordY2], [OriginalWidth], [OriginalHeight], [OriginalSize], [OriginalUri], [PublicOriginallUrl], [IsOriginalUploaded], [ThumbnailWidth], [ThumbnailHeight], [ThumbnailSize], [ThumbnailUri], [PublicThumbnailUrl], [IsThumbnailUploaded]) VALUES (N'5c82979d-e3a5-4e71-a89f-a245010fc078', NULL, NULL, 220, 100, NULL, NULL, NULL, NULL, 220, 100, 13828, N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\a65fa022168f487c8f11a404152eddb3\o_sample-2.jpg', N'http://localhost:17432/uploads/image/a65fa022168f487c8f11a404152eddb3/o_sample-2.jpg', 1, 150, 150, 71632, N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\a65fa022168f487c8f11a404152eddb3\t_sample-2_1.png', N'http://localhost:17432/uploads/image/a65fa022168f487c8f11a404152eddb3/t_sample-2_1.png', 1)
INSERT [bcms_media].[MediaImages] ([Id], [Caption], [ImageAlign], [Width], [Height], [CropCoordX1], [CropCoordY1], [CropCoordX2], [CropCoordY2], [OriginalWidth], [OriginalHeight], [OriginalSize], [OriginalUri], [PublicOriginallUrl], [IsOriginalUploaded], [ThumbnailWidth], [ThumbnailHeight], [ThumbnailSize], [ThumbnailUri], [PublicThumbnailUrl], [IsThumbnailUploaded]) VALUES (N'd4f30c0b-0b3a-414a-bb9f-a245010fc078', NULL, NULL, 220, 100, NULL, NULL, NULL, NULL, 220, 100, 11889, N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\81378d1f525c405a8c68533cd801173a\o_sample-1.jpg', N'http://localhost:17432/uploads/image/81378d1f525c405a8c68533cd801173a/o_sample-1.jpg', 1, 150, 150, 60541, N'C:\dev\DevBridge\BetterCMS.Demo\BetterCms.Demo.Web\uploads\image\81378d1f525c405a8c68533cd801173a\t_sample-1_1.png', N'http://localhost:17432/uploads/image/81378d1f525c405a8c68533cd801173a/t_sample-1_1.png', 1)

INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'453f0187-c653-4e7e-80ff-a23d00af3c87', 1, 0, CAST(0x0000A23D00AF3B60 AS DateTime), N'user', CAST(0x0000A23D00AF3B60 AS DateTime), N'user', NULL, NULL, N'Light_BcmsLightLayout', N'~/Views/Shared/Layouts/Light/_BcmsLightLayout.cshtml', NULL, NULL)
INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'5c4ffb26-746c-4d99-bf74-a23d00af62e5', 1, 0, CAST(0x0000A23D00AF620C AS DateTime), N'user', CAST(0x0000A23D00AF620C AS DateTime), N'user', NULL, NULL, N'Light_BcmsOneCol', N'~/Views/Shared/Layouts/Light/_BcmsOneCol.cshtml', NULL, NULL)
INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'64ae7880-5bff-4428-a328-a23d00f77f6d', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'Contacts', N'~/Views/Shared/Layouts/Light/_Contacts.cshtml', NULL, NULL)
INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'40f9cf2b-87b9-4cee-b106-a24300c63b82', 1, 0, CAST(0x0000A24300C63AE0 AS DateTime), N'user', CAST(0x0000A24300C654A8 AS DateTime), N'user', NULL, NULL, N'Home', N'~/Views/Shared/Layouts/Light/_Home.cshtml', NULL, NULL)
INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'99148340-e59f-43c5-ae09-a24400c4e88f', 1, 0, CAST(0x0000A24400C4E834 AS DateTime), N'user', CAST(0x0000A24400CF0030 AS DateTime), N'user', NULL, NULL, N'Light_BcmsTwoCol', N'~/Views/Shared/Layouts/Light/_BcmsTwoCol.cshtml', NULL, NULL)
INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', 1, 0, CAST(0x0000A24400F95A60 AS DateTime), N'user', CAST(0x0000A24400F95A60 AS DateTime), N'user', NULL, NULL, N'BlogPost', N'~/Views/Shared/Layouts/Light/_BlogPost.cshtml', NULL, NULL)
INSERT [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'eeb19260-3de2-4baa-891d-a24501010636', 1, 0, CAST(0x0000A24501010544 AS DateTime), N'user', CAST(0x0000A24501010544 AS DateTime), N'user', NULL, NULL, N'Light_BcmsThreeCol', N'~/Views/Shared/Layouts/Light/_BcmsThreeCol.cshtml', NULL, NULL)

INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'539da9fb-4deb-40a8-b7ce-a23e009ed3fa', 1, 0, CAST(0x0000A23E009ED360 AS DateTime), N'user', CAST(0x0000A23E009ED360 AS DateTime), N'user', NULL, NULL, N'Address', NULL, 3, CAST(0x0000A23E009ED360 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'a44ee27c-d1eb-4bba-ae62-a23e009f7fc4', 1, 0, CAST(0x0000A23E009F7FA4 AS DateTime), N'user', CAST(0x0000A23F011B9224 AS DateTime), N'user', NULL, NULL, N'Map', NULL, 3, CAST(0x0000A23F011B9224 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'2314c731-db26-4eb8-8bcf-a23e00b46be3', 1, 0, CAST(0x0000A23E00B46B1C AS DateTime), N'user', CAST(0x0000A2440123822C AS DateTime), N'user', NULL, NULL, N'SocialWidget', NULL, 3, CAST(0x0000A2440123822C AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'f18d4579-2517-41cd-9c5a-a23e01143b06', 1, 0, CAST(0x0000A23E01143A74 AS DateTime), N'user', CAST(0x0000A23E012A4E68 AS DateTime), N'user', NULL, NULL, N'ContactFormWidget', NULL, 3, CAST(0x0000A23E012A4E68 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'5190f6fe-8b06-44fc-b089-a24300cc6b17', 1, 0, CAST(0x0000A24300CC6A14 AS DateTime), N'user', CAST(0x0000A24300FCA4F4 AS DateTime), N'user', NULL, NULL, N'1', NULL, 3, CAST(0x0000A24300FCA4F4 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'ff7fd016-7041-431e-b435-a24300cd6328', 1, 0, CAST(0x0000A24300CD6284 AS DateTime), N'user', CAST(0x0000A24300FCE568 AS DateTime), N'user', NULL, NULL, N'1', NULL, 3, CAST(0x0000A24300FCE568 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'bcc8b55b-cd31-4783-9df6-a24301231df3', 1, 0, CAST(0x0000A24301231D64 AS DateTime), N'user', CAST(0x0000A2430125F520 AS DateTime), N'user', NULL, NULL, N'Slider', NULL, 3, CAST(0x0000A2430125F520 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'51c175cc-7d5e-45c4-be67-a24301266d95', 1, 0, CAST(0x0000A24301266CA8 AS DateTime), N'user', CAST(0x0000A245011A34EC AS DateTime), N'user', NULL, NULL, N'Article', NULL, 3, CAST(0x0000A245011A34EC AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'896b6b17-22bd-4844-a66c-a2430126988d', 1, 0, CAST(0x0000A24301269804 AS DateTime), N'user', CAST(0x0000A24301269804 AS DateTime), N'user', NULL, NULL, N'SideBar', NULL, 3, CAST(0x0000A24301269804 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'e76a4678-ecbd-4635-9ac9-a24400c94548', 1, 0, CAST(0x0000A24400C94500 AS DateTime), N'user', CAST(0x0000A24400F2A918 AS DateTime), N'user', NULL, NULL, N'This is an Example of a Blog Post', NULL, 3, CAST(0x0000A24400F2A918 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'e838e63d-9b12-46e5-8b37-a24400cdac52', 1, 0, CAST(0x0000A24400CDAB2C AS DateTime), N'user', CAST(0x0000A24400CDAB2C AS DateTime), N'user', NULL, NULL, N'dfsfdsf', NULL, 3, CAST(0x0000A24400CDAB2C AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'c73ccc96-e4ae-4a44-8bfe-a24400fa536c', 1, 0, CAST(0x0000A24400FA52D0 AS DateTime), N'user', CAST(0x0000A24501101264 AS DateTime), N'user', NULL, NULL, N'This is an Example of a Blog Post', NULL, 3, CAST(0x0000A24501101264 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'1fb8b25a-26f8-4e55-a4c8-a244011a88f2', 1, 0, CAST(0x0000A244011A8820 AS DateTime), N'user', CAST(0x0000A244011A8820 AS DateTime), N'user', NULL, NULL, N'LatestBlogPostsWdiget', NULL, 3, CAST(0x0000A244011A8820 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'af326b53-1339-4136-b8c0-a244011c5d2c', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A24501100328 AS DateTime), N'user', NULL, NULL, N'This is a second example of a Blog Post', NULL, 3, CAST(0x0000A24501100328 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'072f4ae4-9b64-4176-8f15-a244011ca304', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A24501100A30 AS DateTime), N'user', NULL, NULL, N'This is a third example of a Blog Post', NULL, 3, CAST(0x0000A24501100A30 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'f6957b61-6a09-4926-a53a-a24401275f33', 1, 0, CAST(0x0000A24401275E10 AS DateTime), N'user', CAST(0x0000A24401275E10 AS DateTime), N'user', NULL, NULL, N'LastBlogPostWidget', NULL, 3, CAST(0x0000A24401275E10 AS DateTime), N'user', NULL)
GO
print 'Processed 100 total records'
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'462c89e4-1ed9-4e37-b3b1-a24500b622c5', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A245010FEA8C AS DateTime), N'user', NULL, NULL, N'Business post example', NULL, 3, CAST(0x0000A245010FEA8C AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'94163a66-1f43-4d7d-8156-a24500b69caf', 1, 0, CAST(0x0000A24500B69C70 AS DateTime), N'user', CAST(0x0000A245010FFAF4 AS DateTime), N'user', NULL, NULL, N'Research post', NULL, 3, CAST(0x0000A245010FFAF4 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'7ec1762a-e6ee-4ff2-b77c-a24500b6eb94', 1, 0, CAST(0x0000A24500B6EAF4 AS DateTime), N'user', CAST(0x0000A245010FF3EC AS DateTime), N'user', NULL, NULL, N'Mobile post', NULL, 3, CAST(0x0000A245010FF3EC AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'1dc2764a-53a6-47d7-b60f-a24500be46b0', 1, 0, CAST(0x0000A24500BE4628 AS DateTime), N'user', CAST(0x0000A24500BE4628 AS DateTime), N'user', NULL, NULL, N'CategoriesMenuWdiget', NULL, 3, CAST(0x0000A24500BE4628 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'c6315c08-038c-4bb1-b1a6-a24500e9b94b', 1, 0, CAST(0x0000A24500E9B86C AS DateTime), N'user', CAST(0x0000A24500E9B86C AS DateTime), N'user', NULL, NULL, N'Content', NULL, 3, CAST(0x0000A24500E9B86C AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'a2a7e409-7c56-412b-9cd9-a24500ed8d6d', 1, 0, CAST(0x0000A24500ED8D48 AS DateTime), N'user', CAST(0x0000A24500ED8D48 AS DateTime), N'user', NULL, NULL, N'Content', NULL, 3, CAST(0x0000A24500ED8D48 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'ed4ac7a4-0651-40f6-b41e-a24500edd4a6', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500FE9A84 AS DateTime), N'user', NULL, NULL, N'Content', NULL, 3, CAST(0x0000A24500FE9A84 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'e20326de-50c9-46df-b118-a24500fb10bb', 1, 0, CAST(0x0000A24500FB10A8 AS DateTime), N'user', CAST(0x0000A245011820E4 AS DateTime), N'user', NULL, NULL, N'SubMenuWidget', NULL, 3, CAST(0x0000A245011820E4 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'636a7d67-1dfa-4387-9e0a-a24501020e4d', 1, 0, CAST(0x0000A24501020E1C AS DateTime), N'user', CAST(0x0000A2450119B530 AS DateTime), N'user', NULL, NULL, N'Content', NULL, 3, CAST(0x0000A2450119B530 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'7d2eba20-8133-43ec-9c09-a245010c13cb', 1, 0, CAST(0x0000A245010C1358 AS DateTime), N'user', CAST(0x0000A245010C1358 AS DateTime), N'user', NULL, NULL, N'Header', NULL, 3, CAST(0x0000A245010C1358 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'4d8bed4f-8eca-40c7-9485-a245010cff03', 1, 0, CAST(0x0000A245010CFEE4 AS DateTime), N'user', CAST(0x0000A245010CFEE4 AS DateTime), N'user', NULL, NULL, N'BlogFeedWidget', NULL, 3, CAST(0x0000A245010CFEE4 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'413fa6be-f765-4bd1-92c6-a2450110a70d', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A245011975E8 AS DateTime), N'user', NULL, NULL, N'Content', NULL, 3, CAST(0x0000A245011975E8 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'9bfd80ed-ff09-4d1a-9826-a2450110a70e', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'Header', NULL, 3, CAST(0x0000A245010C1358 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'c6175ed7-0deb-4de0-a37b-a2450110e9ee', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A24501199C94 AS DateTime), N'user', NULL, NULL, N'Content', NULL, 3, CAST(0x0000A24501199C94 AS DateTime), N'user', NULL)
INSERT [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'0322541f-75c6-4b5f-ad0e-a2450110e9ef', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'Header', NULL, 3, CAST(0x0000A245010C1358 AS DateTime), N'user', NULL)

INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'596fd4bf-0272-442a-8978-a23d00c7a284', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'99614554-e15d-4152-8b3e-a24400fa536e', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.
', N'9d6e121f-a5c8-4bd4-a0f6-a245010fc078', NULL, NULL, 0, 0, 0, N'00e8626b-d466-49f8-a6c2-a24500b3ca63', 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'205fea1c-7393-431f-a839-a24401121f75', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.
', N'd4f30c0b-0b3a-414a-bb9f-a245010fc078', NULL, NULL, 1, 0, 0, N'00e8626b-d466-49f8-a6c2-a24500b3ca63', 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.
', N'5c82979d-e3a5-4e71-a89f-a245010fc078', NULL, NULL, 1, 0, 0, N'00e8626b-d466-49f8-a6c2-a24500b3ca63', 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'e6cb8675-3b56-43e6-b796-a24500b622c5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'd4f30c0b-0b3a-414a-bb9f-a245010fc078', NULL, NULL, 1, 0, 0, N'9709d189-0c1c-4369-9ec4-a24500b42b23', 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'09bc1567-53b6-404d-a1a0-a24500b69caf', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'9d6e121f-a5c8-4bd4-a0f6-a245010fc078', NULL, NULL, 1, 0, 0, N'00df0c2c-97b4-482a-940a-a24500b44302', 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'b5d7b574-455a-4401-8df2-a24500b6eb94', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', N'5c82979d-e3a5-4e71-a89f-a245010fc078', NULL, NULL, 1, 0, 0, N'c4c42103-e280-4e11-8b43-a24500b4593a', 0, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'a945c239-2b71-4070-ac8e-a24500ebcd64', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'707e0036-f8eb-40c4-9355-a24500edd4a1', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'01797d10-e029-4474-90c1-a2450110a709', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)
INSERT [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [NodeCountInSitemap], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'd1562284-ce3f-4297-a327-a2450110e9eb', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 1, NULL, NULL, 0)

INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'596fd4bf-0272-442a-8978-a23d00c7a284', 1, 0, CAST(0x0000A23D00C7A178 AS DateTime), N'user', CAST(0x0000A2420115C1DC AS DateTime), N'user', NULL, NULL, N'/contacts/', N'Contacts', N'64ae7880-5bff-4428-a328-a23d00f77f6d', CAST(0x0000A23D00F79284 AS DateTime), N'Contacts', NULL, NULL, 3, N'/contacts')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', 1, 0, CAST(0x0000A243011D0A50 AS DateTime), N'user', CAST(0x0000A243011D1F68 AS DateTime), N'user', NULL, NULL, N'/', N'Home', N'40f9cf2b-87b9-4cee-b106-a24300c63b82', CAST(0x0000A243011D1F68 AS DateTime), N'Home', NULL, NULL, 3, N'/')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'99614554-e15d-4152-8b3e-a24400fa536e', 1, 0, CAST(0x0000A24400FA52D0 AS DateTime), N'user', CAST(0x0000A24501101264 AS DateTime), N'user', NULL, NULL, N'/articles/this-is-an-example-of-a-blog-post/', N'This is an Example of a Blog Post', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', CAST(0x0000A24501101264 AS DateTime), N'This is an Example of a Blog Post', NULL, NULL, 3, N'/articles/this-is-an-example-of-a-blog-post')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'205fea1c-7393-431f-a839-a24401121f75', 1, 0, CAST(0x0000A24401121F64 AS DateTime), N'user', CAST(0x0000A24401126CBC AS DateTime), N'user', NULL, NULL, N'/blog/', N'Blog', N'99148340-e59f-43c5-ae09-a24400c4e88f', CAST(0x0000A24401126CBC AS DateTime), N'Blog', NULL, NULL, 3, N'/blog')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A24501100328 AS DateTime), N'user', NULL, NULL, N'/articles/this-is-second-example-of-a-blog-post/', N'This is a second example of a Blog Post', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', CAST(0x0000A24501100328 AS DateTime), N'This is second example of a Blog Post', NULL, NULL, 3, N'/articles/this-is-second-example-of-a-blog-post')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A24501100A30 AS DateTime), N'user', NULL, NULL, N'/articles/this-is-third-example-of-a-blog-post/', N'This is a third example of a Blog Post', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', CAST(0x0000A24501100A30 AS DateTime), N'This is third example of a Blog Post', NULL, NULL, 3, N'/articles/this-is-third-example-of-a-blog-post')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'e6cb8675-3b56-43e6-b796-a24500b622c5', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A245010FEA8C AS DateTime), N'user', NULL, NULL, N'/articles/business-post-example/', N'Business post example', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', CAST(0x0000A245010FEA8C AS DateTime), N'Business post example', NULL, NULL, 3, N'/articles/business-post-example')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'09bc1567-53b6-404d-a1a0-a24500b69caf', 1, 0, CAST(0x0000A24500B69C70 AS DateTime), N'user', CAST(0x0000A245010FFAF4 AS DateTime), N'user', NULL, NULL, N'/articles/research-post/', N'Research post', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', CAST(0x0000A245010FFAF4 AS DateTime), N'Research post', NULL, NULL, 3, N'/articles/research-post')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'b5d7b574-455a-4401-8df2-a24500b6eb94', 1, 0, CAST(0x0000A24500B6EAF4 AS DateTime), N'user', CAST(0x0000A245010FF3EC AS DateTime), N'user', NULL, NULL, N'/articles/mobile-post/', N'Mobile post', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', CAST(0x0000A245010FF3EC AS DateTime), N'Mobile post', NULL, NULL, 3, N'/articles/mobile-post')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', 1, 0, CAST(0x0000A24500E7E988 AS DateTime), N'user', CAST(0x0000A24500EA5A24 AS DateTime), N'user', NULL, NULL, N'/news/', N'News', N'99148340-e59f-43c5-ae09-a24400c4e88f', CAST(0x0000A24500EA5A24 AS DateTime), N'News', NULL, NULL, 3, N'/news')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'a945c239-2b71-4070-ac8e-a24500ebcd64', 1, 0, CAST(0x0000A24500EBCC74 AS DateTime), N'user', CAST(0x0000A24500ED08DC AS DateTime), N'user', NULL, NULL, N'/news/business/', N'Business', N'99148340-e59f-43c5-ae09-a24400c4e88f', CAST(0x0000A24500ED08DC AS DateTime), N'Main', NULL, NULL, 3, N'/news/business')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'707e0036-f8eb-40c4-9355-a24500edd4a1', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDED60 AS DateTime), N'user', NULL, NULL, N'/news/technology/', N'Technology', N'99148340-e59f-43c5-ae09-a24400c4e88f', CAST(0x0000A24500EDED60 AS DateTime), N'Technology', NULL, NULL, 3, N'/news/technology')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', 1, 0, CAST(0x0000A24501014360 AS DateTime), N'user', CAST(0x0000A245010168E0 AS DateTime), N'user', NULL, NULL, N'/about-us/', N'About Us', N'eeb19260-3de2-4baa-891d-a24501010636', CAST(0x0000A245010168E0 AS DateTime), N'About Us', NULL, NULL, 3, N'/about-us')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'01797d10-e029-4474-90c1-a2450110a709', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110BB24 AS DateTime), N'user', NULL, NULL, N'/about-us/business/', N'Business', N'eeb19260-3de2-4baa-891d-a24501010636', CAST(0x0000A2450110BB24 AS DateTime), N'Business', NULL, NULL, 3, N'/about-us/business')
INSERT [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlLowerTrimmed]) VALUES (N'd1562284-ce3f-4297-a327-a2450110e9eb', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A24501110174 AS DateTime), N'user', NULL, NULL, N'/about-us/research/', N'Research', N'eeb19260-3de2-4baa-891d-a24501010636', CAST(0x0000A24501110174 AS DateTime), N'Research', NULL, NULL, 3, N'/about-us/research')

INSERT [bcms_blog].[Options] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [DefaultLayoutId]) VALUES (N'1ea6a376-6580-44d8-8ab4-a24400c7f833', 1, 0, CAST(0x0000A24400C7F830 AS DateTime), N'user', CAST(0x0000A24400C7F830 AS DateTime), N'user', NULL, NULL, N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65')

INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'2cff6860-4195-4e57-a1cc-a23e00b46be7', 1, 0, CAST(0x0000A23E00B46B1C AS DateTime), N'user', CAST(0x0000A23E00B46B1C AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'title', 1, N'Title', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'ab488f2b-f9b2-49cd-b05d-a23e00b88ecc', 1, 0, CAST(0x0000A23E00B88E7C AS DateTime), N'user', CAST(0x0000A23E00B88E7C AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'facebookTitle', 1, N'Facebook', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'084bdf5c-790f-41a7-be8b-a23e00b88ecc', 1, 0, CAST(0x0000A23E00B88E7C AS DateTime), N'user', CAST(0x0000A2440123822C AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'facebookUrl', 1, N'https://www.facebook.com/DevBridge', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'373a83ac-67bc-492a-bb8d-a23e00bb3df8', 1, 0, CAST(0x0000A23E00BB3D34 AS DateTime), N'user', CAST(0x0000A23E00BB3D34 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'facebookShouldRender', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'a4d14eaa-adcd-4769-a0bc-a23e00bf586e', 1, 0, CAST(0x0000A23E00BF5860 AS DateTime), N'user', CAST(0x0000A23E00BF5860 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'facebookCssClass', 1, N'facebook', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'f2ecd851-9724-430c-93ea-a23e00c08eb2', 1, 0, CAST(0x0000A23E00C08DC0 AS DateTime), N'user', CAST(0x0000A23E00C08DC0 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'twitterShouldRender', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'cdfb0cb9-0804-4faf-9aa1-a23e00c08eb2', 1, 0, CAST(0x0000A23E00C08DC0 AS DateTime), N'user', CAST(0x0000A23E00C08DC0 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'twitterCssClass', 1, N'twitter', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'7cfd2959-89b3-468b-bad3-a23e00c08eb2', 1, 0, CAST(0x0000A23E00C08DC0 AS DateTime), N'user', CAST(0x0000A23E00C08DC0 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'twitterTitle', 1, N'Twitter', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'd40763e6-a303-4fc3-bda1-a23e00c08eb2', 1, 0, CAST(0x0000A23E00C08DC0 AS DateTime), N'user', CAST(0x0000A23E00C08DC0 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'twitterUrl', 1, N'https://twitter.com/devbridge', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'6ce864aa-fb84-427e-84fe-a23e00c1e3e6', 1, 0, CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'linkedinUrl', 1, N'http://www.linkedin.com/company/devbridge-group', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'45272775-819a-4093-8b8c-a23e00c1e3e6', 1, 0, CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'linkedinCssClass', 1, N'linkedin', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'de839861-acf3-4b20-8e3c-a23e00c1e3e6', 1, 0, CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'linkedinTitle', 1, N'LinkedIn', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'cf21a5bd-7d54-4c9f-bb96-a23e00c1e3e6', 1, 0, CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', CAST(0x0000A23E00C1E2C4 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'linkedinShouldRender', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'48de4891-4f54-4f40-8eb5-a23e00c54a33', 1, 0, CAST(0x0000A23E00C54978 AS DateTime), N'user', CAST(0x0000A23E00C54978 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'skypeUrl', 1, N'skype:devbridge?chat', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'65fe6e13-f263-4a8e-b57d-a23e00c54a33', 1, 0, CAST(0x0000A23E00C54978 AS DateTime), N'user', CAST(0x0000A23E00C54978 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'skypeShouldRender', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'adf6fea0-b8e1-40e8-b654-a23e00c54a33', 1, 0, CAST(0x0000A23E00C54978 AS DateTime), N'user', CAST(0x0000A23E00C54978 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'skypeCssClass', 1, N'skype', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'eaede6c8-fb75-4ba1-beca-a23e00c54a33', 1, 0, CAST(0x0000A23E00C54978 AS DateTime), N'user', CAST(0x0000A23E00C54978 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'skypeTitle', 1, N'Skype', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'6fbd6e6e-4bdf-40ba-811e-a23e00c813a1', 1, 0, CAST(0x0000A23E00C81324 AS DateTime), N'user', CAST(0x0000A23E00C81324 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'youtubeUrl', 1, N'http://www.youtube.com/user/ChicagoWebDesigners?feature=watch', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'3c300064-fa67-4ee1-9c88-a23e00c813a1', 1, 0, CAST(0x0000A23E00C81324 AS DateTime), N'user', CAST(0x0000A23E00C81324 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'youtubeShouldRender', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'0ec3ed88-8ac8-4c17-a861-a23e00c813a1', 1, 0, CAST(0x0000A23E00C81324 AS DateTime), N'user', CAST(0x0000A23E00C81324 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'youtubeCssClass', 1, N'youtube', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'0b1758b5-7c94-4980-aa34-a23e00c813a1', 1, 0, CAST(0x0000A23E00C81324 AS DateTime), N'user', CAST(0x0000A23E00C81324 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'youtubeTitle', 1, N'YouTube', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'd0548f37-f9b8-4a24-8295-a23e00cc8c58', 1, 0, CAST(0x0000A23E00CC8C10 AS DateTime), N'user', CAST(0x0000A23E00CC8C10 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'flickrCssClass', 1, N'flickr', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'4e7b6531-3ff8-4821-9e1d-a23e00cc8c58', 1, 0, CAST(0x0000A23E00CC8C10 AS DateTime), N'user', CAST(0x0000A23E00CC8C10 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'flickrUrl', 1, N'http://www.flickr.com/photos/22239955@N08', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'e1af6547-2b0a-4747-a20d-a23e00cc8c58', 1, 0, CAST(0x0000A23E00CC8C10 AS DateTime), N'user', CAST(0x0000A23E00CC8C10 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'flickrTitle', 1, N'Flickr', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'6c541d3e-75f8-4e63-bf26-a23e00cc8c58', 1, 0, CAST(0x0000A23E00CC8C10 AS DateTime), N'user', CAST(0x0000A23E00CC8C10 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'flickrShouldRender', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'acaa337e-d8fd-4cbd-a7a5-a23e012a4f69', 1, 0, CAST(0x0000A23E012A4E68 AS DateTime), N'user', CAST(0x0000A23E012A4E68 AS DateTime), N'user', NULL, NULL, N'f18d4579-2517-41cd-9c5a-a23e01143b06', N'EmailToAddress', 1, N'info@BetterCmsDemo.com', 1)
GO
print 'Processed 100 total records'
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'3052f15c-e34c-4be0-9584-a24401226d1a', 1, 0, CAST(0x0000A24401226C70 AS DateTime), N'user', CAST(0x0000A24401226C70 AS DateTime), N'user', NULL, NULL, N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'useSideBox', 5, N'false', 1)
INSERT [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable]) VALUES (N'dc68c85e-9243-492e-b52d-a245011821ef', 1, 0, CAST(0x0000A245011820E4 AS DateTime), N'user', CAST(0x0000A245011820E4 AS DateTime), N'user', NULL, NULL, N'e20326de-50c9-46df-b118-a24500fb10bb', N'parentUrl', 1, NULL, 1)

INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'0f4cc1db-b9db-44ae-9c1c-a23d00af3c88', 1, 0, CAST(0x0000A23D00AF3B60 AS DateTime), N'user', CAST(0x0000A23D00AF3B60 AS DateTime), N'user', NULL, NULL, N'Scripts', N'453f0187-c653-4e7e-80ff-a23d00af3c87', N'06ffe951-4dc7-41bf-9ead-a23d00af3c83')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'e9ae1b1f-c968-4260-8791-a23d00af62e5', 1, 0, CAST(0x0000A23D00AF620C AS DateTime), N'user', CAST(0x0000A23D00AF620C AS DateTime), N'user', NULL, NULL, N'Scripts', N'5c4ffb26-746c-4d99-bf74-a23d00af62e5', N'06ffe951-4dc7-41bf-9ead-a23d00af3c83')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'4bb35508-8919-4c76-8041-a23d00c26bc4', 1, 0, CAST(0x0000A23D00C26AB4 AS DateTime), N'user', CAST(0x0000A23D00C26AB4 AS DateTime), N'user', NULL, NULL, N'MainContent', N'5c4ffb26-746c-4d99-bf74-a23d00af62e5', N'956b26ab-07bc-4079-96f2-a23d00c26bc0')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'48263cf2-51dc-4703-9969-a23d00c544d9', 1, 0, CAST(0x0000A23D00C544C8 AS DateTime), N'user', CAST(0x0000A23D00C544C8 AS DateTime), N'user', NULL, NULL, N'MainContent', N'453f0187-c653-4e7e-80ff-a23d00af3c87', N'956b26ab-07bc-4079-96f2-a23d00c26bc0')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'a7a96093-423b-4716-bf16-a23d00f77f6c', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'Scripts', N'64ae7880-5bff-4428-a328-a23d00f77f6d', N'06ffe951-4dc7-41bf-9ead-a23d00af3c83')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'a6b24893-6930-454a-85bb-a23d00f77f70', 1, 0, CAST(0x0000A23D00F77E98 AS DateTime), N'user', CAST(0x0000A23D00F77E98 AS DateTime), N'user', NULL, NULL, N'Map', N'64ae7880-5bff-4428-a328-a23d00f77f6d', N'1cfaa40f-c1cb-4487-8e1b-a23d00f77f6f')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'6ceb12cd-a67d-452e-885e-a23e009d447b', 1, 0, CAST(0x0000A23E009D43C4 AS DateTime), N'user', CAST(0x0000A23E009D43C4 AS DateTime), N'user', NULL, NULL, N'Social', N'64ae7880-5bff-4428-a328-a23d00f77f6d', N'3e0b88c8-615f-4ba9-9bea-a23d00f77f6f')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'b3a82224-77bc-4af3-9442-a23e009d447c', 1, 0, CAST(0x0000A23E009D43C4 AS DateTime), N'user', CAST(0x0000A23E009D43C4 AS DateTime), N'user', NULL, NULL, N'Address', N'64ae7880-5bff-4428-a328-a23d00f77f6d', N'96ae6cde-a97e-4296-ba69-a23d00f77f6f')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'c088c9a8-e3de-4f4f-9d82-a23e009d447d', 1, 0, CAST(0x0000A23E009D43C4 AS DateTime), N'user', CAST(0x0000A23E009D43C4 AS DateTime), N'user', NULL, NULL, N'Form', N'64ae7880-5bff-4428-a328-a23d00f77f6d', N'b33fd94a-9c00-4c74-8752-a23e009d447a')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'8b9328fc-6772-4c5d-92fa-a2430122e55c', 1, 0, CAST(0x0000A2430122E524 AS DateTime), N'user', CAST(0x0000A2430122E524 AS DateTime), N'user', NULL, NULL, N'Slider', N'40f9cf2b-87b9-4cee-b106-a24300c63b82', N'3d74a1fe-70e6-415a-af14-a2430122e559')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'37899985-dc7b-448e-985d-a24301264d72', 1, 0, CAST(0x0000A24301264D04 AS DateTime), N'user', CAST(0x0000A24301264D04 AS DateTime), N'user', NULL, NULL, N'SideBar', N'40f9cf2b-87b9-4cee-b106-a24300c63b82', N'f71a2724-3c02-47f8-9238-a24300c63b7f')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'b0b7f222-1da6-410b-a968-a24301264d72', 1, 0, CAST(0x0000A24301264D04 AS DateTime), N'user', CAST(0x0000A24301264D04 AS DateTime), N'user', NULL, NULL, N'Article', N'40f9cf2b-87b9-4cee-b106-a24300c63b82', N'5f067800-297d-4414-9561-a24300c63b81')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'5d3300aa-b94b-41fa-b6b1-a24400c4e88b', 1, 0, CAST(0x0000A24400C4E834 AS DateTime), N'user', CAST(0x0000A24400C4E834 AS DateTime), N'user', NULL, NULL, N'Scripts', N'99148340-e59f-43c5-ae09-a24400c4e88f', N'06ffe951-4dc7-41bf-9ead-a23d00af3c83')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'715b39a2-0bd9-41ab-97d1-a24400c4e89a', 1, 0, CAST(0x0000A24400C4E834 AS DateTime), N'user', CAST(0x0000A24400C4E834 AS DateTime), N'user', NULL, NULL, N'ColRight', N'99148340-e59f-43c5-ae09-a24400c4e88f', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'4c598c44-8284-413b-ab8b-a24400c7eb83', 1, 0, CAST(0x0000A24400C7EB4C AS DateTime), N'user', CAST(0x0000A24400C7EB4C AS DateTime), N'user', NULL, NULL, N'CMSMainContent', N'99148340-e59f-43c5-ae09-a24400c4e88f', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'615c5f4e-8f6e-4364-94b3-a24400f95b64', 1, 0, CAST(0x0000A24400F95A60 AS DateTime), N'user', CAST(0x0000A24400F95A60 AS DateTime), N'user', NULL, NULL, NULL, N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', N'06ffe951-4dc7-41bf-9ead-a23d00af3c83')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'eaccf700-fe83-448d-905e-a24400f95b67', 1, 0, CAST(0x0000A24400F95A60 AS DateTime), N'user', CAST(0x0000A24400F95A60 AS DateTime), N'user', NULL, NULL, NULL, N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'd3125ef1-96c1-44d1-abda-a24400f95b67', 1, 0, CAST(0x0000A24400F95A60 AS DateTime), N'user', CAST(0x0000A24400FAF6E0 AS DateTime), N'user', NULL, NULL, N'CMSMainContent', N'4dbd7ae6-e9fc-46bb-9ef6-a24400f95b65', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'080c9bf9-ad2d-453f-9ff7-a24501010634', 1, 0, CAST(0x0000A24501010544 AS DateTime), N'user', CAST(0x0000A24501010544 AS DateTime), N'user', NULL, NULL, N'ColRight', N'eeb19260-3de2-4baa-891d-a24501010636', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'2785c344-d624-4834-9c0d-a2450101063a', 1, 0, CAST(0x0000A24501010544 AS DateTime), N'user', CAST(0x0000A24501010544 AS DateTime), N'user', NULL, NULL, N'MainContent', N'eeb19260-3de2-4baa-891d-a24501010636', N'956b26ab-07bc-4079-96f2-a23d00c26bc0')
INSERT [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'385eb1fb-7f7d-4405-810a-a2450101063b', 1, 0, CAST(0x0000A24501010544 AS DateTime), N'user', CAST(0x0000A24501010544 AS DateTime), N'user', NULL, NULL, N'ColMiddle', N'eeb19260-3de2-4baa-891d-a24501010636', N'acad9cc0-509c-4a2c-8a8d-a2450101063a')

INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'2314c731-db26-4eb8-8bcf-a23e00b46be3', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'f18d4579-2517-41cd-9c5a-a23e01143b06', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'bcc8b55b-cd31-4783-9df6-a24301231df3', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'1fb8b25a-26f8-4e55-a4c8-a244011a88f2', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'f6957b61-6a09-4926-a53a-a24401275f33', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'1dc2764a-53a6-47d7-b60f-a24500be46b0', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'e20326de-50c9-46df-b118-a24500fb10bb', NULL)
INSERT [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'4d8bed4f-8eca-40c7-9485-a245010cff03', NULL)

INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'539da9fb-4deb-40a8-b7ce-a23e009ed3fa', CAST(0x0000A23E00000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'            <h2>DevBridge Inc.</h2>
            <dl>
                <dt>1659 W. Hubbard St</dt>
                <dt>Chicago, IL 60622</dt>
                <dd>Ph. 312 242 1642</dd>
                <dd>Fax. 847 232 3114</dd>
            </dl>
 ', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'a44ee27c-d1eb-4bba-ae62-a23e009f7fc4', CAST(0x0000A23E00000000 AS DateTime), NULL, NULL, 0, N'
$.getScript("http://maps.google.com/maps/api/js?sensor=false&async=2&callback=gMapsCallback", function () {});

function gMapsCallback() {
    $(document).ready(function() {
        var location = new google.maps.LatLng(41.889709,-87.66933);
        var options = {
			center: new google.maps.LatLng(41.893000,-87.669200),
			zoom: 14,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map($(''#google-map'')[0], options);
		
		var content = ''<div style="width: 200px;">''+
			''<a href="http://www.devbridge.com"><b>DevBridge Group</b></a> <br/>'' +
			''1659 West Hubbard Street <br/>'' +
			''Chicago, IL 60622 <br/>'' +
			''</div>'';
		
		var marker = new google.maps.Marker({
			position: location,
			map: map,
			title: ''DevBridge Group''
		});
		
		var infowindow = new google.maps.InfoWindow();
		infowindow.open(map,marker);
		infowindow.setContent(content);
		
	});
}', 1, N'<h2>Our Location</h2>

<div id="google-map" class="map"></div>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'5190f6fe-8b06-44fc-b089-a24300cc6b17', CAST(0x0000A24300000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'        <a href="#1" class="banner-link link">Ut wisi enim ad minim veniam</a>
        <div class="block">
            <p>
                <br />
                You''ve seen it coming! Buy now and get nothing for free! Well, at least no free beer. Perhaps a bear, if you can afford it.
            </p>
        </div>

        <a href="#2" class="banner-link link">Esse molestie consequa</a>
        <div class="block">
            <p>your bear, you have to admit it! No, we aren''t selling bears.</p>
        </div>

        <a href="#3" class="banner-link link">Congue nihil imperdiet</a>
        <div class="block">
            <p>And now, for something completely different. And now, for something completely different. Period.</p>
        </div>

        <a href="#4" class="banner-link link">Ut wisi enim ad minim veniam</a>
        <div class="block">
            <br />
            <p>And now, for something completely different. And now.</p>
        </div>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'ff7fd016-7041-431e-b435-a24300cd6328', CAST(0x0000A24300000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'        <div>
            <hgroup class="banner-text">
                <h1>Ut wisi minim veniam</h1>
                <h2>doming id quod mazim placerat facer possim assum.</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 1" />
        </div>
        <div>
            <hgroup class="banner-text">
                <h1>Esse molestie consequa</h1>
                <h2>doming id quod mazim placerat facer possim assum.</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 2" />
        </div>
        <div>
            <hgroup class="banner-text">
                <h1>Congue nihil imperdiet</h1>
                <h2>doming id quod mazim placerat facer possim assum.</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 3" />
        </div>
        <div>
            <hgroup class="banner-text">
                <h1>Ut wisi enim ad minim veniam</h1>
                <h2>doming id quod mazim placerat facer possim assum. doming id quod mazim placerat facer possim assum</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 4" />
        </div>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'51c175cc-7d5e-45c4-be67-a24301266d95', CAST(0x0000A24300000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<h1>About Us</h1>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis brodi autem vel feugait nulla...
<a href="/about-us/">&lt; Read more About Us &gt</a>
</p>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'896b6b17-22bd-4844-a66c-a2430126988d', CAST(0x0000A24300000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'        <h1>Gallery</h1>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'e76a4678-ecbd-4635-9ac9-a24400c94548', CAST(0x0000A24400000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<section class="blogpost-head">
<h1>This is an Example of a Blog Post<a class="back-link" onclick="history.go(-1)">&lt; Back</a></h1>
<span class="author">Author Name,</span><time datetime="2013-01-28">Jan 28, 2013</time></section>

<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'e838e63d-9b12-46e5-8b37-a24400cdac52', CAST(0x0000A24400000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<p>dsdfsgsda</p>
', 0)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'c73ccc96-e4ae-4a44-8bfe-a24400fa536c', CAST(0x0000A24400000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'af326b53-1339-4136-b8c0-a244011c5d2c', CAST(0x0000A24400000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'072f4ae4-9b64-4176-8f15-a244011ca304', CAST(0x0000A24400000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'462c89e4-1ed9-4e37-b3b1-a24500b622c5', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'94163a66-1f43-4d7d-8156-a24500b69caf', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'7ec1762a-e6ee-4ff2-b77c-a24500b6eb94', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<article class="content-article">
<h3>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h3>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'c6315c08-038c-4bb1-b1a6-a24500e9b94b', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<hgroup>
    <h1>This is an Example of a Sub Head</h1>
    <h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2>
</hgroup>

<section class="content-image-2">
    <img src="/Content/images/sample-32.jpg" alt="Sample 32">
    <div class="info-box">
        <h2>Consectetuer adipiscing</h2>
        <h3>doming id quod mazim placerat facer possim assum.</h3>
    </div>
</section>

<article class="content-article">
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
    <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
    <h2>This is an Example of a Sub Head</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
    <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
    <h2>This is an Example of a Sub Head</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. </p>
    <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>

<section class="quotation">
    <h2>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat:</h2>
    <dl>
        <dd><span></span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</dd>
        <dd><span></span>sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna </dd>
        <dd><span></span>aliquam erat volutpat. Ut wisi enim ad minim veniam</dd>
    </dl>
</section>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'a2a7e409-7c56-412b-9cd9-a24500ed8d6d', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'  
<hgroup>
    <h1>Business Sub Head</h1>
    <h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2>
</hgroup>

<section class="content-image-2">
    <img src="/Content/images/sample-32.jpg" alt="Sample 32">
    <div class="info-box">
        <h2>Consectetuer adipiscing</h2>
        <h3>doming id quod mazim placerat facer possim assum.</h3>
    </div>
</section>

<article class="content-article">
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
    <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
    <h2>This is an Example of a Sub Head</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
    <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
    <h2>This is an Example of a Sub Head</h2>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. </p>
    <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>

<section class="quotation">
    <h2>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat:</h2>
    <dl>
        <dd><span></span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</dd>
        <dd><span></span>sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna </dd>
        <dd><span></span>aliquam erat volutpat. Ut wisi enim ad minim veniam</dd>
    </dl>
</section>', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'ed4ac7a4-0651-40f6-b41e-a24500edd4a6', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<hgroup>
	<h1>Technology Sub Head</h1>

	<h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2>
</hgroup>

<section class="content-image-2"><img alt="Sample 32" src="/Content/images/sample-32.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

<p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
</article>

<section class="quotation">
<h2>Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat:</h2>

<dl>
	<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</dd>
	<dd>sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna</dd>
	<dd>aliquam erat volutpat. Ut wisi enim ad minim veniam</dd>
</dl>
</section>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'636a7d67-1dfa-4387-9e0a-a24501020e4d', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<hgroup>
	<h1>About Us</h1>

	<h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2>
</hgroup>

<section class="content-image-1"><img alt="Sample 45" src="/Content/images/sample-45.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>
', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'7d2eba20-8133-43ec-9c09-a245010c13cb', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<h2>Blog Posts</h2>', 1)
GO
print 'Processed 100 total records'
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'413fa6be-f765-4bd1-92c6-a2450110a70d', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<hgroup>
	<h1>About Us : Business</h1>

	<h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2>
</hgroup>

<section class="content-image-1"><img alt="Sample 45" src="/Content/images/sample-45.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'9bfd80ed-ff09-4d1a-9826-a2450110a70e', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<h2>Blog Posts</h2>', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'c6175ed7-0deb-4de0-a37b-a2450110e9ee', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<hgroup>
	<h1>About Us : Research</h1>

	<h2>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</h2>
</hgroup>

<section class="content-image-1"><img alt="Sample 45" src="/Content/images/sample-45.jpg" />
<div class="info-box">
<h2>Consectetuer adipiscing</h2>

<h3>doming id quod mazim placerat facer possim assum.</h3>
</div>
</section>

<article class="content-article">
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>

<article class="content-article">
<h2>This is an Example of a Sub Head</h2>

<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diamnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, nos trud exe rci tation ullamc orper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>

<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel feugait nulla facilisi.</p>
</article>', 1)
INSERT [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode]) VALUES (N'0322541f-75c6-4b5f-ad0e-a2450110e9ef', CAST(0x0000A24500000000 AS DateTime), NULL, NULL, 0, NULL, 0, N'<h2>Blog Posts</h2>', 1)

INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'596fd4bf-0272-442a-8978-a23d00c7a284', N'8677d6f4-5ff4-4c1f-919d-a23d00c7a288')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'596fd4bf-0272-442a-8978-a23d00c7a284', N'aeeda51b-b7c6-4658-b2fa-a23d00c7a288')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', N'f7de75fb-4a64-43c4-a4ec-a243011d0afe')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', N'8a7ce198-93d3-4edc-8dd1-a243011d0aff')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'99614554-e15d-4152-8b3e-a24400fa536e', N'18d3cdbb-f4f0-4a02-a1a1-a24400fa5370')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'99614554-e15d-4152-8b3e-a24400fa536e', N'4e8b0830-8703-4f20-b31b-a24400fa5370')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'205fea1c-7393-431f-a839-a24401121f75', N'a83283ea-6a3b-4e70-add7-a24401121f7c')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'205fea1c-7393-431f-a839-a24401121f75', N'cbd337e2-6a29-4bd4-aeb7-a24401121f7c')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'36b4c61c-9aed-4e1a-9b58-a244011c5d30')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'80b3cb66-359b-4089-b846-a244011c5d30')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'aa7e6789-9237-4aea-9538-a244011ca304')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'8ed92f55-595a-45ca-889c-a244011ca305')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'e6cb8675-3b56-43e6-b796-a24500b622c5', N'1d08f183-42d6-47f2-81b8-a24500b622c5')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'e6cb8675-3b56-43e6-b796-a24500b622c5', N'f3b4c13a-c1ae-4a95-9fad-a24500b622c5')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'09bc1567-53b6-404d-a1a0-a24500b69caf', N'f021987a-0f26-4242-8208-a24500b69caf')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'09bc1567-53b6-404d-a1a0-a24500b69caf', N'd0cb2577-0a6d-4d1d-8582-a24500b69caf')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'b5d7b574-455a-4401-8df2-a24500b6eb94', N'c511ab72-995c-4439-8350-a24500b6eb94')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'b5d7b574-455a-4401-8df2-a24500b6eb94', N'8a9f49ae-3fd8-4598-a751-a24500b6eb94')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', N'64459cf2-500b-41e6-8ca7-a24500e7eab2')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', N'796fb6a2-122a-40fd-a385-a24500e7eab3')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'a945c239-2b71-4070-ac8e-a24500ebcd64', N'0e68525f-3df8-4833-a213-a24500ebcd64')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'a945c239-2b71-4070-ac8e-a24500ebcd64', N'3f2ce764-6135-42e4-b333-a24500ebcd64')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'707e0036-f8eb-40c4-9355-a24500edd4a1', N'8446225d-fe6a-4556-83a8-a24500edd4a1')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'707e0036-f8eb-40c4-9355-a24500edd4a1', N'6cd0765c-7e5b-4cd8-ac00-a24500edd4a1')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'd3dff254-8fe6-49a7-bbcf-a2450101437d')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'f48762b1-46b0-45b0-be1f-a2450101437d')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'01797d10-e029-4474-90c1-a2450110a709', N'76862ca7-e378-4702-af00-a2450110a709')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'01797d10-e029-4474-90c1-a2450110a709', N'a7e7a1d4-54ad-4cd9-af86-a2450110a709')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'd1562284-ce3f-4297-a327-a2450110e9eb', N'fd27b36a-bea3-4516-802f-a2450110e9eb')
INSERT [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'd1562284-ce3f-4297-a327-a2450110e9eb', N'2a7cda16-4a5e-40ea-9dfa-a2450110e9eb')

INSERT [bcms_pages].[HtmlContentWidgets] ([Id], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [UseHtml], [EditInSourceMode]) VALUES (N'bcc8b55b-cd31-4783-9df6-a24301231df3', NULL, 1, N'        $(document).ready(function () {
            $("#home-slides").slides({
                container: ''banner-image'',
                generatePagination: true,
                slideSpeed: 200,
                effect: ''slide''
            });
            
            $(''#home-banner'').accordion({
                header: ''a'',
            });

        });
', 1, N'    <div class="banner-image">
        <div>
            <hgroup class="banner-text">
                <h1>Ut wisi minim veniam</h1>
                <h2>doming id quod mazim placerat facer possim assum.</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 1" />
        </div>
        <div style="display: none;">
            <hgroup class="banner-text">
                <h1>Esse molestie consequa</h1>
                <h2>doming id quod mazim placerat facer possim assum.</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 2" />
        </div>
        <div style="display: none;">
            <hgroup class="banner-text">
                <h1>Congue nihil imperdiet</h1>
                <h2>doming id quod mazim placerat facer possim assum.</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 3" />
        </div>
        <div style="display: none;">
            <hgroup class="banner-text">
                <h1>Ut wisi enim ad minim veniam</h1>
                <h2>doming id quod mazim placerat facer possim assum. doming id quod mazim placerat facer possim assum</h2>
            </hgroup>
            <a href="#nolink" class="btn-primary action-arrow">Call to Action</a>
            <img src="/Content/images/sample-78.jpg" alt="Banner 4" />
        </div>
    </div>

    <div class="banner-nav" id="home-banner">

        <a href="#1" class="banner-link link">Ut wisi enim ad minim veniam</a>
        <div class="block">
            <p>
                <br />
                You''ve seen it coming! Buy now and get nothing for free! Well, at least no free beer. Perhaps a bear, if you can afford it.
            </p>
        </div>

        <a href="#2" class="banner-link link">Esse molestie consequa</a>
        <div class="block">
            <p>your bear, you have to admit it! No, we aren''t selling bears.</p>
        </div>

        <a href="#3" class="banner-link link">Congue nihil imperdiet</a>
        <div class="block">
            <p>And now, for something completely different. And now, for something completely different. Period.</p>
        </div>

        <a href="#4" class="banner-link link">Ut wisi enim ad minim veniam</a>
        <div class="block">
            <br />
            <p>And now, for something completely different. And now.</p>
        </div>

    </div>
', 1, 1)

INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'e76a4678-ecbd-4635-9ac9-a24400c94548')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'e838e63d-9b12-46e5-8b37-a24400cdac52')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'c73ccc96-e4ae-4a44-8bfe-a24400fa536c')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'af326b53-1339-4136-b8c0-a244011c5d2c')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'072f4ae4-9b64-4176-8f15-a244011ca304')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'462c89e4-1ed9-4e37-b3b1-a24500b622c5')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'94163a66-1f43-4d7d-8156-a24500b69caf')
INSERT [bcms_blog].[BlogPostContents] ([Id]) VALUES (N'7ec1762a-e6ee-4ff2-b77c-a24500b6eb94')

INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'~/Views/Widgets/SocialWidget.cshtml')
INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'f18d4579-2517-41cd-9c5a-a23e01143b06', N'~/Views/Widgets/ContactFormWidget.cshtml')
INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'1fb8b25a-26f8-4e55-a4c8-a244011a88f2', N'~/Views/Widgets/LatestBlogPostsWdiget.cshtml')
INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'f6957b61-6a09-4926-a53a-a24401275f33', N'~/Views/Widgets/LastBlogPostWidget.cshtml')
INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'1dc2764a-53a6-47d7-b60f-a24500be46b0', N'~/Views/Widgets/CategoriesMenuWdiget.cshtml')
INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'e20326de-50c9-46df-b118-a24500fb10bb', N'~/Views/Widgets/SubMenuWidget.cshtml')
INSERT [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'4d8bed4f-8eca-40c7-9485-a245010cff03', N'~/Views/Widgets/BlogFeedWidget.cshtml')

INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'2b1fc175-de47-4710-935b-a23e009ed3fa', 1, 0, CAST(0x0000A23E009ED360 AS DateTime), N'user', CAST(0x0000A23E009ED360 AS DateTime), N'user', NULL, NULL, N'596fd4bf-0272-442a-8978-a23d00c7a284', N'539da9fb-4deb-40a8-b7ce-a23e009ed3fa', N'96ae6cde-a97e-4296-ba69-a23d00f77f6f', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'1eb81b6a-61dc-49a6-a573-a23e009f7fc4', 1, 0, CAST(0x0000A23E009F7FA4 AS DateTime), N'user', CAST(0x0000A23E009F7FA4 AS DateTime), N'user', NULL, NULL, N'596fd4bf-0272-442a-8978-a23d00c7a284', N'a44ee27c-d1eb-4bba-ae62-a23e009f7fc4', N'1cfaa40f-c1cb-4487-8e1b-a23d00f77f6f', 3)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', 1, 0, CAST(0x0000A23E00B47DDC AS DateTime), N'user', CAST(0x0000A23E00B47DDC AS DateTime), N'user', NULL, NULL, N'596fd4bf-0272-442a-8978-a23d00c7a284', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'3e0b88c8-615f-4ba9-9bea-a23d00f77f6f', 5)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'cdbf0e20-649b-4c58-8c95-a23e011468f5', 1, 0, CAST(0x0000A23E01146828 AS DateTime), N'user', CAST(0x0000A23E01146828 AS DateTime), N'user', NULL, NULL, N'596fd4bf-0272-442a-8978-a23d00c7a284', N'f18d4579-2517-41cd-9c5a-a23e01143b06', N'b33fd94a-9c00-4c74-8752-a23e009d447a', 6)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'275ac6b8-b57b-46fd-8d42-a24301233062', 1, 0, CAST(0x0000A24301233024 AS DateTime), N'user', CAST(0x0000A24301233024 AS DateTime), N'user', NULL, NULL, N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', N'bcc8b55b-cd31-4783-9df6-a24301231df3', N'3d74a1fe-70e6-415a-af14-a2430122e559', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'fc4996c8-8320-4d7e-9c32-a24301266d97', 1, 0, CAST(0x0000A24301266CA8 AS DateTime), N'user', CAST(0x0000A24301266CA8 AS DateTime), N'user', NULL, NULL, N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', N'51c175cc-7d5e-45c4-be67-a24301266d95', N'5f067800-297d-4414-9561-a24300c63b81', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'349e2a7d-179f-4209-b263-a2430126988d', 1, 0, CAST(0x0000A24301269804 AS DateTime), N'user', CAST(0x0000A24301269804 AS DateTime), N'user', NULL, NULL, N'bd996dc2-4dfe-44f1-a6f3-a243011d0afb', N'896b6b17-22bd-4844-a66c-a2430126988d', N'f71a2724-3c02-47f8-9238-a24300c63b7f', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'a6722f09-901b-40fc-8d86-a24400fa5371', 1, 0, CAST(0x0000A24400FA52D0 AS DateTime), N'user', CAST(0x0000A24400FA52D0 AS DateTime), N'user', NULL, NULL, N'99614554-e15d-4152-8b3e-a24400fa536e', N'c73ccc96-e4ae-4a44-8bfe-a24400fa536c', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'a6a58613-87a5-47c1-87ad-a24401127b78', 1, 0, CAST(0x0000A24401127ACC AS DateTime), N'user', CAST(0x0000A24500BF1468 AS DateTime), N'user', NULL, NULL, N'205fea1c-7393-431f-a839-a24401121f75', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'4f05d921-416a-4f62-9aa8-a244011aa216', 1, 0, CAST(0x0000A244011AA1E8 AS DateTime), N'user', CAST(0x0000A244011AA1E8 AS DateTime), N'user', NULL, NULL, N'205fea1c-7393-431f-a839-a24401121f75', N'1fb8b25a-26f8-4e55-a4c8-a244011a88f2', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'84e978d4-706b-4b13-ae1b-a244011c5d33', 1, 0, CAST(0x0000A244011C5CE0 AS DateTime), N'user', CAST(0x0000A244011C5CE0 AS DateTime), N'user', NULL, NULL, N'4dfb5f1b-e58c-4e93-ad41-a244011c5d2d', N'af326b53-1339-4136-b8c0-a244011c5d2c', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'77432f21-0c9d-4d0c-8f67-a244011ca306', 1, 0, CAST(0x0000A244011CA204 AS DateTime), N'user', CAST(0x0000A244011CA204 AS DateTime), N'user', NULL, NULL, N'fa9ea0dc-4cbe-48cf-942a-a244011ca304', N'072f4ae4-9b64-4176-8f15-a244011ca304', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'0eebc50d-2dba-4f60-a523-a24401277ccf', 1, 0, CAST(0x0000A24401277C88 AS DateTime), N'user', CAST(0x0000A24401277C88 AS DateTime), N'user', NULL, NULL, N'205fea1c-7393-431f-a839-a24401121f75', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'f37961d2-48ef-4aac-8bd5-a24500b622c5', 1, 0, CAST(0x0000A24500B62290 AS DateTime), N'user', CAST(0x0000A24500B62290 AS DateTime), N'user', NULL, NULL, N'e6cb8675-3b56-43e6-b796-a24500b622c5', N'462c89e4-1ed9-4e37-b3b1-a24500b622c5', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'f68ab0dc-1fb6-4aa3-b24f-a24500b69caf', 1, 0, CAST(0x0000A24500B69C70 AS DateTime), N'user', CAST(0x0000A24500B69C70 AS DateTime), N'user', NULL, NULL, N'09bc1567-53b6-404d-a1a0-a24500b69caf', N'94163a66-1f43-4d7d-8156-a24500b69caf', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'af1af952-af23-410a-93cd-a24500b6eb95', 1, 0, CAST(0x0000A24500B6EAF4 AS DateTime), N'user', CAST(0x0000A24500B6EAF4 AS DateTime), N'user', NULL, NULL, N'b5d7b574-455a-4401-8df2-a24500b6eb94', N'7ec1762a-e6ee-4ff2-b77c-a24500b6eb94', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'bffe4d7f-7845-4156-8fe3-a24500be6dac', 1, 0, CAST(0x0000A24500BE6CD4 AS DateTime), N'user', CAST(0x0000A24500BF1468 AS DateTime), N'user', NULL, NULL, N'205fea1c-7393-431f-a839-a24401121f75', N'1dc2764a-53a6-47d7-b60f-a24500be46b0', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', 1, 0, CAST(0x0000A24500E86CC8 AS DateTime), N'user', CAST(0x0000A24500FB39AC AS DateTime), N'user', NULL, NULL, N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'836de5db-951f-4423-acbc-a24500e91697', 1, 0, CAST(0x0000A24500E91588 AS DateTime), N'user', CAST(0x0000A24500FB39AC AS DateTime), N'user', NULL, NULL, N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'a28b1fa6-a109-4e84-af1d-a24500e9b94b', 1, 0, CAST(0x0000A24500E9B86C AS DateTime), N'user', CAST(0x0000A24500E9B86C AS DateTime), N'user', NULL, NULL, N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', N'c6315c08-038c-4bb1-b1a6-a24500e9b94b', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'0e04b6a9-baf1-4001-b001-a24500ec1d91', 1, 0, CAST(0x0000A24500EC1D50 AS DateTime), N'user', CAST(0x0000A24500FB9064 AS DateTime), N'user', NULL, NULL, N'a945c239-2b71-4070-ac8e-a24500ebcd64', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'0620839f-df5e-40cc-b8d2-a24500ec28fe', 1, 0, CAST(0x0000A24500EC27DC AS DateTime), N'user', CAST(0x0000A24500FB9064 AS DateTime), N'user', NULL, NULL, N'a945c239-2b71-4070-ac8e-a24500ebcd64', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'ab7dd36f-8b57-44a0-96c1-a24500ed8d6d', 1, 0, CAST(0x0000A24500ED8D48 AS DateTime), N'user', CAST(0x0000A24500ED8D48 AS DateTime), N'user', NULL, NULL, N'a945c239-2b71-4070-ac8e-a24500ebcd64', N'a2a7e409-7c56-412b-9cd9-a24500ed8d6d', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'a6b0bd2e-9252-4430-a117-a24500edd4a2', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500FBA7D4 AS DateTime), N'user', NULL, NULL, N'707e0036-f8eb-40c4-9355-a24500edd4a1', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'59a3bc33-5a1c-495b-9290-a24500edd4a4', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500FBA7D4 AS DateTime), N'user', NULL, NULL, N'707e0036-f8eb-40c4-9355-a24500edd4a1', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'1c3201c2-e150-4a77-b2f3-a24500edd4a6', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'707e0036-f8eb-40c4-9355-a24500edd4a1', N'ed4ac7a4-0651-40f6-b41e-a24500edd4a6', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'4f2785fb-4333-4cd7-9f6e-a24500fb2d43', 1, 0, CAST(0x0000A24500FB2CC8 AS DateTime), N'user', CAST(0x0000A24500FB39AC AS DateTime), N'user', NULL, NULL, N'4cc6f700-5f34-4b68-9ea8-a24500e7eaab', N'e20326de-50c9-46df-b118-a24500fb10bb', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'60ca29aa-8d40-4d76-b5bd-a24500fb8722', 1, 0, CAST(0x0000A24500FB8704 AS DateTime), N'user', CAST(0x0000A24500FB9064 AS DateTime), N'user', NULL, NULL, N'a945c239-2b71-4070-ac8e-a24500ebcd64', N'e20326de-50c9-46df-b118-a24500fb10bb', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'64919785-7166-4406-9b64-a24500fba0c9', 1, 0, CAST(0x0000A24500FB9FA0 AS DateTime), N'user', CAST(0x0000A24500FBA7D4 AS DateTime), N'user', NULL, NULL, N'707e0036-f8eb-40c4-9355-a24500edd4a1', N'e20326de-50c9-46df-b118-a24500fb10bb', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'2055f38b-cd79-4657-b1e5-a24501018672', 1, 0, CAST(0x0000A2450101862C AS DateTime), N'user', CAST(0x0000A2450118C620 AS DateTime), N'user', NULL, NULL, N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'0443cda8-4282-4bdc-af3d-a2450101d9dd', 1, 0, CAST(0x0000A2450101D960 AS DateTime), N'user', CAST(0x0000A2450118C620 AS DateTime), N'user', NULL, NULL, N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'6cd51877-ed71-41cd-a657-a24501020e4e', 1, 0, CAST(0x0000A24501020E1C AS DateTime), N'user', CAST(0x0000A24501020E1C AS DateTime), N'user', NULL, NULL, N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'636a7d67-1dfa-4387-9e0a-a24501020e4d', N'956b26ab-07bc-4079-96f2-a23d00c26bc0', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'2e039cc0-27a9-4404-b4ff-a245010c13d2', 1, 0, CAST(0x0000A245010C1358 AS DateTime), N'user', CAST(0x0000A245010C1358 AS DateTime), N'user', NULL, NULL, N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'7d2eba20-8133-43ec-9c09-a245010c13cb', N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 3)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'5da74a62-ba61-4ccd-bced-a245010d1522', 1, 0, CAST(0x0000A245010D13FC AS DateTime), N'user', CAST(0x0000A245010D13FC AS DateTime), N'user', NULL, NULL, N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'4d8bed4f-8eca-40c7-9485-a245010cff03', N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 4)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'75ca12d9-97b6-4ab0-891a-a2450110a70a', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450118F050 AS DateTime), N'user', NULL, NULL, N'01797d10-e029-4474-90c1-a2450110a709', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'e26f9b62-b76f-4f28-8566-a2450110a70c', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450118F050 AS DateTime), N'user', NULL, NULL, N'01797d10-e029-4474-90c1-a2450110a709', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'1ffb1738-ce08-4495-a420-a2450110a70d', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'01797d10-e029-4474-90c1-a2450110a709', N'413fa6be-f765-4bd1-92c6-a2450110a70d', N'956b26ab-07bc-4079-96f2-a23d00c26bc0', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'055e5ec4-6af2-4b3e-9135-a2450110a70e', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'01797d10-e029-4474-90c1-a2450110a709', N'9bfd80ed-ff09-4d1a-9826-a2450110a70e', N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 3)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'f99bc450-0c59-4584-aeae-a2450110a70f', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'01797d10-e029-4474-90c1-a2450110a709', N'4d8bed4f-8eca-40c7-9485-a245010cff03', N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 4)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'07a5438e-8f7a-4a17-9651-a2450110e9eb', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A24501191828 AS DateTime), N'user', NULL, NULL, N'd1562284-ce3f-4297-a327-a2450110e9eb', N'2314c731-db26-4eb8-8bcf-a23e00b46be3', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 1)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'ff91dd69-4bca-478d-b166-a2450110e9ed', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A24501191828 AS DateTime), N'user', NULL, NULL, N'd1562284-ce3f-4297-a327-a2450110e9eb', N'f6957b61-6a09-4926-a53a-a24401275f33', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'000b7a11-fba2-41b2-8f58-a2450110e9ee', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'd1562284-ce3f-4297-a327-a2450110e9eb', N'c6175ed7-0deb-4de0-a37b-a2450110e9ee', N'956b26ab-07bc-4079-96f2-a23d00c26bc0', 2)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'45a47160-a0fe-44d6-9f25-a2450110e9ee', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'd1562284-ce3f-4297-a327-a2450110e9eb', N'0322541f-75c6-4b5f-ad0e-a2450110e9ef', N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 3)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'82e66b0c-5caf-44a1-b2dc-a2450110e9ef', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'd1562284-ce3f-4297-a327-a2450110e9eb', N'4d8bed4f-8eca-40c7-9485-a245010cff03', N'acad9cc0-509c-4a2c-8a8d-a2450101063a', 4)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'c0a1d40c-8d74-4b5d-a187-a2450118aac3', 1, 0, CAST(0x0000A2450118AA00 AS DateTime), N'user', CAST(0x0000A2450118C620 AS DateTime), N'user', NULL, NULL, N'0dfa6e25-c0bc-4ceb-a82b-a2450101437b', N'e20326de-50c9-46df-b118-a24500fb10bb', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'e47abfa6-084f-4370-9898-a2450118d8fe', 1, 0, CAST(0x0000A2450118D8E0 AS DateTime), N'user', CAST(0x0000A2450118F050 AS DateTime), N'user', NULL, NULL, N'01797d10-e029-4474-90c1-a2450110a709', N'e20326de-50c9-46df-b118-a24500fb10bb', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)
INSERT [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order]) VALUES (N'eb09664c-3357-4005-b05a-a24501190263', 1, 0, CAST(0x0000A245011901E4 AS DateTime), N'user', CAST(0x0000A24501191828 AS DateTime), N'user', NULL, NULL, N'd1562284-ce3f-4297-a327-a2450110e9eb', N'e20326de-50c9-46df-b118-a24500fb10bb', N'36a6bc53-9fe4-4cba-a9f0-a24400c4e898', 0)

INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'4a8c86fd-85ab-4458-a902-a23e00b4c8e6', 1, 0, CAST(0x0000A23E00B4C8DC AS DateTime), N'user', CAST(0x0000A23E00B4C8DC AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'Find Us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'b0402058-1374-46fd-aa6b-a23e00b8eed2', 1, 0, CAST(0x0000A23E00B8EE94 AS DateTime), N'user', CAST(0x0000A23E00B8EE94 AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'https://www.facebook.com/DevBridge', N'facebookUrl', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'e1c5fd29-9a6d-47fa-b63b-a23e00b9f137', 1, 0, CAST(0x0000A23E00B9F064 AS DateTime), N'user', CAST(0x0000A23E00BBC524 AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'Facebook', N'facebookTitle', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'08244146-1368-47fd-970a-a23e00bb5b99', 1, 0, CAST(0x0000A23E00BB5A80 AS DateTime), N'user', CAST(0x0000A23E00BB5A80 AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'8478f08d-d986-4522-b610-a23e00c0d147', 1, 0, CAST(0x0000A23E00C0D08C AS DateTime), N'user', CAST(0x0000A23E00C0D08C AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'a8cca691-3bee-40d3-b4e7-a23e00c2104c', 1, 0, CAST(0x0000A23E00C20F4C AS DateTime), N'user', CAST(0x0000A23E00C20F4C AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'c02a210b-f3d1-4d13-9105-a23e00c5b6da', 1, 0, CAST(0x0000A23E00C5B674 AS DateTime), N'user', CAST(0x0000A23E00C5B674 AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'a96d409c-23af-461e-9238-a23e00c86d22', 1, 0, CAST(0x0000A23E00C86C34 AS DateTime), N'user', CAST(0x0000A23E00C86C34 AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'88b0db2e-08bb-4799-9f57-a23e00cca727', 1, 0, CAST(0x0000A23E00CCA704 AS DateTime), N'user', CAST(0x0000A23E00CCA704 AS DateTime), N'user', NULL, NULL, N'8d3cc02c-7f66-42c8-b55b-a23e00b47ebe', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'6a62dc52-2630-4414-8c16-a2440112e2cd', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'3df8789d-9f78-4df3-8839-a2440112e2d1', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'1ff5fa7b-2657-402b-983a-a2440112e2d1', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'e83c0d77-73ac-47c8-8fd9-a2440112e2d2', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'85d0c965-e4a6-4c52-9060-a2440112e2d2', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'05579bff-96d1-4d93-910a-a2440112e2d2', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'89c36451-00bf-4061-bc4b-a2440112e2d3', 1, 0, CAST(0x0000A2440112E1EC AS DateTime), N'user', CAST(0x0000A2440112E1EC AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'f4033d5e-428d-420c-a918-a2440122a10e', 1, 0, CAST(0x0000A2440122A000 AS DateTime), N'user', CAST(0x0000A2440122A000 AS DateTime), N'user', NULL, NULL, N'a6a58613-87a5-47c1-87ad-a24401127b78', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'f01d1b54-c77b-437f-8657-a24500e8da02', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'5888d511-2726-4356-9044-a24500e8da03', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'63796027-4c3f-49b0-9a04-a24500e8da03', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'3a0e1ff1-65b7-486d-9269-a24500e8da04', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'a1d86894-b99f-4d11-9cc5-a24500e8da04', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'ba2f15ab-db92-44f2-898b-a24500e8da05', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'db3cd241-01bd-4fd8-aeed-a24500e8da05', 1, 0, CAST(0x0000A24500E8D9C4 AS DateTime), N'user', CAST(0x0000A24500E8D9C4 AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'084075c6-7482-46e0-94c7-a24500e906b7', 1, 0, CAST(0x0000A24500E9064C AS DateTime), N'user', CAST(0x0000A24500E9064C AS DateTime), N'user', NULL, NULL, N'ebfb0ef5-4b34-43fd-97d6-a24500e86dde', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'ba58d10f-0440-46ce-aa35-a24500ec5ff8', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'f2384f07-8eda-484d-97a5-a24500ec5ff9', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'a9ae86ef-201a-41ec-bd7a-a24500ec5ff9', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'13651f02-2d89-4259-921d-a24500ec5ffa', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'cadbc6f5-c2d6-4654-b3df-a24500ec5ffa', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'1a80b10b-0a80-466d-bc4d-a24500ec5ffa', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'256bf050-599c-4167-b3d1-a24500ec5ffb', 1, 0, CAST(0x0000A24500EC5EF0 AS DateTime), N'user', CAST(0x0000A24500EC5EF0 AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'235df59c-4b4d-4df4-bde8-a24500ed33c9', 1, 0, CAST(0x0000A24500ED330C AS DateTime), N'user', CAST(0x0000A24500ED330C AS DateTime), N'user', NULL, NULL, N'0e04b6a9-baf1-4001-b001-a24500ec1d91', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'b9f57fb9-6b68-45f7-934a-a24500edd4a1', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'd54effab-ba2e-41bf-8ab0-a24500edd4a2', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'596da8c6-9bb4-4b20-8f2e-a24500edd4a2', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'8fc3aad5-8ed8-40da-ae0a-a24500edd4a2', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'03e9fc1b-7595-4afa-bdd1-a24500edd4a2', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'afaab21d-eceb-4e39-801b-a24500edd4a3', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'bc67a37c-a111-438b-ab46-a24500edd4a3', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'50071bba-8079-4ec7-ba6e-a24500edd4a3', 1, 0, CAST(0x0000A24500EDD398 AS DateTime), N'user', CAST(0x0000A24500EDD398 AS DateTime), N'user', NULL, NULL, N'a6b0bd2e-9252-4430-a117-a24500edd4a2', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'89c4e275-4bd6-41b4-8808-a2450101cd8e', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'5fdbbc5f-495b-4799-98a1-a2450101cd8f', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'3dccc371-376b-47f6-8df9-a2450101cd90', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'3e3e701a-c6ab-4b5f-9aa3-a2450101cd90', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'd53e284a-7fb0-4aac-9872-a2450101cd91', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'fe2b2989-2c36-4cbf-a09a-a2450101cd91', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'932b3e6b-17cd-4bf9-b68c-a2450101cd91', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'c19680a9-a020-42aa-a9cb-a2450101cd92', 1, 0, CAST(0x0000A2450101CC7C AS DateTime), N'user', CAST(0x0000A2450101CC7C AS DateTime), N'user', NULL, NULL, N'2055f38b-cd79-4657-b1e5-a24501018672', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'1b6938ef-9702-4c46-bcca-a2450110a70a', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'36b8448b-383a-439b-8d74-a2450110a70b', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'81421978-55fe-4144-933d-a2450110a70b', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'6a6bf407-a1c2-450f-9cd4-a2450110a70b', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'1a6790af-2638-46d1-a0d5-a2450110a70b', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'5ac85f94-ad78-4ecd-8017-a2450110a70c', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'ec2ae5dd-302d-449b-8dd2-a2450110a70c', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'f5db8649-1f17-4945-9ccb-a2450110a70c', 1, 0, CAST(0x0000A2450110A60C AS DateTime), N'user', CAST(0x0000A2450110A60C AS DateTime), N'user', NULL, NULL, N'75ca12d9-97b6-4ab0-891a-a2450110a70a', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'b28736f8-6879-478c-b8d0-a2450110e9eb', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'facebookShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'e9f35a75-0da0-48db-9457-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'twitterShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'7a093ded-42a3-48b2-98c1-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'flickrShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'f9615897-ac21-4753-9ae4-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'Find us on', N'title', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'4dc2f13c-6940-4298-a434-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'youtubeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'ab17a9aa-77cc-422d-a4d3-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'linkedinShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'0cd8ba17-d761-4480-aaf0-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'useSideBox', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'c35c844c-476e-4aea-ba07-a2450110e9ec', 1, 0, CAST(0x0000A2450110E8D8 AS DateTime), N'user', CAST(0x0000A2450110E8D8 AS DateTime), N'user', NULL, NULL, N'07a5438e-8f7a-4a17-9651-a2450110e9eb', N'true', N'skypeShouldRender', 5)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'e8b690de-88ce-4f5b-b726-a245011851af', 1, 0, CAST(0x0000A245011850F0 AS DateTime), N'user', CAST(0x0000A245011850F0 AS DateTime), N'user', NULL, NULL, N'4f2785fb-4333-4cd7-9f6e-a24500fb2d43', N'/news/', N'parentUrl', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'46183008-4a5f-47f1-994b-a245011872c0', 1, 0, CAST(0x0000A245011871C0 AS DateTime), N'user', CAST(0x0000A245011871C0 AS DateTime), N'user', NULL, NULL, N'60ca29aa-8d40-4d76-b5bd-a24500fb8722', N'/news/', N'parentUrl', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'4c965bdc-5499-4fcb-980d-a245011887d6', 1, 0, CAST(0x0000A245011886D8 AS DateTime), N'user', CAST(0x0000A245011886D8 AS DateTime), N'user', NULL, NULL, N'64919785-7166-4406-9b64-a24500fba0c9', N'/news/', N'parentUrl', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'4199284b-e0e6-48b5-b003-a2450118bf7a', 1, 0, CAST(0x0000A2450118BF18 AS DateTime), N'user', CAST(0x0000A2450118BF18 AS DateTime), N'user', NULL, NULL, N'c0a1d40c-8d74-4b5d-a187-a2450118aac3', N'/about-us/', N'parentUrl', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'6b445940-3248-43fc-beb3-a2450118e96d', 1, 0, CAST(0x0000A2450118E948 AS DateTime), N'user', CAST(0x0000A2450118E948 AS DateTime), N'user', NULL, NULL, N'e47abfa6-084f-4370-9898-a2450118d8fe', N'/about-us/', N'parentUrl', 1)
INSERT [bcms_root].[PageContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageContentId], [Value], [Key], [Type]) VALUES (N'30376e3a-dada-4060-88ec-a245011912d7', 1, 0, CAST(0x0000A2450119124C AS DateTime), N'user', CAST(0x0000A2450119124C AS DateTime), N'user', NULL, NULL, N'eb09664c-3357-4005-b05a-a24501190263', N'/about-us/', N'parentUrl', 1)

-- enable all constraints
EXEC sp_msforeachtable @command1="print '?'", @command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"

