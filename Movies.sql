DROP DATABASE IF EXISTS movies_db;
CREATE DATABASE movies_db;
USE movies_db;

CREATE TABLE movies(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  directorId INTEGER(11),
  title VARCHAR(100),
  grade CHAR(1),
  releaseDate DATE,
  PRIMARY KEY (id)
);

CREATE TABLE directors(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  firstName VARCHAR(100),
  lastName VARCHAR(100),
  academyAward BOOLEAN NOT NULL,
  rating DECIMAL(10,4) NULL,
  average_rating DOUBLE(10,4) NULL,
  PRIMARY KEY (id)
);

INSERT INTO directors (firstName, lastName, academyAward) values ('Steven', 'Spielberg', TRUE);
INSERT INTO directors (firstName, lastName, academyAward) values ('Quentin', 'Tarantino', TRUE);
INSERT INTO directors (firstName, lastName, academyAward) values ('John', 'Hughes', FALSE);
INSERT INTO directors (firstName, lastName, academyAward) values ('Brian', 'Helgeland', TRUE);

INSERT INTO movies (title, directorId, grade) values ('Jaws', 1, 'A');
INSERT INTO movies (title, directorId, grade) values ('Jurassic Park', 1, 'A');
INSERT INTO movies (title, directorId, grade) values ('Sin City', 2, 'A');
INSERT INTO movies (title, directorId, grade) values ('Inglourious Basterds', 2, 'A');
INSERT INTO movies (title, directorId, grade) values ('Ferris Bueller''s Day Off', 3, 'A');
INSERT INTO movies (title, directorId, grade) values ('The Breakfast Club', 3, 'A');
INSERT INTO movies (title, directorId, grade) values ('A Knight''s Tale', null, 'A');

UPDATE movies SET releaseDate ='1999-01-01', grade = "B" WHERE id = 1;
UPDATE movies SET releaseDate ='2001-01-01', grade = "B" WHERE id = 2;
UPDATE movies SET releaseDate ='1998-01-01', grade = "B" WHERE id = 3;
UPDATE movies SET releaseDate ='2005-01-01', grade = "B" WHERE id = 4;
UPDATE movies SET releaseDate ='1999-01-01', grade = "B" WHERE id = 5;
UPDATE movies SET releaseDate ='2009-01-01', grade = "B" WHERE id = 6;
UPDATE movies SET releaseDate ='2010-01-01', grade = "B" WHERE id = 7;

-- Result table/Result-set 1: Show All directors table columns/fields: id, firstName, lastName
SELECT * FROM directors;

-- Result table/Result-set 2: Show All movies table columns/fields: id, directorId, title
SELECT * FROM movies;

-- Result table/Result-set 3: Show All directors that don't have an Academy Award.
SELECT * FROM directors WHERE academyAward= FALSE;

-- Result table/Result-set 4: Show the movie with the earliest release date.
SELECT * FROM movies WHERE releaseDate= (SELECT MIN(releaseDate) FROM movies);
-- Alternatively:
-- SELECT * FROM movies ORDER BY releaseDate ASC LIMIT 1;

-- Result table/Result-set 5: Show All movies with directors
-- JOIN movie names with assigned directorId to the data of directors with matching ids.
-- INNER JOIN only returns all matching values from both tables  
SELECT title, firstName, lastName
FROM movies
INNER JOIN directors ON movies.directorId = directors.id;

-- Result table/Result-set 6: Show ALL movies, even if we don't know the director
-- LEFT JOIN returns all of the values from the left table, and the matching ones from the right table
SELECT title, firstName, lastName
FROM movies
LEFT JOIN directors ON movies.directorId = directors.id;

-- Result table/Result-set 7: show ALL movies, even if we don't know the director
-- RIGHT JOIN returns all of the values from the right table, and the matching ones from the left table
SELECT title, firstName, lastName
FROM movies
RIGHT JOIN directors ON movies.directorId = directors.id;
