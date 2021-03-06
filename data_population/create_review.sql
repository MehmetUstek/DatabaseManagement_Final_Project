CREATE TABLE REVIEW
	(RID  INTEGER,
	 rating  INTEGER,
	 comment  CHAR(200),
	 date  DATE,
	 username  CHAR(12),
	 MID  INTEGER,
	 PRIMARY KEY (RID, username),
 FOREIGN KEY (username)
		REFERENCES PREMIUM_USER(username)
			ON DELETE CASCADE
ON UPDATE CASCADE,
 FOREIGN KEY (MID)
		REFERENCES MOVIE_FP(MID)
			ON DELETE CASCADE
ON UPDATE CASCADE)
