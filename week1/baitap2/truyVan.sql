use quanly_hocsinh;

-- 5.
select * 
from SinhVien 
where HoTen like 'Trần%';

-- 6.
select * 
from SinhVien
where GioiTinh='Nữ' and HocBong>0;
-- 7.

select * 
from SinhVien
where GioiTinh='Nữ' or HocBong>0;

-- 8.
insert into SinhVien value(9,'Hoàng Công Anh','1984-2-2',0,'Nam',12);

select * 
from SinhVien 
where year(NgaySinh) between 1970 and 1985;


-- 9. 
select * 
from SinhVien
order by MaSV asc;

-- 10.
select * 
from SinhVien
order by HocBong desc;

-- 12,13
select * 
from SinhVien as sv join Lop as l join Khoa as k  on sv.MaL= l.MaLop  and	l.MaK= k.MaKhoa
where  HocBong >0 and k.TenKhoa='CNTT';

-- 14.
select l.TenLop, count(sv.MaSV) as 'So sv'
from SinhVien as sv join Lop as l on sv.MaL=l.MaLop
group by l.TenLop;

-- 15
select k.TenKhoa , count(sv.MaSV) as 'So Sv'
from SinhVien as sv join Lop as l join Khoa as k  on sv.MaL= l.MaLop  and	l.MaK= k.MaKhoa
group by k.MaKhoa;

-- 16
select k.TenKhoa , count(sv.MaSV) as 'So Sv'
from SinhVien as sv join Lop as l join Khoa as k  on sv.MaL= l.MaLop  and	l.MaK= k.MaKhoa
where sv.GioiTinh='Nữ'
group by k.MaKhoa  ;
-- 17
select l.TenLop, sum(sv.HocBong) as 'Tong tien hoc'
from SinhVien as sv join Lop as l on sv.MaL=l.MaLop
group by l.TenLop;

-- 18
select k.TenKhoa , sum(sv.HocBong) as 'Tong tien hoc'
from SinhVien as sv join Lop as l join Khoa as k  on sv.MaL= l.MaLop  and	l.MaK= k.MaKhoa
group by k.MaKhoa;

-- 19
select k.MaKhoa, k.TenKhoa , count(sv.MaSV) as 'Số lượng'
from SinhVien as sv join Lop as l join Khoa as k  on sv.MaL= l.MaLop  and	l.MaK= k.MaKhoa
group by k.MaKhoa having count(sv.MaSV)>2;

-- 20
select k.MaKhoa, k.TenKhoa , count(sv.MaSV) as 'Số lượng sv nữ'
from SinhVien as sv join Lop as l join Khoa as k  on sv.MaL= l.MaLop  and	l.MaK= k.MaKhoa
where sv.GioiTinh='Nữ'
group by k.MaKhoa having count(sv.MaSV)>1;

-- 22
select * 
from SinhVien
where HocBong =(select max(sv.HocBong) from SinhVien as sv);

-- 23.
select * 
from SinhVien as sv join KetQua as kq join MonHoc as mh on sv.MaSV=kq.MaS and kq.MaM=mh.MaMonHoc
where kq.Diem=(select max(kq.Diem) 
from SinhVien as sv join KetQua as kq join MonHoc as mh on sv.MaSV=kq.MaS and kq.MaM=mh.MaMonHoc
where mh.TenMonHoc='Linux') and mh.TenMonHoc='Linux';