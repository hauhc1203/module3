use studentTest;


-- 2
SELECT 
    s.Name AS 'Student Name',
    t.TestName AS 'Test Name',
    st.Mark,
    st.NgayThi AS 'Date'
FROM
    Student AS s
        JOIN
    ST AS st
        JOIN
    Test AS t ON s.Rn = st.RN AND st.TestId = t.TestID;
-- 3
SELECT 
    s.Rn AS 'RN', s.Name, s.Age
FROM
    Student AS s
WHERE
    s.Rn NOT IN (SELECT 
            RN
        FROM
            ST);

-- 4
SELECT 
    s.Name AS 'Student Name',
    t.TestName AS 'Test Name',
    st.Mark,
    st.NgayThi AS 'Date'
FROM
    Student AS s
        JOIN
    ST AS st
        JOIN
    Test AS t ON s.Rn = st.RN AND st.TestId = t.TestID
WHERE
    st.Mark < 5;
-- 5
-- CREATE VIEW diemTB AS
SELECT 
    s.Name AS 'Student Name', AVG(st.Mark) AS 'Average'
FROM
    Student AS s
        JOIN
    ST AS st
        JOIN
    Test AS t ON s.Rn = st.RN AND st.TestId = t.TestID
GROUP BY s.Name
ORDER BY AVG(st.Mark) DESC;
-- 6
SELECT 
    *
FROM
    studentTest.diemTB AS a
WHERE
    a.Average = (SELECT 
            MAX(Average)
        FROM
            studentTest.diemTB);

-- 7
SELECT 
    t.TestName, MAX(st.Mark)
FROM
    ST AS st
        JOIN
    Test AS t ON st.TestId = t.TestID
GROUP BY t.TestName
ORDER BY t.TestName
;

-- 8
SELECT 
    s.Name AS 'Student Name', t.TestName AS 'Test Name'
FROM
    Student AS s
        LEFT JOIN
    ST AS st ON s.Rn = st.RN
        LEFT JOIN
    Test AS t ON st.TestId = t.TestID;
        
-- 9
	UPDATE Student AS s 
SET 
    s.Age = s.Age +1
WHERE
    s.Rn > 0;
-- 10
ALTER TABLE Student 
ADD COLUMN Status VARCHAR(10) DEFAULT null;

-- 11
	UPDATE Student AS s 
	SET 
    s.Status = if(s.Age<30,'Young','Old')
WHERE
    s.Rn > 0;


-- 12
CREATE VIEW vwStudentTestList11 AS
    SELECT 
		s.Rn,
        s.Name AS 'Student Name',
        t.TestName AS 'Test Name',
        st.Mark,
        st.NgayThi AS 'Date'
    FROM
        Student AS s
            LEFT JOIN
        ST AS st ON s.Rn = st.RN
            LEFT JOIN
        Test AS t ON st.TestId = t.TestID
    ORDER BY st.NgayThi;


-- 13





DELIMITER $$
DROP TRIGGER IF EXISTS `tgSetStatus`$$
CREATE TRIGGER  tgSetStatus BEFORE UPDATE
ON Student  
FOR EACH ROW
BEGIN
	SET NEW.Status	=if(new.Age<30,'Young','Old');
END$$
DELIMITER ;


DELIMITER //
DROP TRIGGER IF EXISTS `tgSetStatus1`//

CREATE TRIGGER  tgSetStatus1 BEFORE INSERT
ON Student  
FOR EACH ROW
BEGIN
SET NEW.Status	=if(new.Age<30,'Young','Old');
END// 
DELIMITER ;


DROP TRIGGER tgSetStatus1;

DROP TRIGGER tgSetStatus;

INSERT INTO Student(Name,Age) VALUE	('the chot',34);

UPDATE Student 
SET Age=22
WHERE Rn=34;


-- 14
CREATE VIEW view1 as
SELECT s.Name ,t.TestName ,st.Mark
FROM Student as s 
		LEFT JOIN ST as st on s.Rn=st.RN 
        LEFT JOIN Test as t on st.TestId =t.TestID;
        
DELIMITER //
CREATE PROCEDURE spViewStatus(IN sName NVARCHAR(20),IN sjName NVARCHAR(20),OUT output nvarchar(50),OUT o2 int)
	BEGIN
		 DECLARE diem float;
		IF sName not in( SELECT Name FROM Student) or sjName not in (SELECT TestName FROM Test) 
 			THEN 
 				SET output='Không tìm thấy';
 		ELSE 
			SELECT Mark INTO diem FROM view1 WHERE view1.Name=sName and view1.TestName=sjName;
            set o2=diem;
 			IF diem>=5 then
				SET output='Đỗ';
			ELSEIF diem<5 then
				SET output='Trượt';
			ELSE
				SET output='Chưa thi';
			end if;
 		end if;
	END;
//DELIMITER ;

 DELIMITER $$
DROP TRIGGER IF EXISTS `tgSetStatus`$$
CREATE TRIGGER  tgSetStatus BEFORE UPDATE
ON Student  
FOR EACH ROW
BEGIN
	SET NEW.Status	=if(new.Age<30,'Young','Old');
END$$
DELIMITER ;