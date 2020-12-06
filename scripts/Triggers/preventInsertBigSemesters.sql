DELIMITER $$
drop trigger if exists preventInsertBigSemesters$$
CREATE TRIGGER preventInsertBigSemesters
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN

IF NEW.Semester >= 4 then
    SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
    SET MESSAGE_TEXT = 'You can not add new Students on semesters bigger than or equal to 4.';
end if;

END$$

DELIMITER ;

/* Test */