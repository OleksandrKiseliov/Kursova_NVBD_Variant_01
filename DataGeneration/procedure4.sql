USE [Kursova]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetBookDebtorsOverYear]    Script Date: 05.01.2026 0:45:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_GetBookDebtorsOverYear]
    @AsOfDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @AsOfDate IS NULL SET @AsOfDate = CONVERT(DATE, GETDATE());

    SELECT
        s.StudentID, s.LastName, s.FirstName,
        b.BookID, b.Title, b.Author,
        bl.LoanDate,
        DATEDIFF(DAY, bl.LoanDate, @AsOfDate) AS DaysOverdue
    FROM dbo.BookLoan bl
    JOIN dbo.Student s ON s.StudentID = bl.StudentID
    JOIN dbo.Book b ON b.BookID = bl.BookID
    WHERE bl.ReturnDate IS NULL
      AND DATEDIFF(DAY, bl.LoanDate, @AsOfDate) > 365
    ORDER BY DaysOverdue DESC, s.LastName, s.FirstName;
END
GO


