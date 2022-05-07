
DROP TABLE IF EXISTS plays_in;
CREATE TABLE plays_in
  AS (SELECT DISTINCT person_id as AID , movie_id as MID
      FROM movies_taken.movie_cast
      );
ALTER TABLE plays_in ADD PRIMARY KEY (AID, MID), ADD FOREIGN KEY (AID) REFERENCES actor(AID), ADD FOREIGN KEY (MID) REFERENCES movie(MID);