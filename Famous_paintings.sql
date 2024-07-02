 CREATE DATABASE FAMOUS_PAINTINGS

--Select artists, their style and the museum id thir work is displayed on
SELECT artist.artist_id,artist.full_name,work.style,work.museum_id, museum.name
FROM museum, artist
LEFT JOIN work ON artist.artist_id = work.artist_id
 
--Find the average canvas size
SELECT AVG(height) AS [AVERAGE_HEIGHT], AVG(width) AS [AVERAGE WIDTH]
FROM canvas_size

--select the paintings with the largest area
SELECT width, height, (width/10 * height/10) AS [Area]
FROM canvas_size
ORDER BY Area DESC

--Find the musuems open on sundays
SELECT museum.name, museum.state,museum_hours.day, museum.city
FROM museum
LEFT JOIN museum_hours ON museum.museum_id = museum_hours.museum_id
WHERE museum_hours.day = 'Sunday'

--List all artist with more than 5 paintings in the set
SELECT artist.full_name, artist.artist_id
FROM artist
LEFT JOIN work ON work.artist_id = artist.artist_id
GROUP BY artist.full_name,artist.artist_id
HAVING COUNT(work_id) > 5

--Find paintings with a missing image link
SELECT url
FROM image_link
WHERE url IS NULL

--List all paintings in a specific museum and their corresponding subjects
SELECT museum.name, subject.subject,work.work_id
FROM work
INNER JOIN subject ON subject.work_id = work.work_id
INNER JOIN museum ON work.museum_id = museum.museum_id
WHERE museum.name = 'Pushkin State Museum of Fine Arts'

--Find the artist with the most paintings in the dataset
SELECT artist.full_name, COUNT (*) 
FROM artist
INNER JOIN work on work.artist_id = artist.artist_id
GROUP BY artist.full_name


--Find the nationality of every artist
SELECT nationality, COUNT(*) as Artist_count
FROM artist
GROUP BY nationality
ORDER BY count(*) desc

--find the musuemS with the most paintings
SELECT TOP 5 museum.name, COUNT(work.work_id) AS paintings
from museum
INNER JOIN work ON work.museum_id = museum.museum_id
GROUP BY museum.name
ORDER BY paintings DESC

--List all paintings with their corresponding image links
SELECT work.work_id,work.name, image_link.url 
FROM work
LEFT JOIN image_link ON work.work_id = image_link.work_id

--Find museums with paintings from a specific artist
SELECT museum.name as [Museum_name],worK.name AS [painting_name]
FROM museum
LEFT JOIN work ON work.museum_id = museum.museum_id
INNER JOIN artist ON artist.artist_id = work.artist_id
WHERE artist.full_name = 'August Macke'

--list artist with their corresponding styles
SELECT artist.full_name, work.style
FROM artist
INNER JOIN work on work.artist_id = artist.artist_id
GROUP BY artist.full_name, work.style



