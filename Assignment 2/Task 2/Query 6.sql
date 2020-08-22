SELECT sleeppatterns.date, timeAsleep, grade.grade FROM pulselearning.sleeppatterns, pulselearning.grade AS yeet
INNER JOIN pulselearning.grade grade ON sleeppatterns.studentID = grade.studentID
WHERE date LIKE '%04%' AND timeAsleep<=6;