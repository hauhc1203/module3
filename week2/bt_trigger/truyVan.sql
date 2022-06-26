use bt_trigger;

-- 1
DROP VIEW chi_tiet_ban_hang;
CREATE VIEW chi_tiet_ban_hang AS
SELECT  HoaDon.*,CTHD.SL,SP.* ,KhachHang.HoTen
FROM CTHD 
	JOIN SP ON CTHD.MaSp=SP.MaSP
    JOIN HoaDon on	HoaDon.SoHD=CTHD.SoHd
    JOIN KhachHang ON KhachHang.MAKH=HoaDon.MaKh
ORDER BY  HoaDon.SoHD;

SELECT  COUNT(DISTINCT MaSp) as 'Số Lượng sản phẩm khác nhau được bán ra trong năm 2006'
FROM chi_tiet_ban_hang as ct
WHERE year(ct.NgMua)=2006
;


-- 2
SELECT MAX(TriGia) as 'hóa đơn cao nhất',Min(TriGia) AS 'hóa đơn Thấp nhất'
FROM HoaDon;

-- 3
SELECT AVG(TriGia) AS 'Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006'
FROM HoaDon AS hd
WHERE year(hd.NgMua)=2006;

-- 4
SELECT Sum(TriGia) AS 'Doanh thu trong năm 2006'
FROM HoaDon AS hd
WHERE year(hd.NgMua)=2006;
-- 5
SELECT MAX(TriGia) as 'hóa đơn cao nhất 2006'
FROM HoaDon as hd
WHERE year(hd.NgMua)=2006;

-- 6
SELECT kh.HoTen AS 'Tên KH có HĐ trị giá cao nhất 2006'
FROM chi_tiet_ban_hang AS kh
WHERE kh.TriGia=(
		SELECT MAX(TriGia) 
		FROM HoaDon as hd
		WHERE year(hd.NgMua)=2006
) AND year(kh.NgMua)=2006;

-- 7
SELECT MAKH,HoTen
FROM KhachHang
ORDER BY DoanhSo DESC
LIMIT 3;

-- 8
CREATE VIEW top_3_gia AS
SELECT DISTINCT s.Gia FROM SP AS s ORDER BY s.Gia DESC LIMIT 3;

SELECT sp.MaSP,sp.TenSp
FROM SP AS sp
WHERE sp.Gia  IN (SELECT Gia FROM top_3_gia);


-- 9
SELECT sp.MaSP,sp.TenSp
FROM SP AS sp
WHERE sp.Gia  IN (SELECT Gia FROM top_3_gia) AND sp.NuocSX='Thái Lan';

-- 10
                                            
CREATE VIEW top_3_gia_tq AS
SELECT DISTINCT s.Gia FROM SP AS s
WHERE s.NuocSX='Trung Quốc'
ORDER BY s.Gia DESC LIMIT 3;

SELECT sp.MaSP,sp.TenSp
FROM SP AS sp
WHERE sp.Gia  IN (SELECT Gia FROM top_3_gia_tq) AND sp.NuocSX='Trung Quốc';

-- 11
Select *, rank() over(order by DoanhSo DESC) as ranking 
from KhachHang
LIMIT 3
;
-- 12
SELECT COUNT(MaSP) 
FROM SP
WHERE NuocSX='Trung Quốc';

-- 13
SELECT	NuocSX , COUNT(MaSP) AS 'Sô Lượng'
FROM SP
GROUP BY NuocSX;

-- 14
SELECT	NuocSX , COUNT(MaSP) AS 'Sô Lượng',MIN(Gia) AS 'Min Price',MAX(Gia) AS 'Max Price',AVG(Gia) AS 'AVG Price'
FROM SP
GROUP BY NuocSX;

-- 15
SELECT DATE(NgMua) , SUM(TriGia) AS 'Doanh Thu'
FROM HoaDon
GROUP BY NgMua;

-- 16
SELECT TenSp,SUM(SL) AS 'Số lượng đã bán 5/2006'
FROM chi_tiet_ban_hang as ct
WHERE year(NgMua)=2006 and month(NgMua)=5
GROUP BY MaSP;

-- 17
CREATE VIEW doanh_thu_2006 as
SELECT month(NgMua) AS 'Thang',SUM(TriGia) AS 'DoanhThu'
FROM HoaDon 
WHERE year(NgMua)=2006 
GROUP BY month(NgMua);
-- 18
SELECT SoHD,NgMua,MaKh,MaNv,TriGia ,COUNT(DISTINCT MaSP) AS 'Số sp khác nhau'
from chi_tiet_ban_hang 
GROUP BY SoHD HAVING COUNT(DISTINCT MaSP) >3;
-- 19
SELECT SoHD,NgMua,MaKh,MaNv,TriGia ,COUNT(DISTINCT MaSP) AS 'Số SP VN'
from chi_tiet_ban_hang
WHERE NuocSX='Việt Nam' 
GROUP BY SoHD 
HAVING COUNT(DISTINCT MaSP)>1;

-- 20
CREATE VIEW so_lan_mua AS
SELECT ct.MaKh, COUNT(DISTINCT ct.SoHD) AS 'slm'
FROM chi_tiet_ban_hang  AS ct
GROUP BY ct.MaKh;


SELECT MaKh,HoTen,COUNT(DISTINCT SoHD) AS 'Số lần mua hàng'
FROM chi_tiet_ban_hang
GROUP BY MaKh
HAVING COUNT(DISTINCT SoHD) =(	SELECT MAX(slm) FROM so_lan_mua);

-- 21
SELECT Thang
FROM doanh_thu_2006
WHERE DoanhThu = (select max(DoanhThu) FROM doanh_thu_2006);

-- 22
CREATE VIEW so_luong_ban_2006 AS
SELECT TenSp,SUM(SL) AS 'SoLuong'
FROM chi_tiet_ban_hang as ct
WHERE year(NgMua)=2006 
GROUP BY MaSP;

SELECT * 
FROM so_luong_ban_2006
WHERE SoLuong=(SELECT MIN(SoLuong) FROM so_luong_ban_2006);


-- 23
CREATE VIEW max_price AS
SELECT MAX(Gia) as 'MaxPrice' ,NuocSX
FROM SP
GROUP BY NuocSX;

SELECT MaSp,TenSp,SP.NuocSX,Gia,MaxPrice
FROM SP JOIN max_price ON SP.NuocSX=max_price.NuocSX
WHERE Gia=MaxPrice
order BY SP.NuocSX;

-- 24 
SELECT  NuocSX, COUNT(DISTINCT Gia) as 'Số Sản phẩm có giá khác nhau'
FROM SP
GROUP BY NuocSX 
HAVING `Số Sản phẩm có giá khác nhau`>1;

-- 25

CREATE VIEW top_10_doanh_thu as													
SELECT MAKH ,HoTen,DoanhSo
FROM KhachHang
ORDER BY DoanhSo DESC
limit 10;

SELECT MaKh,HoTen,COUNT(DISTINCT SoHD) AS 'Số lần mua hàng'
FROM chi_tiet_ban_hang
WHERE MaKh in (SELECT MAKH FROM top_10_doanh_thu)
GROUP BY MaKh
HAVING COUNT(DISTINCT SoHD) =(	SELECT MAX(slm) FROM so_lan_mua);