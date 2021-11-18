SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE sql_tutorial;
SHOW DATABASES;
USE `sql_tutorial`;

CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
	`major` VARCHAR(20),
    `score` INT,
    PRIMARY KEY(`student_id`)
);

INSERT INTO `student`(`name`, `major`, `score`) VALUES("小白", "英語", 50);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小黃", "生物", 90);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小綠", "歷史", 70);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小藍", "英語", 80);
INSERT INTO `student`(`name`, `major`, `score`) VALUES("小黑", "化學", 20);

SELECT * FROM `student`;

UPDATE `student`
SET `major` = '英國文學'
WHERE `major` = '英語';

UPDATE `student`
SET `major` = '生化'
WHERE `major` = '生物' OR `major` = '化學';

UPDATE `student`
SET `major` = '符號學'
WHERE `student_id` = 1;

DELETE FROM `student`
WHERE `student_id` = 4;

DELETE FROM `student`
WHERE `score` < 60;

