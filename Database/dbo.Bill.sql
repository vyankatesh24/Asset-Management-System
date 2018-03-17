CREATE TABLE [dbo].[Bill] (
    [B_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [BillNo]        NVARCHAR (10)  NULL,
    [VendorName]    NVARCHAR (255) NULL,
    [VendorAddress] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([B_Id] ASC),
    UNIQUE NONCLUSTERED ([BillNo] ASC, [VendorName] ASC)
);

