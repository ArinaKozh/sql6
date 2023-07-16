DELIMITER $$
CREATE FUNCTION counter(sec INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
SET @seconds := MOD(MOD(MOD(sec, 86400),3600),60);
SET @minutes := MOD(MOD(sec, 86400),3600) DIV 60;
SET @hours := MOD(sec, 86400) DIV 3600;
SET @days := sec DIV 86400;
RETURN CONCAT(@days," days ",@hours," hours ", @minutes, " minutes ", @seconds," seconds ");
END $$;
DELIMITER ;