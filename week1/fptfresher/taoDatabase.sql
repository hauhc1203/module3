use fptfresher;
CREATE TABLE NCC (
    MaNCC INT(4) AUTO_INCREMENT NOT NULL,
    TenNCC NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    SoDT VARCHAR(10) NOT NULL,
    MaSoThue NVARCHAR(8) NOT NULL,
    CONSTRAINT pk1 PRIMARY KEY (MaNCC)
);
    
CREATE TABLE LoaiDV (
    MaLoaiDV INT(4) AUTO_INCREMENT PRIMARY KEY,
    TenLoaiDV NVARCHAR(50) NOT NULL
);
    
CREATE TABLE DongXe (
    DongXe NVARCHAR(50) PRIMARY KEY,
    HangXe NVARCHAR(50) NOT NULL,
    SoChoNgoi INT(4) NOT NULL
);
    
CREATE TABLE MucPhi (
    MaMP INT(4) AUTO_INCREMENT PRIMARY KEY,
    DonGia DOUBLE NOT NULL,
    MoTa TEXT
);
    
CREATE TABLE DangKyCungCap (
    MaDKCC INT(4) AUTO_INCREMENT NOT NULL,
    MaNcc INT(4) NOT NULL,
    MaLoaiDv INT(4) NOT NULL,
    DongX NVARCHAR(50) NOT NULL,
    MaP INT(4) NOT NULL,
    NgayBatDauCC DATE NOT NULL,
    NgayKetThucCC DATE NOT NULL,
    SoLuongXeDangKy INT(5) NOT NULL,
    CONSTRAINT pk2 PRIMARY KEY (MaDKCC),
    CONSTRAINT fk1 FOREIGN KEY (MaNcc)
        REFERENCES NCC (MaNCC),
    CONSTRAINT fk2 FOREIGN KEY (MaloaiDv)
        REFERENCES LoaiDV (MaLoaiDV),
    CONSTRAINT fk3 FOREIGN KEY (DongX)
        REFERENCES DongXe (DongXe),
    CONSTRAINT fk4 FOREIGN KEY (MaP)
        REFERENCES MucPhi (MaMP)
);
    
    
    
	INSERT INTO NCC VALUEs	(null,'VinFast','Hà Nội','0345066663','TTNCN01'),
							(null,'Mitsubishi','Toàn quốc','0345066669','TTNCN02'),
							(null,'Ford','TP HCM','0345063172','TTNCN03'),
                            (null,'Honda','TP HCM','0345063172','TTNCN04'),
							(null,'Suzuki','Hà Nội','0345063142','TTNCN05'),
							(null,'Toyota','Hà Nội','0345063342','TTNCN05');
                            
	INSERT INTO LoaiDV VALUES	(null,'Thuê xe đi lại trong vòn 50km'),
								(NULL,'Thuê xe đi du lịch');
                                

    INSERT INTO MucPhi VALUES	(NULL,100000,'100k/km'),
								(null,90000,'90000k/km');
    
    INSERT INTO DongXe VALUES	('SUV','Toyota',4),
								('CUV','Honda',5),
                                ('Sedan','Toyota',4),
                                ('PickUp','Ford',4),
                                ('Hiace','Ford',4),
                                ('Cerato','Ford',4),
                                ('Limousine','Huyndai',8);
                                
    INSERT INTO DangKyCungCap VALUES	(null,1,1,'SUV',1,'2022-6-1','2022-6-2',2),
										(null,2,2,'CUV',2,'2020-3-1','2020-3-4',5),
                                        (null,3,2,'Limousine',2,'1945-3-6','1945-3-7',1),
                                        (null,4,1,'Hiace',1,'2020-3-1','2020-3-4',3),
                                        (null,5,2,'Cerato',2,'2020-3-1','2020-3-4',1),
                                        (null,6,2,'Sedan',2,'2020-3-1','2020-3-4',8),
                                        (null,6,1,'PickUp',1,'2020-3-1','2020-3-4',2),
                                        (null,5,1,'Limousine',1,'2020-3-1','2020-3-4',1),
                                        (null,3,1,'Cerato',1,'2020-3-1','2020-3-4',5);