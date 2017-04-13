SELECT CONCAT(Actor.first, ' ', Actor.last) as Actor
FROM MovieActor, Actor, Movie
WHERE Movie.title = 'Die Another Day' AND Movie.id = MovieActor.mid AND
                    MovieActor.aid = Actor.id;

SELECT count(distinct ma1.aid)
FROM MovieActor as ma1, MovieActor as ma2
WHERE ma1.aid = ma2.aid and ma1.mid <> ma2.mid;

SELECT title
FROM Movie, Sales
WHERE Sales.ticketsSold > 1000000 and Sales.mid = Movie.id

-- Find the names of all directors that directed a romance
SELECT CONCAT(Director.first, ' ', Director.last) as Director
FROM Director, MovieGenre, MovieDirector
WHERE genre = 'Romance' and MovieGenre.mid = MovieDirector.mid and MovieDirector.did = Director.id;

-- Find the names of all movies with a rating over 95 on imdb
SELECT Movie.title
FROM Movie, MovieRating
WHERE MovieRating.imdb > 95 and MovieRating.mid = Movie.id;
