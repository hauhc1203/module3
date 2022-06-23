use cinema;


-- 2
SELECT * FROM tblphim
ORDER BY thoigian;
-- 3
SELECT fName
FROM tblphim
WHERE thoigian=(SELECT MAX(thoigian) FROM tblphim);
-- 4
SELECT fName
FROM tblphim
WHERE thoigian=(SELECT MIN(thoigian) FROM tblphim);

-- 5
SELECT soghe
FROM ghe
WHERE soghe LIKE('A%');

-- 6
ALTER TABLE tblphong
MODIFY COLUMN trangthai NVARCHAR(25);
-- 7
UPDATE tblphong  
SET trangthai=if(trangthai=0,'Đang sửa',if(trangthai=1,'Đang sử dụng','Unknow'))
WHERE rID>0;
SELECT * FROM tblphong;

-- 8
SELECT * 
FROM tblphim 
WHERE length(fName)>15 and length(fName)<25;

-- 9
SELECT concat(ten_phong,' ',trangthai) as 'trạng thái phòng chiếu'
FROM tblphong;

-- 10

CREATE TABLE tblRank(
	STT int(4) AUTO_INCREMENT PRIMARY KEY ,
    TenPhim VARCHAR(50) not null,
    Thoi_gian int not null
    );
    
INSERT INTO tblRank(TenPhim,Thoi_gian)
SELECT  fName,thoigian
FROM tblphim
ORDER BY fName;

-- 11
ALTER TABLE tblphim 
ADD Mo_ta nvarchar(255) NOT NULL ;

UPDATE tblphim 
SET Mo_ta=concat('Đây là bộ phim thể loại ',fType)
WHERE fID>0;

UPDATE tblphim 
SET Mo_ta=replace(Mo_ta,'bộ phim','film')
WHERE fID>0;

-- 12
ALTER TABLE ghe 
DROP CONSTRAINT fk1;

ALTER TABLE tblve
DROP CONSTRAINT tblve_ibfk_1,
DROP CONSTRAINT tblve_ibfk_2;

-- 13

DELETE  FROM ghe 
WHERE iSlot>0;
-- 14
SELECT date_add(now(),INTERVAL 5000 MINUTE) AS 'Thoi Gian Hien tai';