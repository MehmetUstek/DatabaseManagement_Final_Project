DROP TABLE IF EXISTS actor_FP;
CREATE TABLE actor_FP
  AS (SELECT person.person_id as AID, person_name as fullName, gender
      FROM person LEFT OUTER JOIN gender on LEFT OUTER JOIN movie_cast
      on movie_cast.person_id = person.person_id and movie_cast.gender_id = gender.gender_id
      );
ALTER TABLE actor_FP ADD PRIMARY KEY (AID);