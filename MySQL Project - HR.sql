-- 1) Average Attrition rate for all Departments
SELECT Department, AVG(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END) AS AttritionRate
FROM HR_1
GROUP BY Department;

-- 2) Average Hourly rate of Male Research Scientist
SELECT AVG(HourlyRate) AS AverageHourlyRate
FROM HR_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

-- 3) Attrition rate Vs Monthly income stats
SELECT AVG(HR_2.MonthlyIncome) AS AverageMonthlyIncome, HR_1.Attrition
FROM HR_1
JOIN HR_2 ON HR_1.Attrition = HR_2.Attrition
GROUP BY HR_1.Attrition;

-- 4) Average working years for each Department
SELECT HR_1.Department, AVG(HR_2.WorkingYears) AS AverageWorkingYears
FROM HR_1
JOIN HR_2 ON HR_1.Department = HR_2.Department
GROUP BY HR_1.Department;

-- 5) Job Role Vs Work life balance
SELECT HR_1.JobRole, AVG(HR_2.WorkLifeBalance) AS AvgWorkLifeBalance
FROM HR_1
JOIN HR_2 ON HR_1.JobRole = HR_2.JobRole
GROUP BY HR_1.JobRole;

-- 6) Attrition rate Vs Year since last promotion relation
SELECT 
    HR_2.YearsSinceLastPromotion,
    SUM(CASE WHEN HR_1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Yes,
    SUM(CASE WHEN HR_1.Attrition = 'No' THEN 1 ELSE 0 END) AS Attrition_No
FROM HR_1
JOIN HR_2 ON HR_1.EmployeeID = HR_2.EmployeeID
WHERE HR_2.YearsSinceLastPromotion IN (1, 40)
GROUP BY HR_2.YearsSinceLastPromotion;