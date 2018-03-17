CREATE TABLE [dbo].[Borrow_Request] (
    [Br_Id]              INT           IDENTITY (1, 1) NOT NULL,
    [A_Id]               INT           NOT NULL,
    [Requesting_dept_id] INT           NULL,
    [Date_of_Request]    DATE          NOT NULL,
    [Date_of_pickup]     DATE          NOT NULL,
    [Date_of_return]     DATE          NOT NULL,
    [Req_status]         NVARCHAR (50) NULL,
    [Date_of_Approval]   DATE          NULL,
    PRIMARY KEY CLUSTERED ([Br_Id] ASC),
    FOREIGN KEY ([A_Id]) REFERENCES [dbo].[Asset] ([A_Id]),
    FOREIGN KEY ([Requesting_dept_id]) REFERENCES [dbo].[Department] ([D_Id])
);

