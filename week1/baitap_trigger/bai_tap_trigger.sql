use qlsp_trigger;

create table SP(
	pID int(4) auto_increment primary key,
    pName varchar(50) not null,
    pPrice DOUBLE not null
    );
    
CREATE TABLE HoaDon(
	oID int(4) AUTO_INCREMENT PRIMARY KEY,
    total DOUBLE DEFAULT 0.0,
    ngayBan datetime DEFAULT NOW()
    );
CREATE TABLE HoaDonCT(
	pId int(4) not null,
    oId int(4) not null,
    quantity TINYINT not null,
    CONSTRAINT pk PRIMARY KEY(pId,oId),
    CONSTRAINT fk1 FOREIGN KEY(pId) REFERENCES SP(pID),
    CONSTRAINT fk2 FOREIGN KEY(oId) REFERENCES HoaDon(oID)
    );
    
INSERT INTO SP(pName,pPrice) values	('Bánh mì',8000),
									('Sting đỏ',10000),
                                    ('Red bull',12000),
                                    ('Mỳ tôm Hảo hảo',4000);
INSERT INTO HoaDon VALUES	(),
							(),
							();



drop trigger after_insert_order_detail;
delimiter //
CREATE TRIGGER after_insert_order_detail AFTER INSERT 
on HoaDonCT FOR EACH ROW
BEGIN
	update  HoaDon
    set total=total+NEW.quantity*(select pPrice from SP WHERE pID=NEW.pId)
    WHERE oID=new.oId;
end//
delimiter ;


delimiter //
CREATE TRIGGER after_delete_order_detail AFTER DELETE 
on HoaDonCT FOR EACH ROW
BEGIN
	update  HoaDon
    set total=total-old.quantity*(select pPrice from SP WHERE pID=old.pId)
    WHERE oID=old.oId;
end//
delimiter ;



drop trigger after_update_order_detail;

delimiter //
CREATE TRIGGER after_update_order_detail AFTER UPDATE 
on HoaDonCT FOR EACH ROW
BEGIN
	DECLARE giaTien double;
    select pPrice into giaTien from SP WHERE pID=old.pId;
    
	update  HoaDon
    set total=total+(NEW.quantity-old.quantity)*giaTien
    WHERE oID=old.oId;
end//
delimiter ;

INSERT INTO HoaDonCT value(1,1,10);
INSERT INTO HoaDonCT value(2,1,3);

update	HoaDonCT
set 	quantity=2
where pId=2 and oId=1;

DELETE FROM HoaDonCT WHERE pId=2 and oId=1;

INSERT INTO HoaDonCT value(1,2,3);

INSERT INTO HoaDon VALUES	();