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


SELECT DISTINCT Instructor 
FROM Instructors I1
WHERE NOT EXISTS (SELECT Subject 
                  FROM Subjects
                  WHERE Subject NOT IN (SELECT Subject 
                                     FROM Instructors I2
                                     WHERE I1.Instructor = I2.Instructor));