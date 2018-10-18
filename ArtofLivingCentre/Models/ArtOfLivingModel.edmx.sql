
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/30/2018 14:26:51
-- Generated from EDMX file: C:\Users\febin\OneDrive\Documents\FIT5032 - IAD\ArtofLivingCentre\ArtofLivingCentre\Models\ArtOfLivingModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-ArtofLivingCentre-20180909103238];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserConsultation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Consultations] DROP CONSTRAINT [FK_UserConsultation];
GO
IF OBJECT_ID(N'[dbo].[FK_ConsultantConsultation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Consultations] DROP CONSTRAINT [FK_ConsultantConsultation];
GO
IF OBJECT_ID(N'[dbo].[FK_UserTestimonial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Testimonials] DROP CONSTRAINT [FK_UserTestimonial];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Consultations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Consultations];
GO
IF OBJECT_ID(N'[dbo].[Testimonials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Testimonials];
GO
IF OBJECT_ID(N'[dbo].[Consultants]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Consultants];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Consultations'
CREATE TABLE [dbo].[Consultations] (
    [ConsultationId] int IDENTITY(1,1) NOT NULL,
    [StartDateTime] datetime  NOT NULL,
    [EndDateTime] datetime  NOT NULL,
    [ReservationTitle] nvarchar(max)  NOT NULL,
    [ReservationStatus] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL,
    [ConsultantId] int  NOT NULL
);
GO

-- Creating table 'Testimonials'
CREATE TABLE [dbo].[Testimonials] (
    [ReviewId] int IDENTITY(1,1) NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Review] nvarchar(max)  NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [Likes] bigint  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Consultants'
CREATE TABLE [dbo].[Consultants] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NULL,
    [Specialization] nvarchar(max)  NOT NULL,
    [ContactNo] nvarchar(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [DoB] datetime  NULL,
    [PhoneNo] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ConsultationId] in table 'Consultations'
ALTER TABLE [dbo].[Consultations]
ADD CONSTRAINT [PK_Consultations]
    PRIMARY KEY CLUSTERED ([ConsultationId] ASC);
GO

-- Creating primary key on [ReviewId] in table 'Testimonials'
ALTER TABLE [dbo].[Testimonials]
ADD CONSTRAINT [PK_Testimonials]
    PRIMARY KEY CLUSTERED ([ReviewId] ASC);
GO

-- Creating primary key on [Id] in table 'Consultants'
ALTER TABLE [dbo].[Consultants]
ADD CONSTRAINT [PK_Consultants]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Consultations'
ALTER TABLE [dbo].[Consultations]
ADD CONSTRAINT [FK_UserConsultation]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserConsultation'
CREATE INDEX [IX_FK_UserConsultation]
ON [dbo].[Consultations]
    ([UserId]);
GO

-- Creating foreign key on [ConsultantId] in table 'Consultations'
ALTER TABLE [dbo].[Consultations]
ADD CONSTRAINT [FK_ConsultantConsultation]
    FOREIGN KEY ([ConsultantId])
    REFERENCES [dbo].[Consultants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConsultantConsultation'
CREATE INDEX [IX_FK_ConsultantConsultation]
ON [dbo].[Consultations]
    ([ConsultantId]);
GO

-- Creating foreign key on [UserId] in table 'Testimonials'
ALTER TABLE [dbo].[Testimonials]
ADD CONSTRAINT [FK_UserTestimonial]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTestimonial'
CREATE INDEX [IX_FK_UserTestimonial]
ON [dbo].[Testimonials]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------