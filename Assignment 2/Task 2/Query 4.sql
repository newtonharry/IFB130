SELECT assignment.assignmentID, assignment.assignmentName, MIN(grade), MAX(grade), AVG(grade), COUNT(grade.assignmentID) FROM pulselearning.assignment
LEFT JOIN pulselearning.grade ON assignment.assignmentID = grade.assignmentID
GROUP BY assignmentID;

# INNER JOIN also viable, unsure if lecturer wants all the assignment names
# or just ones with grade data.