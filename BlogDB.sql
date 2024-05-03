
CREATE TABLE Role (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  role VARCHAR(10) NOT NULL
);
INSERT INTO Role VALUES(1,'Admin');
INSERT INTO Role VALUES(2,'User');


CREATE TABLE Users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  email VARCHAR(20) NOT NULL UNIQUE,
  password VARCHAR(20) NOT NULL,
  role_id INTEGER,
  FOREIGN KEY (role_id) REFERENCES Role(id)
);
INSERT INTO Users VALUES(1,'Sife','Yassine','sife@test.com','test',1);
INSERT INTO Users VALUES(2,'Omar','Zekri','omar@test.com','testo',2);
INSERT INTO Users VALUES(3,'Reda','Mazria','reda@test.com','dnwlir32',2);
INSERT INTO Users VALUES(4,'Yassine','Arafi','yassine@test.com','jd298dy298d@',2);
INSERT INTO Users VALUES(5,'Abdellah','Riff','abdo@test.com','12435qwret',2);


CREATE TABLE Articles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  content VARCHAR(255),
  created_date VARCHAR(10),
  user_id INTEGER,
  category_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (category_id) REFERENCES Categories(id)
);
INSERT INTO Articles VALUES(1,'This is an article about IT','2024-04-03',1,1);
INSERT INTO Articles VALUES(2,'This is an article about Web Development','2024-04-05',1,2);
INSERT INTO Articles VALUES(3,'This is an article about Figma Design','2024-04-07',1,5);
INSERT INTO Articles VALUES(4,'This is an article about AI','2024-04-09',1,3);
INSERT INTO Articles VALUES(5,'This is an article about Design','2024-04-10',1,4);


CREATE TABLE Comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  content VARCHAR(100),
  created_date VARCHAR(10),
  user_id INTEGER,
  article_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES Users(id),
  FOREIGN KEY (article_id) REFERENCES Articles(id)
);
INSERT INTO Comments VALUES(1,'This is a good article','2024-04-05',2,1);
INSERT INTO Comments VALUES(2,'good','2024-04-07',3,2);
INSERT INTO Comments VALUES(3,'Nice job','2024-04-09',4,3);
INSERT INTO Comments VALUES(4,'Keep the work','2024-04-11',5,4);
INSERT INTO Comments VALUES(5,'Thanks','2024-04-13',3,5);

CREATE TABLE Categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(10),
  parent_category INTEGER,
  FOREIGN KEY (parent_category) REFERENCES Categories(id)
);
INSERT INTO Categories VALUES(1,'IT & Technology',NULL);
INSERT INTO Categories VALUES(2,'Web Development',1);
INSERT INTO Categories VALUES(3,'AI',1);
INSERT INTO Categories VALUES(4,'Design',NULL);
INSERT INTO Categories VALUES(5,'Figma',4);


-- DELETE FROM Comments WHERE id = 1;

-- UPDATE Articles SET content = 'This is an updated article' WHERE id = 1;

-- SELECT * FROM Articles;
