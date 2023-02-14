#1
CREATE DATABASE test CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

#2
USE test;
CREATE TABLE users (
    id          int             PRIMARY KEY AUTO_INCREMENT,
    email       varchar(320),
    pass        char(255),
    sum         int,
    updated     TIMESTAMP       DEFAULT NOW() ON UPDATE NOW(),
    created     TIMESTAMP       NOT NULL DEFAULT NOW()
);

#3
INSERT INTO users (email, pass, sum, created) VALUES ("one@one.one", "oneoneone", 1, "2023-02-10 00:00:00");
INSERT INTO users (email, pass, sum, created) VALUES ("two@two.two", "threethreethree", 2, "2023-02-11 00:00:00");
INSERT INTO users (email, pass, sum, created) VALUES ("three@three.three", "threethreethree", 3, "2023-01-12 00:00:00");
INSERT INTO users (email, pass, sum, created) VALUES ("four@four.four", "fourfourfour", 4, "2023-02-13 00:00:00");
INSERT INTO users (email, pass, sum) VALUES ("today@today.today", "todaytodaytoday", 5);

#4
SELECT * FROM users WHERE email = "today@today.today";
SELECT * FROM users WHERE DATE(created) = CURDATE();
SELECT date(created), COUNT(*) FROM users GROUP BY date(created);
SELECT SUM(sum) FROM users;

#5
UPDATE users SET sum = 6 WHERE id = 1;
UPDATE users SET sum = 7 WHERE email = "two@two.two";
UPDATE users SET sum = 7 WHERE YEAR(created) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AND MONTH(created) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH);

#6
ALTER TABLE users ADD UNIQUE (email);

#7
INSERT INTO users (email, pass, sum, created)
    VALUES ("one@one.one", "oneoneone", 1, "2023-01-10 00:00:00")
    ON DUPLICATE KEY UPDATE
        pass = "oneoneone",
        sum = 1,
        created = "2023-01-10 00:00:00";

#8
SHOW DATABASES;

#9
SHOW TABLES;

#10
DESC users;

#11
SHOW CREATE TABLE users;

#12
ALTER TABLE users ADD sex enum('unknown', 'M', 'F') DEFAULT 'unknown' AFTER pass;

#13
ALTER TABLE users MODIFY COLUMN sum float(2);

#14
ALTER TABLE users RENAME COLUMN sum TO money;
