-- use bt_trigger;

CREATE TABLE KhachHang (
    MAKH INT(4) AUTO_INCREMENT PRIMARY KEY,
    HoTen VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(100) NOT NULL,
    SDT VARCHAR(10) NOT NULL,
    NgSinh DATE NOT NULL,
    DoanhSo DOUBLE DEFAULT 0,
    NgDK DATE NOT NULL
);

CREATE TABLE NV (
    MaNV INT(4) AUTO_INCREMENT PRIMARY KEY,
    HoTen VARCHAR(50) NOT NULL,
    NgVL DATE NOT NULL,
    SDT VARCHAR(10) NOT NULL
);

CREATE TABLE SP (
    MaSP INT(4) AUTO_INCREMENT PRIMARY KEY,
    TenSp VARCHAR(60) NOT NULL,
    DVT VARCHAR(30) NOT NULL,
    NuocSX VARCHAR(40),
    Gia DOUBLE NOT NULL
);
    
CREATE TABLE HoaDon (
    SoHD INT(4) AUTO_INCREMENT PRIMARY KEY,
    NgMua DATETIME DEFAULT NOW(),
    MaKh INT(4) NOT NULL,
    MaNv INT(4) NOT NULL,
    TriGia DOUBLE DEFAULT 0,
    CONSTRAINT fk1 FOREIGN KEY (MaKh)
        REFERENCES KhachHang (MAKH),
    CONSTRAINT fk2 FOREIGN KEY (MaNv)
        REFERENCES NV (MaNV)
);
    
CREATE TABLE CTHD (
    SoHd INT(4) NOT NULL,
    MaSp INT(4) NOT NULL,
    SL TINYINT NOT NULL,
    CONSTRAINT pk1 PRIMARY KEY (SoHd , MaSp),
    CONSTRAINT fk3 FOREIGN KEY (SoHd)
        REFERENCES HoaDon (SoHD),
    CONSTRAINT fk4 FOREIGN KEY (MaSp)
        REFERENCES SP (MaSP)
);
    
delimiter //
DROP TRIGGER IF EXISTS after_insert_cthd //
CREATE TRIGGER after_insert_cthd AFTER INSERT 
ON CTHD 
FOR EACH ROW
BEGIN
	UPDATE HoaDon
    SET TriGia=TriGia+ new.SL*(SELECT Gia FROM SP WHERE MaSP=new.MaSp) 
    WHERE SoHD=new.SoHd;
END//
delimiter ;


delimiter //
DROP TRIGGER IF EXISTS after_update_cthd //
CREATE TRIGGER after_update_cthd AFTER UPDATE 
ON CTHD
FOR EACH ROW
BEGIN
	UPDATE HoaDon
     SET TriGia=TriGia+ (new.SL-old.SL)*(SELECT Gia FROM SP WHERE MaSP=new.MaSp) 
    WHERE SoHD=new.SoHd;
END//
delimiter ;


delimiter //
DROP TRIGGER IF EXISTS after_delete_cthd //
CREATE TRIGGER after_delete_cthd AFTER DELETE 
ON CTHD
FOR EACH ROW
BEGIN
	UPDATE HoaDon
     SET TriGia=TriGia-old.SL*(SELECT Gia FROM SP WHERE MaSP=old.MaSp) 
    WHERE SoHD=old.SoHd;
END//
delimiter ;


delimiter //
DROP TRIGGER  IF EXISTS  after_update_hd //
CREATE TRIGGER after_update_hd AFTER UPDATE 
ON HoaDon 
FOR EACH ROW
BEGIN
	UPDATE KhachHang
    SET DoanhSo=DoanhSo+ new.TriGia-old.TriGia
    WHERE MAKH=new.MaKh;
END//
delimiter ;


                   

