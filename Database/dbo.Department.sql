CREATE TABLE [dbo].[Department] (
    [D_Id]    INT            IDENTITY (1, 1) NOT NULL,
    [D_name]  NVARCHAR (100) NOT NULL,
    [Faculty] NVARCHAR (50)  NOT NULL,
    [U_Id]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([D_Id] ASC),
    UNIQUE NONCLUSTERED ([D_name] ASC),
    FOREIGN KEY ([U_Id]) REFERENCES [dbo].[User] ([U_Id])
);

