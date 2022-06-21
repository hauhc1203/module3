use fptfresher;
-- 3
SELECT dx.DongXe as 'Hãng xe', dx.SoChoNgoi
FROM DongXe as dx
WHERE dx.SoChoNgoi>5;
-- 4
SELECT * 
FROM NCC AS n JOIN DangKyCungCap as dk JOIN MucPhi as m JOIN DongXe as dx on n.MaNCC=dk.MaNcc and dk.MaP=m.MaMP and dx.DongXe=dk.DongX
WHERE dx.HangXe='Toyota' and m.DonGia='100000'
UNION
SELECT * 
FROM NCC AS n JOIN DangKyCungCap as dk JOIN MucPhi as m JOIN DongXe as dx on n.MaNCC=dk.MaNcc and dk.MaP=m.MaMP and dx.DongXe=dk.DongX
WHERE dx.HangXe='Ford' and m.DonGia='90000';
-- 5
SELECT * 
FROM NCC AS n
ORDER BY n.TenNCC ,n.MaSoThue DESC;
;
-- 6
SELECT n.TenNCC as 'Nha cung cap',COUNT(dk.MaDKCC) as 'So lan dang ky'
FROM NCC as n join DangKyCungCap as dk on n.MaNCC=dk.MaNcc
WHERE dk.NgayBatDauCC>'2015-11-20'
GROUP BY n.TenNCC;
-- 7
SELECT DISTINCT dx.HangXe as 'Hãng xe'
FROM DongXe as dx;
-- 8
SELECT dk.MaDKCC,n.*,ldv.TenLoaiDV,m.DonGia,dx.HangXe,dk.NgayBatDauCC,dk.NgayKetThucCC
FROM NCC AS n 
	LEFT JOIN DangKyCungCap AS dk  ON n.MaNCC=dk.MaNcc 
    LEFT JOIN LoaiDV as ldv ON dk.MaLoaiDv=ldv.MaLoaiDV
    LEFT JOIN MucPhi AS m ON dk.MaP=m.MaMP
    LEFT JOIN DongXe AS dx ON dk.DongX=dx.DongXe;
-- 9
SELECT *
FROM NCC AS n JOIN DangKyCungCap as dk JOIN DongXe AS dx on	 n.MaNCC =dk.MaNcc and dk.DongX =dx.DongXe
WHERE dx.HangXe='Toyota' OR dx.HangXe='Ford';
-- 10
SELECT *
FROM NCC 
WHERE MaNCC not in( SELECT MaNcc FROM DangKyCungCap);
