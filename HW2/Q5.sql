-- livesql.oracle.com
CREATE TABLE Instructors(
    Instructor CHAR(15) NOT NULL,
    Subject CHAR(30) NOT NULL,
    PRIMARY KEY (Instructor, Subject));  

INSERT INTO Instructors VALUES ('Aleph', 'Scratch');        
INSERT INTO Instructors VALUES ('Aleph', 'Java');         
INSERT INTO Instructors VALUES ('Aleph', 'Processing');       
INSERT INTO Instructors VALUES ('Bit', 'Python');
INSERT INTO Instructors VALUES ('Bit', 'Javascript');
INSERT INTO Instructors VALUES ('Bit', 'Java');
INSERT INTO Instructors VALUES ('CRC', 'Python');
INSERT INTO Instructors VALUES ('CRC', 'Javascript');
INSERT INTO Instructors VALUES ('Dat', 'Scratch');
INSERT INTO Instructors VALUES ('Dat', 'Python');
INSERT INTO Instructors VALUES ('Dat', 'Javascript');
INSERT INTO Instructors VALUES ('Emscr', 'Scratch');
INSERT INTO Instructors VALUES ('Emscr', 'Processing');
INSERT INTO Instructors VALUES ('Emscr', 'Javascript');
INSERT INTO Instructors VALUES ('Emscr', 'Python');


CREATE TABLE Subjects(
    Subject Char(30) NOT NULL,
    PRIMARY KEY(Subject));

INSERT INTO Subjects VALUES ('Javascript'); 
INSERT INTO Subjects VALUES ('Scratch'); 
INSERT INTO Subjects VALUES ('Python'); 

SELECT Instructor
FROM Instructors JOIN Subjects
ON Instructors.subject = Subjects.subject
GROUP BY Instructor
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subjects)

-- We want to find instructors who teach all the subjects. 
-- First we want to find the intersection of the Instructor table and the Subjects table by using inner join 
-- This will give us instructors with the subjects that are only in the Subjects table
-- Since we want to find instructors who teach all subjects in the Subjects table, for each instructor, the number of intersection must be the total number of subjects in the Subjects table.
-- So I used GROUP BY each instructor, and had constrains on the number of intersections.