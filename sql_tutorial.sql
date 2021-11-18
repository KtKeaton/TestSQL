CREATE DATABASE sql_tutorial;
SHOW DATABASES;
CREATE DATABASE `test1`;
SHOW DATABASES;
DROP DATABASE `test1`;
SHOW DATABASES;
USE `sql_tutorail`;
USE `sql_tutorial`;

CREATE TABLE `student`(
	`student_id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
	`major` VARCHAR(20),
    PRIMARY KEY(`student_id`)
);

DESCRIBE `student`;
DROP TABLE `student`;

ALTER TABLE `student` ADD gpa  DECIMAL(3,2);
ALTER TABLE `student` DROP COLUMN gpa;

INSERT INTO `student` VALUES(1, "徽典", "歷史");
SELECT * FROM `student`;
INSERT INTO `student` VALUES(2, "丁丁", "資工");
INSERT INTO `student` VALUES(3, "小圓", NULL);
INSERT INTO `student`(`name`, `major`, `student_id`) VALUES("燄燄", "軍訓", 4);
DROP TABLE `student`;
CREATE TABLE `student`(
	`student_id` INT PRIMARY KEY,
	`name` VARCHAR(20) NOT NULL,
	`major` VARCHAR(20) DEFAULT "某科目"
);

INSERT INTO `student` VALUES(1, NULL, "歷史");
INSERT INTO `student` VALUES(1, "我是誰", "歷史");
INSERT INTO `student` VALUES(2, "JACK", "政治");

INSERT INTO `student`(`name`, `major`) VALUES(NULL, "英語");

--


