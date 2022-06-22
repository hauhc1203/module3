use studentTest;

CREATE TABLE Student (
    Rn INT(4) AUTO_INCREMENT PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL,
    Age TINYINT NOT NULL
);

CREATE TABLE Test (
    TestID INT(4) AUTO_INCREMENT PRIMARY KEY,
    TestName NVARCHAR(20)
);

CREATE TABLE ST (
    RN INT(4) NOT NULL,
    TestId INT(4) NOT NULL,
    NgayThi DATETIME NOT NULL,
    Mark FLOAT,
    CONSTRAINT pk1 PRIMARY KEY(RN,TestId),
    CONSTRAINT fk1 FOREIGN KEY (RN)
        REFERENCES Student (Rn),
    CONSTRAINT fk2 FOREIGN KEY (TestId)
        REFERENCES Test (TestID)
);


INSERT INTO Student VALUES	(null,'Nguyen Hong Ha',20),
							(null,'Truong Ngoc Anh',30),
                            (null,'Tuan Minh',25),
                            (null,'Dan Truong',22);
INSERT INTO Test VALUES	(null,'EPC'),
						(null,'DWMX'),
                        (NULL,'SQL1'),
                        (NULL,'SQL2');
INSERT INTO ST VALUES	(1,1,'2006-7-17',8),
						(1,2,'2006-7-18',5),
						(1,3,'2006-7-19',7),
                        (2,1,'2006-7-17',7),
                        (2,2,'2006-7-18',4),
                        (2,3,'2006-7-19',2),
                        (3,1,'2006-7-17',10),
                        (3,3,'2006-7-18',1);

	
