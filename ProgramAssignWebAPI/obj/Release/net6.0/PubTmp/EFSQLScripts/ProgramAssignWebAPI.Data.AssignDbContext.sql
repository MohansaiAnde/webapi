IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230121112707_InitialTableSetup9')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230121112707_InitialTableSetup9', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230122132355_addTechTracksList')
BEGIN
    CREATE TABLE [TechTracks] (
        [Id] int NOT NULL IDENTITY,
        [TechTrack] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_TechTracks] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230122132355_addTechTracksList')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230122132355_addTechTracksList', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230125173413_updatedatecolumn')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ResourceMangerAssignments]') AND [c].[name] = N'StartDate');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [ResourceMangerAssignments] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [ResourceMangerAssignments] ALTER COLUMN [StartDate] Date NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230125173413_updatedatecolumn')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ResourceMangerAssignments]') AND [c].[name] = N'EndDate');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [ResourceMangerAssignments] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [ResourceMangerAssignments] ALTER COLUMN [EndDate] Date NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230125173413_updatedatecolumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230125173413_updatedatecolumn', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230129093422_UserDeatails')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230129093422_UserDeatails', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230129093807_UserDeatails1')
BEGIN
    CREATE TABLE [UserInfo] (
        [Id] int NOT NULL IDENTITY,
        [VAMId] int NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_UserInfo] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230129093807_UserDeatails1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230129093807_UserDeatails1', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230129105543_addedEmail')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [Email] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230129105543_addedEmail')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230129105543_addedEmail', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230204104322_HistoryColumn2')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [HistoryProgramTrackerId] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230204104322_HistoryColumn2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230204104322_HistoryColumn2', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [PeriodEnd] datetime2 NOT NULL DEFAULT '9999-12-31T23:59:59.9999999';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [PeriodStart] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    EXEC(N'ALTER TABLE [ResourceMangerAssignments] ADD PERIOD FOR SYSTEM_TIME ([PeriodStart], [PeriodEnd])')
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ALTER COLUMN [PeriodStart] ADD HIDDEN
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ALTER COLUMN [PeriodEnd] ADD HIDDEN
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    DECLARE @historyTableSchema sysname = SCHEMA_NAME()
    EXEC(N'ALTER TABLE [ResourceMangerAssignments] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [' + @historyTableSchema + '].[ResourceMangerAssignmentsHistory]))')

END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230205141907_historytable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230205141907_historytable', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230207100507_ProhramsHistoryTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230207100507_ProhramsHistoryTable', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230207100913_ProgramsHistorytable1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230207100913_ProgramsHistorytable1', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209041520_UserInfoUpdates')
BEGIN
    ALTER TABLE [UserInfo] ADD [Role] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209041520_UserInfoUpdates')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209041520_UserInfoUpdates', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213085756_EmployeesTable')
BEGIN
    CREATE TABLE [Employees] (
        [Id] int NOT NULL IDENTITY,
        [VAMID] int NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [Password] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Employees] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213085756_EmployeesTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230213085756_EmployeesTable', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217182606_customHistoryTable1')
BEGIN
    CREATE TABLE [ResourceManagerAssignmentsHistory] (
        [HistoryId] int NOT NULL IDENTITY,
        [Id] int NOT NULL,
        [VAMID] int NOT NULL,
        [TechTrack] nvarchar(max) NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [ResourceName] nvarchar(max) NOT NULL,
        [StartDate] Date NOT NULL,
        [EndDate] Date NOT NULL,
        [Manager] nvarchar(max) NOT NULL,
        [SME] nvarchar(max) NOT NULL,
        [SMEStatus] nvarchar(max) NOT NULL,
        [ProgramStatus] nvarchar(max) NOT NULL,
        [ProgramsTrackerId] int NOT NULL,
        [HistoryProgramTrackerId] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_ResourceManagerAssignmentsHistory] PRIMARY KEY ([HistoryId]),
        CONSTRAINT [FK_ResourceManagerAssignmentsHistory_ProgramsTracker_ProgramsTrackerId] FOREIGN KEY ([ProgramsTrackerId]) REFERENCES [ProgramsTracker] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217182606_customHistoryTable1')
BEGIN
    CREATE INDEX [IX_ResourceManagerAssignmentsHistory_ProgramsTrackerId] ON [ResourceManagerAssignmentsHistory] ([ProgramsTrackerId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217182606_customHistoryTable1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230217182606_customHistoryTable1', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217184929_removeHistoryTable1')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] SET (SYSTEM_VERSIONING = OFF)

END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217184929_removeHistoryTable1')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] DROP PERIOD FOR SYSTEM_TIME

