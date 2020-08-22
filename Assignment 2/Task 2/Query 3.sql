SELECT tutor.staffID, firstName, surname, COUNT(unittutor.staffID) AS NumberUnits FROM pulselearning.unittutor
LEFT JOIN pulselearning.tutor ON tutor.staffID = unittutor.staffID GROUP BY staffID;