SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE sql_company;
SHOW DATABASES;
USE `sql_company`;

CREATE TABLE `employee`(
	`emp_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `birth_date` DATE,
    `sex` VARCHAR(1),
    `salary` INT,
    `branch_id` INT,
    `sup_id` INT
);

CREATE TABLE `branch`(
	`branch_id` INT PRIMARY KEY,
    `branch_name` VARCHAR(20),
    `manager_id` INT,
    FOREIGN KEY (`manager_id`) REFERENCES `employee`(`emp_id`) ON DELETE SET NULL
);

ALTER TABLE `employee`
ADD FOREIGN KEY(`branch_id`)
REFERENCES `branch`(`branch_id`)
ON DELETE SET NULL;

ALTER TABLE `employee`
ADD FOREIGN KEY(`sup_id`)
REFERENCES `employee`(`emp_id`)
ON DELETE SET NULL;

CREATE TABLE `client`(
	`client_id` INT PRIMARY KEY,
    `client_name` VARCHAR(20),
    `phone` VARCHAR(20)
);

CREATE TABLE `work_with`(
	`emp_id` INT,
    `client_id` INT,
    `total_sales` INT,
    PRIMARY KEY (`emp_id`,`client_id`),
    FOREIGN KEY(`emp_id`) REFERENCES `employee`(`emp_id`) ON DELETE CASCADE,
	FOREIGN KEY(`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
);

INSERT INTO `branch` VALUES(1, '研發', NULL);
INSERT INTO `branch` VALUES(2, '行政', NULL);
INSERT INTO `branch` VALUES(3, '資訊', NULL);

INSERT INTO `employee` VALUES(206, '小黃', '1998-10-08', 'F', '50000', 1, NULL);
INSERT INTO `employee` VALUES(207, '小綠', '1985-09-16', 'M', '29000', 1, 206);
INSERT INTO `employee` VALUES(208, '小黑', '2000-12-19', 'M', '35000', 1, 206);
INSERT INTO `employee` VALUES(209, '小白', '1997-01-22', 'F', '39000', 1, 207);
INSERT INTO `employee` VALUES(210, '小藍', '1925-11-10', 'F', '84000', 1, 207);

UPDATE `branch`
SET `manager_id` = 206
WHERE `branch_id` = 1;

UPDATE `branch`
SET `manager_id` = 207
WHERE `branch_id` = 2;

UPDATE `branch`
SET `manager_id` = 208
WHERE `branch_id` = 3;

INSERT INTO `client` VALUES(400, "阿狗", "0900123335");
INSERT INTO `client` VALUES(401, "阿貓", "0900123123");
INSERT INTO `client` VALUES(402, "旺來", "0900123123");
INSERT INTO `client` VALUES(403, "露西", "0900123123");
INSERT INTO `client` VALUES(404, "艾瑞克", "0900123123");

-- 演練
-- 取得所有員工資料
SELECT * FROM `employee`;

-- 取得所有客戶資料（）
SELECT * FROM `client`;

-- 按薪水低到高抓員工
SELECT * FROM `employee` order by `salary` DESC ;

-- 取得薪水前三高的員工
SELECT * FROM `employee` order by `salary` DESC LIMIT 3;

-- 取得所有員工名字
SELECT `name` FROM `employee`;

-- 聚合函數
-- 取得員工人數alter
SELECT COUNT(*) FROM `employee`;

-- 取得所有出生於 1970-01-01 之後的女性員工人數
SELECT COUNT(*) FROM `employee` WHERE `birth_date` > '1970-01-01' AND `sex` = 'F';

-- 取得所有員工的平均薪水
SELECT AVG(`salary`) FROM `employee`;

-- 取得所有員工的薪水總和
SELECT SUM(`salary`) FROM `employee`;

-- 取得薪水最高的員工 
SELECT MAX(`salary`) FROM `employee`;
-- 原本這樣寫
SELECT `salary` FROM `employee` ORDER BY `salary` DESC LIMIT 1;

-- 取得薪水最低的員工 
SELECT MIN(`salary`) FROM `employee`;
-- 原本這樣寫
SELECT `salary` FROM `employee` ORDER BY `salary` LIMIT 1;

-- 萬用字元 
 -- % 代表多字元
 -- _ 代表單一字元
-- 取得電話號碼尾數是335的客戶
SELECT * FROM `client` WHERE `phone` LIKE '%335';

-- 取得姓艾的客戶
SELECT * FROM `client` WHERE `client_name` LIKE '艾%';

-- 取得生日在12月的員工
SELECT * FROM `employee` WHERE `birth_date` LIKE '_____12%';
