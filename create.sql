CREATE TABLE Movie (
  id int,
  title varchar(100),
  year int,
  CHECK (year > 1850),
  rating varchar(10),
  company varchar(50),
  PRIMARY KEY(id)
) ENGINE = INNODB;

CREATE TABLE Actor (
  id int,
  last varchar(20),
  first varchar(20),
  sex varchar(6),
  dob date,
  dod date,
  PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE Sales (
  mid int references Movie(id),
  ticketsSold int,
  CHECK (ticketsSold >= 0),
  totalIncome int
) ENGINE = INNODB;

CREATE TABLE Director (
  id int,
  last varchar(20),
  first varchar(20),
  dob date,
  dod date,
  PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE MovieGenre (
  mid int references Movie(id),
  genre varchar(20)
) ENGINE = INNODB;

CREATE TABLE MovieDirector (
  mid int references Movie(id),
  did int references Director(id)
) ENGINE = INNODB;

CREATE TABLE MovieActor (
  mid int references Movie(id),
  aid int references Actor(id),
  role varchar(50)
) ENGINE = INNODB;

CREATE TABLE MovieRating (
  mid int references Movie(id),
  imdb int,
  CHECK (imdb BETWEEN 0 and 100),
  rot int,
  CHECK (rot BETWEEN 0 and 100)
) ENGINE = INNODB;

CREATE TABLE Review (
  name varchar(20),
  time timestamp,
  mid int references Movie(id),
  rating int,
  CHECK (rating BETWEEN 0 and 100),
  comment varchar(500)
) ENGINE = INNODB;

CREATE TABLE MaxPersonID (id int) ENGINE = INNODB;

CREATE TABLE MaxMovieID (id int) ENGINE = INNODB;
