DROP TABLE IF EXISTS FOLLOW;
CREATE TABLE FOLLOW
	(followerUsername  VARCHAR(20),
	 followingUsername  VARCHAR(20),
	 PRIMARY KEY (followerUsername, followingUsername),
	 FOREIGN KEY (followerUsername)
		REFERENCES PREMIUM_USER(username)
			ON DELETE CASCADE
ON UPDATE CASCADE,
 FOREIGN KEY (followingUsername)
		REFERENCES PREMIUM_USER(username)
			ON DELETE CASCADE
ON UPDATE CASCADE)
