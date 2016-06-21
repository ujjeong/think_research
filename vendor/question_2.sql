/*  
	Question 1
	- Select patients where their last name contains 'mits' without duplicate

	faq - what am I supposed to select? Only their names?

	Result:
		first_name | middle_name | last_name
		   James   |     John    |   Smith
		   Sandy   |     Aria    |   Mits
*/
SELECT DISTINCT p.first_name, p.middle_name, p.last_name 
FROM `patients` as `p` 
INNER JOIN `encounters` as `e` ON p.id = e.patient_id 
WHERE p.last_name LIKE '%mit%'

/*
	Question 2
	- Select patients where their discharged_at is not null or ""

	Joining First Row
		SQL -> SELECT TOP 1
		MySQL -> ORDER BY admitted_at DESC LIMIT 1

	Result:
		first_name | middle_name | last_name
		  Bently   |     Frank   |    Lee
*/
SELECT DISTINCT p.first_name, p.middle_name, p.last_name 
FROM `patients` as `p` 
INNER JOIN `encounters` as `e` 
ON e.admitted_at = 
	(
		SELECT admitted_at 
		FROM `encounters` 
		WHERE patient_id = p.id 
		ORDER BY admitted_at DESC LIMIT 1
	) 
WHERE e.discharged_at IS NOT NULL OR e.discharged_at != ""

/*
	Question 3
	- Select patients who registered between 2014 July 5th and 2014 August 19th

	Result:
		first_name | middle_name | last_name
		   Sandy   |     Aria    |    Mits
		  Bently   |     Frank   |    Lee
*/
SELECT DISTINCT p.first_name, p.middle_name, p.last_name 
FROM `patients` as `p` 
INNER JOIN `encounters` as `e` ON p.id = e.patient_id 
WHERE e.admitted_at >='2014-07-05 00:00:00' AND e.admitted_at <= '2014-08-19 23:59:59'

