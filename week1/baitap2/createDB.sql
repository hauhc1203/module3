use quanly_hocsinh;



CREATE TABLE Khoa (
    MaKhoa INT(4) PRIMARY KEY,
    TenKhoa NVARCHAR(100)
);
    
CREATE TABLE Lop (
    MaLop INT(4) PRIMARY KEY,
    TenLop NVARCHAR(50) NOT NULL,
    MaK INT(4),
    CONSTRAINT fk1 FOREIGN KEY (MaK)
        REFERENCES Khoa (MaKhoa)
);



CREATE TABLE SinhVien (
    MaSV INT(4) PRIMARY KEY,
    HoTen NVARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    HocBong INT DEFAULT 0,
    GioiTinh ENUM('Nam', 'Nữ', 'Khác') NOT NULL,
    MaL INT(4) NOT NULL,
    CONSTRAINT fk2 FOREIGN KEY (MaL)
        REFERENCES Lop(MaLop)
);

CREATE TABLE MonHoc (
    MaMonHoc INT(4) PRIMARY KEY,
    TenMonHoc NVARCHAR(50) NOT NULL,
    SoTiet INT(2) NOT NULL
);
CREATE TABLE KetQua (
    Diem FLOAT NOT NULL,
    MaS INT(4) NOT NULL,
    MaM INT(4) NOT NULL,
    CONSTRAINT pk PRIMARY KEY (MaS , MaM),
    CONSTRAINT fk3 FOREIGN KEY (MaS)
        REFERENCES SinhVien (MaSV),
    CONSTRAINT fk4 FOREIGN KEY (MaM)
        REFERENCES MonHoc (MaMonHoc)
);


insert into Khoa values(1,'CNTT'),(2,'Kĩ thuật vật lý'),(3,'Kĩ thuật hóa học ');
insert into Lop values(11,'LTU15',1),(12,'NUT15',2),(13,'BCD',3);
insert into SinhVien value(1,'Hoàng Công Hậu','1998-12-25',5000000,'Nam',11);
insert into SinhVien values (2,'Nguyễn Tùng Dương','2002-3-12',5000000,'Nam',11),
							(3,'Nguyễn Văn Đức','1995-3-2',4012313,'Nam',11),
                            (4,'Trần Tại Thế','2002-3-12',0,'Nam',11),
                            (5,'Trần Thị Tại Thế','2002-3-1',0,'Nữ',12),
                            (6,'Hoàng Thị Hà','2005-3-12',5000000,'Nữ',12),
                            (7,'Hoàng Văn Hạnh','2002-3-12',5000000,'Nam',13),
                            (8,'Nguyễn Tùng Sơn','2002-3-12',0,'Nam',13);

insert into MonHoc values   (1,'Linux',15),
							(2,'AI',20),
                            (3,'Hóa Công',25),
                            (4,'Hóa Máy',30),
                            (5,'Sức bền vật liệu',15),
                            (6,'Vật lí đại cương',15);
                            
insert into KetQua values(9,1,1),(9,1,2), (9,4,1),(7,4,2),(8,2,1),(7,2,2),(6,3,1),(5,3,2),(9,7,3),(9,7,4),(7,8,3),(8,8,4),(9,5,5),(9,5,6),   (8,6,5),(9,6,6);                     
