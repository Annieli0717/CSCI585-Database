-- livesql.oracle.com

-- old table 
CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime));

INSERT INTO ProjectRoomBookings VALUES (1, 7, 10, 'A');
INSERT INTO ProjectRoomBookings VALUES (1, 13, 14, 'B');

SELECT *
FROM ProjectRoomBookings;

-- new table
CREATE TABLE NewProjectRoomBookings
(roomNum INTEGER NOT NULL,
timeForAnHour INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, timeForAnHour));

INSERT INTO NewProjectRoomBookings VALUES (1, 7, 'A');
INSERT INTO NewProjectRoomBookings VALUES (1, 8, 'A');
INSERT INTO NewProjectRoomBookings VALUES (1, 9, 'A');
INSERT INTO NewProjectRoomBookings VALUES (1, 13, 'B');
INSERT INTO NewProjectRoomBookings VALUES (1, 14, 'B');

SELECT * 
FROM NewProjectRoomBookings;

-- (1) 
-- To solve the issue about entered start time could possibly be larger than the end time, I removed the columns start time and end time. 
-- Instead, I used a column called 'timeForAnHour' to represent just one hour [timeForAnHour:00 - timeForAnHour:59]
-- So before, to reserve a room for x hours, users just need to insert once. 
-- But using the new table, users will need to enter x times, one for each hour they want to reserve. 
-- In this way, since we don't require users to enter start time and end time anymore, we avoid illegal cases to happen. 
-- One assumption I here is that the timeForAnHour users entered will be in range of [7,18).

-- (2) 
-- To solve the issue about multiple groups want to reserve the same room at the same time. 
-- I set the combination of room number and timeForAnHour as the primary key, so that one room for an hour can only be reserved to one group, 
-- because all primary keys should be unique. 

