SELECT firstName, surname, buddyID FROM pulselearning.student
WHERE buddyID IS NOT NULL
ORDER BY surname;