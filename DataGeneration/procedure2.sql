USE [Kursova]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStudentsByGroup]    Script Date: 05.01.2026 0:45:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_GetStudentsByGroup]
    @GroupID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT s.StudentID, s.LastName, s.FirstName, s.BirthDate, s.Gender, s.EnrollmentYear, s.Status,
           g.GroupCode
    FROM dbo.Student s
    JOIN dbo.[Group] g ON g.GroupID = s.GroupID
    WHERE s.GroupID = @GroupID
    ORDER BY s.LastName, s.FirstName;
END
GO