END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217184929_removeHistoryTable1')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ResourceMangerAssignments]') AND [c].[name] = N'PeriodEnd');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [ResourceMangerAssignments] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [ResourceMangerAssignments] DROP COLUMN [PeriodEnd];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217184929_removeHistoryTable1')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ResourceMangerAssignments]') AND [c].[name] = N'PeriodStart');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [ResourceMangerAssignments] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [ResourceMangerAssignments] DROP COLUMN [PeriodStart];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217184929_removeHistoryTable1')
BEGIN
    DROP TABLE [ResourceMangerAssignmentsHistory];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217184929_removeHistoryTable1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230217184929_removeHistoryTable1', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217193620_UpdateCeHistoryTable2')
BEGIN
    ALTER TABLE [ResourceManagerAssignmentsHistory] ADD [ActionType] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217193620_UpdateCeHistoryTable2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230217193620_UpdateCeHistoryTable2', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219190730_FKFileTypeToProgramTracker2')
BEGIN
    ALTER TABLE [ProgramsTracker] ADD [FileDetailsID] int NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219190730_FKFileTypeToProgramTracker2')
BEGIN
    CREATE INDEX [IX_ProgramsTracker_FileDetailsID] ON [ProgramsTracker] ([FileDetailsID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219190730_FKFileTypeToProgramTracker2')
BEGIN
    ALTER TABLE [ProgramsTracker] ADD CONSTRAINT [FK_ProgramsTracker_FileDetails_FileDetailsID] FOREIGN KEY ([FileDetailsID]) REFERENCES [FileDetails] ([ID]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219190730_FKFileTypeToProgramTracker2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230219190730_FKFileTypeToProgramTracker2', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219192936_FKFileTypeToProgramTracker3')
BEGIN
    ALTER TABLE [ProgramsTracker] DROP CONSTRAINT [FK_ProgramsTracker_FileDetails_FileDetailsID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219192936_FKFileTypeToProgramTracker3')
BEGIN
    DROP INDEX [IX_ProgramsTracker_FileDetailsID] ON [ProgramsTracker];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219192936_FKFileTypeToProgramTracker3')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ProgramsTracker]') AND [c].[name] = N'FileDetailsID');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [ProgramsTracker] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [ProgramsTracker] DROP COLUMN [FileDetailsID];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219192936_FKFileTypeToProgramTracker3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230219192936_FKFileTypeToProgramTracker3', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219193553_FilesDetailsToHistory')
BEGIN
    ALTER TABLE [ResourceManagerAssignmentsHistory] ADD [FileDetailsId] int NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219193553_FilesDetailsToHistory')
BEGIN
    CREATE INDEX [IX_ResourceManagerAssignmentsHistory_FileDetailsId] ON [ResourceManagerAssignmentsHistory] ([FileDetailsId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219193553_FilesDetailsToHistory')
BEGIN
    ALTER TABLE [ResourceManagerAssignmentsHistory] ADD CONSTRAINT [FK_ResourceManagerAssignmentsHistory_FileDetails_FileDetailsId] FOREIGN KEY ([FileDetailsId]) REFERENCES [FileDetails] ([ID]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219193553_FilesDetailsToHistory')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230219193553_FilesDetailsToHistory', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222092404_SMECommentsColumn')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [ProgramCode] nvarchar(max) NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222092404_SMECommentsColumn')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [SMEComments] nvarchar(max) NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222092404_SMECommentsColumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230222092404_SMECommentsColumn', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222094733_smecomments')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230222094733_smecomments', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222095936_smecomments1')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [ProgramCode] nvarchar(max) NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222095936_smecomments1')
BEGIN
    ALTER TABLE [ResourceMangerAssignments] ADD [SMEComments] nvarchar(max) NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230222095936_smecomments1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230222095936_smecomments1', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230223171021_smecommentslatest')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ResourceMangerAssignments]') AND [c].[name] = N'SMEComments');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [ResourceMangerAssignments] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [ResourceMangerAssignments] ALTER COLUMN [SMEComments] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230223171021_smecommentslatest')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ResourceMangerAssignments]') AND [c].[name] = N'ProgramCode');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [ResourceMangerAssignments] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [ResourceMangerAssignments] ALTER COLUMN [ProgramCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230223171021_smecommentslatest')
BEGIN
    ALTER TABLE [ResourceManagerAssignmentsHistory] ADD [ProgramCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230223171021_smecommentslatest')
BEGIN
    ALTER TABLE [ResourceManagerAssignmentsHistory] ADD [SMEComments] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230223171021_smecommentslatest')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230223171021_smecommentslatest', N'7.0.2');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230228115714_filedetailsid')
BEGIN
    ALTER TABLE [ResourceManagerAssignmentsHistory] ADD [FileDetailsId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230228115714_filedetailsid')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230228115714_filedetailsid', N'7.0.2');
END;
GO

COMMIT;
GO

