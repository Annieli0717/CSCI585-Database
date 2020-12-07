-- livesql.oracle.com
CREATE TABLE Instructors(
    Instructor CHAR(15) NOT NULL,
    HourlyRate INTEGER NOT NULL, 
    Subject CHAR(30) NOT NULL,
    PRIMARY KEY (Instructor, Subject));  

INSERT INTO Instructors VALUES ('Aleph', 20, 'Scratch');        
INSERT INTO Instructors VALUES ('Aleph', 20, 'Java');         
INSERT INTO Instructors VALUES ('Aleph', 20, 'Processing');    
-- 100*20 = 2000   
INSERT INTO Instructors VALUES ('Bit', 20, 'Python');
INSERT INTO Instructors VALUES ('Bit', 20, 'Javascript');
INSERT INTO Instructors VALUES ('Bit', 20, 'Java'); 
-- 100 * 20 = 2000
INSERT INTO Instructors VALUES ('CRC', 30, 'Python');
INSERT INTO Instructors VALUES ('CRC', 30, 'Javascript');
 -- 50 * 30 = 1500
INSERT INTO Instructors VALUES ('Dat', 20, 'Scratch');
INSERT INTO Instructors VALUES ('Dat', 20, 'Python');
INSERT INTO Instructors VALUES ('Dat', 20, 'Javascript');
 -- 80 * 20 = 1600
INSERT INTO Instructors VALUES ('Emscr', 10, 'Scratch');
INSERT INTO Instructors VALUES ('Emscr', 10, 'Processing');
INSERT INTO Instructors VALUES ('Emscr', 10, 'Javascript');
INSERT INTO Instructors VALUES ('Emscr', 10, 'Python'); 
-- 100 * 10 = 1000

CREATE TABLE Subjects(
    Subject Char(30),
    NumStudentsEnrolled INTEGER, 
    PRIMARY KEY(Subject));

INSERT INTO Subjects VALUES ('Javascript', 10); 
INSERT INTO Subjects VALUES ('Processing', 20); 
INSERT INTO Subjects VALUES ('Scratch', 30); 
INSERT INTO Subjects VALUES ('Python', 40); 
INSERT INTO Subjects VALUES ('Java', 50);

-- output the highest bonus amount paid
SELECT MAX(SUM(I.HourlyRate * S.NumStudentsEnrolled  * 0.1)) AS MaxBonus
FROM Instructors I JOIN Subjects S
ON I.Subject = S.Subject
GROUP BY I.Instructor;

-- output a list of instructors with the highest bonus amount paid
SELECT I.Instructor, SUM(I.HourlyRate * S.NumStudentsEnrolled  * 0.1) AS TotalBonus
FROM Instructors I JOIN Subjects S
ON I.Subject = S.Subject
GROUP BY I.Instructor
HAVING SUM(I.HourlyRate * S.NumStudentsEnrolled  * 0.1) = 
(SELECT MAX(SUM(I.HourlyRate * S.NumStudentsEnrolled  * 0.1)) AS maxBonus
FROM Instructors I JOIN Subjects S
ON I.Subject = S.Subject
GROUP BY I.Instructor);