INSERT INTO KhachHang(HoTen,DiaChi,SDT,NgSinh,NgDK) VALUES 	('Ho??ng C??ng H???u','Ho??ng Mai','0345066663','1998-3-12','2005-5-4'), 
															('Ho??ng C??ng H???i','H?? N???i','0345023463','1985-4-1','2004-6-14'), 
                                                            ('Nguy???n V??n ?????c','Nam ?????nh','0859066663','1995-5-8','2004-4-4'), 
															('Ph???m ????nh T','H?? N???i','0383796663','2002-6-15','2004-6-14'), 
                                                            ('Ho??ng C??ng H','Ho??ng Mai','0436066663','1998-3-12','2005-5-4'), 
															('Ho??ng V??n B','H?? N???i','0345693563','1985-4-1','2004-6-14'), 
                                                            ('Nguy???n V??n D','Nam ?????nh','0852346663','1995-5-8','2004-4-4'), 
															('Ph???m ????nh Th???','H?? N???i','0383987663','2002-6-15','2004-6-14'),
                                                            ('Ho??ng C??ng H???u1','Ho??ng Mai','0345066663','1998-3-12','2005-5-4'), 
															('Ho??ng C??ng H???i1','H?? N???i','0345023463','1985-4-1','2004-6-14'), 
                                                            ('Nguy???n V??n ?????c1','Nam ?????nh','0859066663','1995-5-8','2004-4-4'), 
															('Ph???m ????nh T1','H?? N???i','0383796663','2002-6-15','2004-6-14'), 
                                                            ('Ho??ng C??ng H1','Ho??ng Mai','0436066663','1998-3-12','2005-5-4'), 
															('Ho??ng V??n B1','H?? N???i','0345693563','1985-4-1','2004-6-14'), 
                                                            ('Nguy???n V??n D1','Nam ?????nh','0852346663','1995-5-8','2004-4-4'), 
															('Ph???m ????nh Th???1','H?? N???i','0383987663','2002-6-15','2004-6-14');
                                                            
INSERT INTO NV(HoTen,NgVL,SDT) VALUES	('Mai Thanh H???i','2005-2-2','0345066664'),
										('Nguy???n T??ng D????ng','2005-4-2','0349236664'),
                                        ('Nguy???n Th??? A','2005-6-2','0345098464');

INSERT INTO SP(TenSp,DVT,NuocSX,Gia) values	('Red Bull','Lon','Th??i Lan',12000),
											('M?? t??m H???o H???o','G??i','Vi???t Nam',4000),
											('Sting ?????','Chai','Vi???t Nam',8000),
                                            ('M?? t??m chua cay','g??i','Th??i Lan',5000),
                                            ('Revive' ,'Chai','M???',10000),
                                            ('Red Gold','Lon','Trung Qu???c',10000),
                                            ('B??nh bao','c??i','Trung Qu???c',8000), 
                                            ('M?? t??m Omachi','G??i','Vi???t Nam',8000),
											('SP1','Lon','Trung Qu???c',20000),
											('Sp2','G??i','Trung Qu???c',10000),
											('SP3','Chai','Trung Qu???c',8000);
                                            
INSERT INTO HoaDon(NgMua,MaKh,MaNv) VALUES 	('2005-12-1',1,1),
											('2006-1-1',1,1),
											('2004-7-1',2,1),
											('2005-12-1',2,2),
											('2006-5-3',3,3),
											('2006-6-1',4,3),
											('2006-5-12',5,1);
							
                                            
INSERT INTO HoaDon(MaKh,MaNv) VALUES 	(8,3),
										(8,1),
                                        (8,1),
										(6,3),
										(7,1),
                                        (8,2);

                             
                             
                             
 INSERT INTO CTHD VALUES 	(18,3,3),
							(19,3,3),
                            (20,8,2),
							(1,1,3),
							(2,3,1),
							(3,2,5),
							(3,3,1),
							(3,1,1),
							(3,4,1),
							(3,5,3),
							(4,1,2),
							(5,1,3),
							(6,5,1),
							(7,4,2),
							(8,3,3),
							(9,7,3),
                             (9,6,3),
                             (9,8,2),
                             (10,8,5);
