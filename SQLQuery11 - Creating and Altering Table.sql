
create table tableName
(
ID int ,
Name nvarchar(50),
LastName nvarchar(50)
)

-- alter komutu ile tablo düzenleme

alter table tableName
add OluşturmaTarihi datetime  -- yeni bir column oluşturma işlemi

alter table tableName
drop column OluşturmaTarihi  -- column silme işlemi

alter table tableName
alter column Name nvarchar(100)  -- name column türününü uzunluğunu değiştirme.

drop table tableName  -- tabloyu komple silme
 