DELIMITER $$
drop trigger if exists updateSalary$$
CREATE TRIGGER updateSalary
before update on Professors
for each row
BEGIN
declare difference integer;
declare meanSalaryNew integer;
# trigger makes changes only if RangId changed and Salary was passed as 0
if NEW.Salary = 0 and NEW.RangId is not null and OLD.RangId is not null and NEW.RangId != OLD.RangId then
    # difference in Rang
    set difference = NEW.RangId - OLD.RangId;
    # mean salary of new rang
    call meanSalaryProfWithRang(NEW.RangId, meanSalaryNew);
    # logic for the new salary
    if meanSalaryNew is not null then
        set NEW.Salary = meanSalaryNew * 0.90;
    else
        set NEW.Salary = POWER(1.25, difference) * OLD.Salary;
    end if;
end if;
END $$

DELIMITER ;

/* Test */
SELECT Salary
FROM Professors
WHERE Name = 'Mancellari';

UPDATE Professors
SET RangId = RangId + 1, Salary = 0
WHERE Name = 'Mancellari';

SELECT Salary
FROM Professors
WHERE Name = 'Mancellari';