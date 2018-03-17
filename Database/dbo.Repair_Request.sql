CREATE TABLE [dbo].[Repair_Request] (
    [Rr_Id]            INT          IDENTITY (1, 1) NOT NULL,
    [A_id]             INT          NOT NULL,
    [Date_of_request]  DATE         NOT NULL,
    [Date_of_Approval] DATE         NULL,
    [amount_est]       MONEY        NOT NULL,
    [amount_actual]    MONEY        NULL,
    [Req_status]       VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Rr_Id] ASC),
    FOREIGN KEY ([A_id]) REFERENCES [dbo].[Asset] ([A_Id])
);

