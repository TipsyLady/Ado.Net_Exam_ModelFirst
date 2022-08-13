
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/09/2022 11:59:48
-- Generated from EDMX file: C:\Users\Marin\source\repos\Ado.Net_Exam_Taxi\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TaxiDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'VehicleSet'
CREATE TABLE [dbo].[VehicleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Manufacturer] nvarchar(50)  NOT NULL,
    [Model] nvarchar(50)  NOT NULL,
    [Production_date] datetime  NOT NULL,
    [Number] nvarchar(10)  NOT NULL,
    [Driver_Id] int  NOT NULL
);
GO

-- Creating table 'DriversSet'
CREATE TABLE [dbo].[DriversSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [First_Name] nvarchar(50)  NOT NULL,
    [Last_Name] nvarchar(50)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [Photo] varbinary(max)  NULL,
    [Rate_index] int  NOT NULL
);
GO

-- Creating table 'ClientsSet'
CREATE TABLE [dbo].[ClientsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [First_Name] nvarchar(50)  NULL,
    [Last_Name] nvarchar(50)  NULL,
    [Telephone_number] int  NOT NULL,
    [Rate_index] int  NOT NULL
);
GO

-- Creating table 'OrderSet'
CREATE TABLE [dbo].[OrderSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address_from] nvarchar(max)  NOT NULL,
    [Address_to] nvarchar(max)  NOT NULL,
    [Order_time] datetime  NOT NULL,
    [Order_cost] float  NOT NULL,
    [Order_status] nvarchar(30)  NOT NULL,
    [ClientsId] int  NOT NULL,
    [DriversId] int  NULL,
    [VehicleId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'VehicleSet'
ALTER TABLE [dbo].[VehicleSet]
ADD CONSTRAINT [PK_VehicleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DriversSet'
ALTER TABLE [dbo].[DriversSet]
ADD CONSTRAINT [PK_DriversSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClientsSet'
ALTER TABLE [dbo].[ClientsSet]
ADD CONSTRAINT [PK_ClientsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [PK_OrderSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClientsId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_OrderClients]
    FOREIGN KEY ([ClientsId])
    REFERENCES [dbo].[ClientsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderClients'
CREATE INDEX [IX_FK_OrderClients]
ON [dbo].[OrderSet]
    ([ClientsId]);
GO

-- Creating foreign key on [Driver_Id] in table 'VehicleSet'
ALTER TABLE [dbo].[VehicleSet]
ADD CONSTRAINT [FK_VehicleDrivers]
    FOREIGN KEY ([Driver_Id])
    REFERENCES [dbo].[DriversSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VehicleDrivers'
CREATE INDEX [IX_FK_VehicleDrivers]
ON [dbo].[VehicleSet]
    ([Driver_Id]);
GO

-- Creating foreign key on [DriversId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_OrderDrivers]
    FOREIGN KEY ([DriversId])
    REFERENCES [dbo].[DriversSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDrivers'
CREATE INDEX [IX_FK_OrderDrivers]
ON [dbo].[OrderSet]
    ([DriversId]);
GO

-- Creating foreign key on [VehicleId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_VehicleOrder]
    FOREIGN KEY ([VehicleId])
    REFERENCES [dbo].[VehicleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VehicleOrder'
CREATE INDEX [IX_FK_VehicleOrder]
ON [dbo].[OrderSet]
    ([VehicleId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------