SELECT CONCAT(Actor.first, ' ', Actor.last) as Actor
FROM MovieActor, Actor, Movie
WHERE Movie.title = 'Die Another Day' AND Movie.id = MovieActor.mid AND
                    MovieActor.aid = Actor.id;
