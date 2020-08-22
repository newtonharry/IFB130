SELECT unittutor.staffID, tutor.firstName, tutor.surname, tutor.email
FROM pulselearning.tutor, pulselearning.unit, pulselearning.unittutor
WHERE tutor.staffID = unittutor.staffID
AND unit.unitID = unittutor.unitID 
AND unit.semester != 2
GROUP BY tutor.staffID;
