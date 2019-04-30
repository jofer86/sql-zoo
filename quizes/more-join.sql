-- 1. SELECT the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)

SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget

-- 2. SELECT the correct example of JOINing three tables

SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie 
ON movie.id = movieid

-- 3. SELECT the statement that shows the list of actors called 'John' BY order of number of movies IN which they acted

SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name
ORDER BY 2 DESC

-- 4. SELECT the result that would be obtained FROM the following code:

-- SELECT title
-- FROM movie JOIN casting ON (movieid=movie.id)
-- JOIN actor ON (actorid=actor.id)
-- WHERE name='Paul Hogan' AND ord = 1


Table-B
"Crocodile" Dundee
Crocodile Dundee IN Los Angeles
Flipper
Lightning Jack

-- 5. SELECT the statement that lists all the actors that starred IN movies directed BY Ridley Scott who has id 351

SELECT name
FROM movie JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE ord = 1 
AND director = 351

-- 6. There are two sensible ways to connect movie AND actor. They are:

link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table

-- 7. SELECT the result that would be obtained FROM the following code:
-- SELECT title, yr
-- FROM movie, casting, actor
-- WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3

Table-B
A Bronx Tale	        1993
Bang the Drum Slowly	1973
Limitless	          2011