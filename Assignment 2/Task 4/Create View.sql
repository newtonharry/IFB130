#DROP VIEW unenrolledStudents;
#--- drop view was for debugging purposes

CREATE VIEW unenrolledStudents 
AS SELECT pulselearning.student.firstName, pulselearning.student.surname, pulselearning.student.studentID 
FROM pulselearning.student, pulselearning.enrolments
LEFT JOIN pulselearning.student nStudent ON nStudent.studentID = enrolments.studentID
WHERE unitID IS NULL
;

SELECT * FROM unenrolledStudents;