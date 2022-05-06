DROP TABLE IF EXISTS movie_FP;
CREATE TABLE movie_FP
  AS (SELECT movie_id as MID, title, release_date as releaseDate, runtime as duration, vote_average as voteAvg, vote_count as voteCount
      FROM movie);
ALTER TABLE movie_FP ADD PRIMARY KEY (MID);