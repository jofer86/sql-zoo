-- > 1 How many stops are in the database

SELECT COUNT(*)
FROM stops;

-- > 2 Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- > 3 Give the id and the name for the stops on the '4' 'LRT' service.

SELECT id, name
FROM stops 
JOIN route ON (stops.id = route.stop)
WHERE route.num = 4;

-- > 4 The query shown gives the number of routes that visit either London Road (149) OR Craiglockhart (53). Run the query AND notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- > 5 Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.

SELECT a.company, a.num, a.stop, b.stop
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopb ON b.stop = stopb.id
WHERE a.stop=(SELECT id
FROM stops
WHERE name = 'Craiglockhart')
AND stopb.name='London Road';

-- > 6 The query shown is similar to the previous one, however BY joining two copies of the stops table we can refer to stops BY name rather than BY number. Change the query so that the services between 'Craiglockhart' AND 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
JOIN route b ON  (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road';

-- > 7 Give a list of all the services which connect stops 115 AND 137 ('Haymarket' AND 'Leith')

SELECT distinct a.company, a.num
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 115
AND b.stop = 137;

-- > 8 Give a list of the services which connect the stops 'Craiglockhart' AND 'Tollcross'

SELECT a.company, a.num
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross';

-- > 9 Give a distinct list of the stops which may be reached FROM 'Craiglockhart' BY taking one bus, including 'Craiglockhart' itself, offered BY the LRT company. Include the company AND bus no. of the relevant services.

SELECT distinct stopa.name, a.company, a.num
FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart';

-- > 10. Find the routes involving two buses that can go FROM Craiglockhart to Lochend. Show the bus no. AND company for the first bus, the name of the stop for the transfer, AND the bus no. AND company for the second bus.

SELECT a.num, a.company, stopb.name , c.num, c.company
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN route c
JOIN route d ON (c.company = d.company AND c.num= d.num)
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
JOIN stops stopc ON c.stop = stopc.id
JOIN stops stopd ON d.stop = stopd.id
WHERE  stopa.name = 'Craiglockhart'
AND stopd.name = 'Lochend'
AND stopb.name = stopc.name;