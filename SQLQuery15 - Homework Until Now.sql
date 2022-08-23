create database Homework 
-- *********************************************************************************************************************************************
-- *********************************************************************************************************************************************
 --Personeller adında bi tablo oluşturalım ve AdventureWorks2017.Person.Person & AdventureWorks2017.HumanResources.Employee 
 -- tablolarından aldığımız aşağıdaki bilgiler yeni Personeller tablosunun aşağıdaki bilgileri ile eşleşsin ve Personellere eklensin

 -- PP.BusinessEntityID ==> Personeller.Id
 -- PP.FirstName ==> Personeller.Name
 -- PP.LastName ==> Personeller.LastName
 -- PP den isim.soyisim@sekport.com olarak ayarlayıp ==> Personeller.EmailAdress
 -- HRE.Gender ==> Personeller.Gender
 -- getdate() ==> Personeller.CreateTime

create table Personeller
(
Id int primary key,
Name nvarchar(50) not null,
LastName nvarchar(50) not null,
EmailAdress nvarchar(200) unique not null,
Gender nchar(1),
CreateTime datetime not null,
BoolStatus bit default 'true'
)  
 

insert into Personeller (Id, Name, LastName, EmailAdress, Gender, CreateTime) 
select 
PP.BusinessEntityID,
PP.FirstName,
PP.LastName,
(Lower (PP.FirstName) + '.' + Lower (PP.LastName) + '@sekport.com') as EmailAdress,
HRE.Gender,
getdate() as Time
from AdventureWorks2017.Person.Person as PP
inner join AdventureWorks2017.HumanResources.Employee HRE on
PP.BusinessEntityID = HRE.BusinessEntityID
-- *********************************************************************************************************************************************
-- *********************************************************************************************************************************************

-- ÖDEV 2 Adding Store Procedure 
/*
1. PersonelEkle
2. PersonelDüzenle
3. PersonelSil

4. PersonelListe (Parametre Almayan)
5. PersonleGetirID(id alan sp, eğer değer girilmezse default : 0)
6. PersonelAraEmailAdress (Email adres değeri alacak zorunlu )
*/
 -----------------------------------------------------------------------------------------------------------------------------------------------
 -- 1. PersonelEkle
create proc PersonelEkle   
(  
@Id int,
@Name nvarchar (50),
@LastName nvarchar(50),
@EmailAdress nvarchar(50),
@Gender nchar(1),
@CreateTime datetime,
@BoolStatus bit
) 
as begin  
insert into Personeller (Id, Name, LastName, EmailAdress, Gender, CreateTime, BoolStatus) 
values (@Id, @Name, @LastName, @EmailAdress, @Gender, @CreateTime, @BoolStatus) 
return @@rowcount  -- Normalde etki eden kayıt sayısını bize return eder ve c# üzerinde bu int değerini kullanırız
-- ama bazı durumlarda geri dönüş olmuyor ve biz manuel olarak return @@rowcount kendimiz yazmak zorunda kalıyoruz
end
  
------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. PersonelDüzenle
create proc PersonelDüzenle  
(  
@Id int,
@Name nvarchar (50),
@LastName nvarchar(50),
@EmailAdress nvarchar(50),
@Gender nchar(1),
@CreateTime datetime,
@BoolStatus bit
) 
with encryption
as begin  
update Personeller
set 
Name = @Name,
LastName = @LastName,
EmailAdress = @EmailAdress
where 
Id = @Id
return @@rowcount
end
 
------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. PersonelSil
create proc PersonelSil  
(  
@Id int
) 
with encryption
as begin  
delete Personeller
where 
Id = @Id
return @@rowcount
end 
------------------------------------------------------------------------------------------------------------------------------------------------ 
-- 4. PersonelListe (Parametre Almayan) 
create proc PersonelListe 
as 
begin  
select * from Personeller
end  

------------------------------------------------------------------------------------------------------------------------------------------------ 
-- 5. PersonelGetirID(id alan sp, eğer değer girilmezse default : 0)
create proc PersonelGetirID
(
@Id int = 0
)
as 
begin  
select * from Personeller where Id = @Id
end   

------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. PersonelAraEmailAdress (Email adres değeri alacak zorunlu )
create proc PersonelAraEmailAdress
(
@EmailAdress nvarchar(200)
)
as 
begin  
select * from Personeller where EmailAdress = @EmailAdress
end  