CREATE TABLE [dbo].[User] (
    [U_Id]      INT            IDENTITY (1, 1) NOT NULL,
    [U_fname]   NVARCHAR (20)  NULL,
    [U_lname]   NVARCHAR (20)  NULL,
    [U_email]   NVARCHAR (255) NULL,
    [U_contact] NVARCHAR (12)  NULL,
    [Username]  NVARCHAR (50)  NULL,
    [Password]  NVARCHAR (50)  NULL,
    [type]      NVARCHAR (20)  NULL,
    PRIMARY KEY CLUSTERED ([U_Id] ASC),
    UNIQUE NONCLUSTERED ([Username] ASC)
);

