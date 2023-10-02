use WorldEvents
SELECT EventID, EventName, EventDate, CountryID
FROM tblEvent
WHERE EventDate > (
    SELECT MAX(EventDate)
    FROM tblEvent
    WHERE CountryID = 21
)

use WorldEvents
SELECT EventName, EventDate
FROM tblEvent
WHERE LEN(EventName) > (
  SELECT AVG(LEN(EventName)) 
  FROM tblEvent
)
-- Mams number 5.1
-- list out all events where ...
SELECT
    e.EventName,
    e.EventDetails
FROM
    tblEvent AS e
WHERE
    -- ... the country for the event isn't in the last 30 in alphabetical order and ...
    e.CountryID NOT IN (
        SELECT TOP 30 c.CountryID
        FROM tblCountry AS c
        ORDER BY c.CountryName DESC
    ) 
    -- the category isn't in the last 15 in alphabetical order
    and e.CategoryID NOT IN (
        SELECT TOP 15 c.CategoryID
        FROM tblCategory AS c
        ORDER BY c.CategoryName DESC
    )
ORDER BY
    e.EventDate


SELECT EventName 
FROM tblEvent
WHERE LEN(EventName) > 
(SELECT AVG(LEN(EventName)) FROM tblEvent)
ORDER BY LEN(EventName) DESC

SELECT EventName 
FROM tblEvent
WHERE LEN(EventName) > 
(SELECT AVG(LEN(EventName)) FROM tblEvent)

SELECT CountryID, CountryName
FROM tblCountry c
WHERE (
    SELECT COUNT(*)
    FROM tblEvent e
    WHERE e.CountryID = c.CountryID
) > 8
