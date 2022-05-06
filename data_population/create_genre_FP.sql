DROP TABLE IF EXISTS genre_FP;
CREATE TABLE genre_FP
  AS (SELECT genre_id as GID, genre_name as gname
      FROM genre);
ALTER TABLE genre_FP ADD PRIMARY KEY (GID);