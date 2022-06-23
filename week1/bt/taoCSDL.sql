use cinema;
CREATE TABLE tblphong (
    rID INT(4) PRIMARY KEY AUTO_INCREMENT,
    ten_phong VARCHAR(50) NOT NULL,
    trangthai VARCHAR(50)
);
CREATE TABLE ghe (
    iSlot INT(4) PRIMARY KEY AUTO_INCREMENT,
    rId INT(4) NOT NULL,
    soghe VARCHAR(10) NOT NULL,
    CONSTRAINT fk1 FOREIGN KEY (rId)
        REFERENCES tblphong (rID)
);
CREATE TABLE tblphim (
    fID INT PRIMARY KEY AUTO_INCREMENT,
    fName VARCHAR(50) NOT NULL,
    fType VARCHAR(50) NOT NULL,
    thoigian int
);
CREATE TABLE tblve (
    fId INT,
    idSlot INT,
    ngaychieu DATE,
    trangthai VARCHAR(50),
    PRIMARY KEY (fId , idSlot),
    FOREIGN KEY (fId)
        REFERENCES tblphim (fID),
    FOREIGN KEY (idSlot)
        REFERENCES ghe (iSlot)
);



INSERT INTO tblphong(ten_phong,trangthai) values
('Phòng chiếu 1',1),
('Phòng chiếu 2',1),
('Phòng chiếu 3',0);
INSERT INTO ghe(rId,soghe) values
(1,'A3'),
(1,'B5'),
(2,'A7'),
(2,'D1'),
(3,'T2');
INSERT INTO tblphim(fName,fType,thoigian) values
('Em bé Hà Nội','Tâm Lý',90),
('Nhiệm vụ bất khả thi','Hành động',100),
('Dị nhân','Viễn tưởng',90),
('Cuốn thoe chiều gió','Tình cảm',120);
INSERT INTO tblve values
(1,1,'2008-10-20','Đã bán'),
(1,3,'2008-11-20','Đã bán'),
(1,4,'2008-12-23','Đã bán'),
(2,1,'2009-02-14','Đã bán'),
(3,1,'2009-02-14','Đã bán'),
(2,5,'2009-03-08','Chưa bán'),
(2,3,'2009-03-08','Chưa bán');