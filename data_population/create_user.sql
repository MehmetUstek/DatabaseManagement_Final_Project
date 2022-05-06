DROP TABLE if exists user;
CREATE TABLE USER
	(username  VARCHAR(20),
	 email  VARCHAR(20),
	 password  VARCHAR(50),
	 creationDate  DATE,
	 fname  VARCHAR(20),
	 lname  VARCHAR(20),
	 bDate  DATE,
	 gender  BIT,
	 PRIMARY KEY (username))