-- 1.Hien thi danh sach tat ca hoc vien 
select	* from baitapthem.Students;
-- 2.Hien thi danh sach mon hoc
select * from baitapthem.Subjects;
-- 3.tinh diem trung binh 
select	s.StudentID, s.StudentName, sj.SubjectName ,avg(m.Mark)
from	baitapthem.Students as s, baitapthem.Subjects as sj, baitapthem.Marks as m
where 	s.StudentID=m.StudentID and m.SubjectID=sj.SubjectID
group by StudentID ,SubjectName
;

-- 4.hien thi mon hoc co hoc sinh duoc diem cao nhat

select 	sj.SubjectName as 'Mon co diem cao nhat'
from baitapthem.Subjects as sj, baitapthem.Marks as m
where sj.SubjectID=m.SubjectID and m.Mark=(select max(Mark) from baitapthem.Marks)
;

-- 5.danh so thu tu cua diem theo chieu giam
select * from baitapthem.Marks as m
order by m.Mark desc;
-- 6.thay doi kdl cua Subject name
alter table baitapthem.Subjects 
	modify column SubjectName nvarchar(10000) not null;
    
-- 7.
-- chua xong
update baitapthem.Subjects 
set SubjectName='Day la mon hoc'+SubjectName;


-- 8.
alter table baitapthem.Students 
add constraint check(Age>15 and Age <50); 
-- 9.
alter table baitapthem.Marks
drop constraint Marks_ibfk_1,
drop constraint	Marks_ibfk_2;
    
alter table baitapthem.ClassStudent
drop constraint ClassStudent_ibfk_1,
drop constraint ClassStudent_ibfk_2;

-- 10
	delete from baitapthem.Students 
    where StudentID=1;
-- 11
alter table baitapthem.Students 
add column Status bit default 1;
-- 12
update baitapthem.Students
set Status=0
where StudentID>0;