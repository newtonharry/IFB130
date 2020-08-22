# TASK 2 QUERY 1
SELECT studentID, firstName, surname, email FROM pulselearning.student
WHERE suburb LIKE '%Everton%';

# TASK 2 QUERY 2
SELECT firstName, surname, buddyID FROM pulselearning.student
WHERE buddyID IS NOT NULL
ORDER BY surname;

# TASK 2 QUERY 3
SELECT tutor.staffID, firstName, surname, COUNT(unittutor.staffID) AS NumberUnits FROM pulselearning.unittutor
LEFT JOIN pulselearning.tutor ON tutor.staffID = unittutor.staffID GROUP BY staffID;

# TASK 2 QUERY 4
SELECT assignment.assignmentID, assignment.assignmentName, MIN(grade), MAX(grade), AVG(grade), COUNT(grade.assignmentID) FROM pulselearning.assignment
LEFT JOIN pulselearning.grade ON assignment.assignmentID = grade.assignmentID
GROUP BY assignmentID;

# INNER JOIN also viable, unsure if lecturer wants all the assignment names
# or just ones with grade data.

# TASK 2 QUERY 5
SELECT unittutor.staffID, tutor.firstName, tutor.surname, tutor.email
FROM pulselearning.tutor, pulselearning.unit, pulselearning.unittutor
WHERE tutor.staffID = unittutor.staffID
AND unit.unitID = unittutor.unitID 
AND unit.semester != 2
GROUP BY tutor.staffID;

# TASK 2 QUERY 6
SELECT sleeppatterns.date, timeAsleep, grade.grade FROM pulselearning.sleeppatterns, pulselearning.grade AS yeet
INNER JOIN pulselearning.grade grade ON sleeppatterns.studentID = grade.studentID
WHERE date LIKE '%04%' AND timeAsleep<=6;

# TASK 3 Insert
INSERT INTO `pulselearning`.`unit` (`unitName`, `unitCode`, `year`, `semester`) 
VALUES ('Advanced Database Management', 'IFB801', 2019, '1');

# TASK 3 Delete
DELETE FROM pulselearning.phonenumber
WHERE phonenumber LIKE '02%';

# TASK 3 Update
UPDATE pulselearning.student
SET streetNumber = 72, streetName = 'Evergreen Terrace', suburb = 'Springfield'
WHERE surname = 'Smith' AND streetName = 'Zelda Street';

# TASK 4 Create Index
CREATE INDEX idx_assignmentName
ON assignment (assignmentName);

# TASK 4 Create View
#DROP VIEW unenrolledStudents;
#--- drop view was for debugging purposes

CREATE VIEW unenrolledStudents 
AS SELECT pulselearning.student.firstName, pulselearning.student.surname, pulselearning.student.studentID 
FROM pulselearning.student, pulselearning.enrolments
LEFT JOIN pulselearning.student nStudent ON nStudent.studentID = enrolments.studentID
WHERE unitID IS NULL
;

SELECT * FROM unenrolledStudents;

# TASK 5
GRANT SELECT ON  student TO nikki;
GRANT INSERT ON  student TO nikki;

GRANT DELETE ON student TO nikki;

REVOKE INSERT ON student FROM jake;

REVOKE DELETE ON student FROM jake;
