USE [Kursova]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStudentRating]    Script Date: 05.01.2026 0:45:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_GetStudentRating]
    @AcademicYear INT,
    @Semester INT,
    @TopN INT = 100
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH r AS (
        SELECT
            s.StudentID,
            s.LastName,
            s.FirstName,
            g.GroupCode,
            AVG(CAST(gr.GradeValue AS DECIMAL(10,2))) AS AvgGrade
        FROM dbo.Grade gr
        JOIN dbo.Student s ON s.StudentID = gr.StudentID
        JOIN dbo.[Group] g ON g.GroupID = s.GroupID
        WHERE gr.AcademicYear = @AcademicYear
          AND gr.Semester = @Semester
        GROUP BY s.StudentID, s.LastName, s.FirstName, g.GroupCode
    )
    SELECT TOP (@TopN)
        StudentID, LastName, FirstName, GroupCode,
        CAST(AvgGrade AS DECIMAL(5,2)) AS AvgGrade,
        DENSE_RANK() OVER (ORDER BY AvgGrade DESC) AS RatingPosition
    FROM r
    ORDER BY AvgGrade DESC, LastName, FirstName;
END
GO


