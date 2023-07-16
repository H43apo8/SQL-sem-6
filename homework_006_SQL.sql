CREATE DATABASE homework_database_006;
use homework_database_006;

-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE FUNCTION formatSeconds(seconds INT)
RETURNS VARCHAR(100)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE formattedTime VARCHAR(100);
    
    SET days = seconds / (24 * 60 * 60);
    SET seconds = seconds % (24 * 60 * 60);
    
    SET hours = seconds / (60 * 60);
    SET seconds = seconds % (60 * 60);
    
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    
    SET formattedTime = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN formattedTime;
END;

SELECT formatSeconds(123456);

-- 2. Создайте процедуру, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10

CREATE PROCEDURE getEvenNumbers()
BEGIN
    DECLARE i INT;
    
    SET i = 2;
    
    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SELECT i;
        END IF;
        
        SET i = i + 1;
    END WHILE;
END;

CALL getEvenNumbers();
