CREATE TABLE [dbo].[Scrap_Request] (
    [Sr_Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Date_of_request]    DATE           NULL,
    [Date_of_Approval]   DATE           NULL,
    [Amount_Released]    MONEY          NULL,
    [Amount_Written_off] MONEY          NULL,
    [A_id]               INT            NULL,
    [Req_status]         NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([Sr_Id] ASC),
    FOREIGN KEY ([A_id]) REFERENCES [dbo].[Asset] ([A_Id])
);

