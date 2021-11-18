SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE sql_tutorial;
SHOW DATABASES;
USE `sql_tutorial`;

DROP TABLE `student`;

CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
	`major` VARCHAR(20),
    `score` INT,
    PRIMARY KEY(`student_id`)
);

INSERT INTO `student`(`name`, `major`, `score`) VALUES("小白", "英語", 50);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小黃", "生物", 90);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小綠", "歷史", 20);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小藍", "英語", 80);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小黑", "化學", 20);

SELECT * FROM `student`;
SELECT `name`, `major` FROM `student`;
SELECT * FROM `student` ORDER BY `score` DESC;
SELECT * FROM `student` ORDER BY `score`, `student_id`;
SELECT * FROM `student` LIMIT 3;
SELECT * FROM `student` WHERE `major` IN ("英語", "歷史");
