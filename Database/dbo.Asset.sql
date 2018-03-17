CREATE TABLE [dbo].[Asset] (
    [A_Id]           INT            IDENTITY (1, 1) NOT NULL,
    [AssetName]      NVARCHAR (100) NOT NULL,
    [Description]    NVARCHAR (100) NULL,
    [Weight]         NVARCHAR (10)  NULL,
    [DateOfPurchase] DATE           NOT NULL,
    [Price]          MONEY          NOT NULL,
    [D_Id]           INT            NULL,
    [B_Id]           INT            NULL,
    [AccessionNo]    NVARCHAR (50)  NULL,
    [BillNo]         NVARCHAR (20)  NOT NULL,
    [VendorName]     NVARCHAR (255) NOT NULL,
    [VendorAddress]  NVARCHAR (255) NOT NULL,
    [status]         NVARCHAR (50)  NULL,
    [warranty]       NVARCHAR (5)   NULL,
    [DateOfAllocate] DATE           NULL,
    PRIMARY KEY CLUSTERED ([A_Id] ASC),
    FOREIGN KEY ([D_Id]) REFERENCES [dbo].[Department] ([D_Id])
);

