DROP TABLE IF EXISTS actor_FP;
CREATE TABLE actor_FP
  AS (SELECT DISTINCT person.person_id as AID, person_name as fullName,  gender
      FROM person, movie_cast LEFT JOIN gender on movie_cast.gender_id = gender.gender_id
      where movie_cast.person_id = person.person_id
      group by person.person_id
      );
ALTER TABLE actor_FP ADD PRIMARY KEY (AID);