-- livesql.oracle.com
CREATE TABLE Enrollment 
(SID INTEGER NOT NULL,
ClassName VARCHAR(20) NOT NULL,
Grade CHAR(10) NOT NULL);
    

INSERT INTO Enrollment VALUES (123, 'Processing', 'A');
INSERT INTO Enrollment VALUES (123, 'Python', 'B');
INSERT INTO Enrollment VALUES (123, 'Scratch', 'B');
INSERT INTO Enrollment VALUES (662, 'Java', 'B');
INSERT INTO Enrollment VALUES (662, 'Python',  'A');
INSERT INTO Enrollment VALUES (662, 'JavaScript', 'A');
INSERT INTO Enrollment VALUES (662, 'Scratch', 'B');
INSERT INTO Enrollment VALUES (345, 'Scratch', 'A');
INSERT INTO Enrollment VALUES (345, 'JavaScript', 'B');
INSERT INTO Enrollment VALUES (345, 'Python', 'A');
INSERT INTO Enrollment VALUES (555, 'Python', 'B');
INSERT INTO Enrollment VALUES (555, 'JavaScript', 'B');
INSERT INTO Enrollment VALUES (213, 'JavaScript', 'A');


SELECT ClassName, COUNT(*) AS Total
FROM Enrollment
GROUP BY ClassName
ORDER BY Total DESC;