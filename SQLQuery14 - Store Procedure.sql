 
create table Personnels
(
Id int primary key,
Name nvarchar(50),
LastName nvarchar(50),
EmailAdress nvarchar(50),
CreateTime datetime default getDate(), 
ChangeTime datetime default getDate(),
HasErased bit
)
-- *******************************************************************************************************************************
-- Store procedure öncesi tek tek şöyle yazmak gerekiyodu
insert into Personnels values (1, 'Onur','Derman','onrdrmn@gmail.com', getdate(), null, 0)
-- *******************************************************************************************************************************
-- Store procedure oluşturmak  
create proc AddPersonnelRegistration  
-- ==> Şu alanda tutuluyor : AdventureWorks201 => Programmability => Stored Procedures => dbo.AddPersonnelRegistration
( 
-- parametreler : 
@Id int,
@Name nvarchar (50),
@LastName nvarchar(50),
@EmailAdress nvarchar(50)
) 
as begin  
insert into Personnels (Id, Name, LastName, EmailAdress, CreateTime, HasErased) values 
(@Id, @Name, @LastName, @EmailAdress) 
end

-- Eğer procedure encapsüle etmek istiyorsak buraya şu ifadeyi eklemeliyiz ==> with encryption
-- with encryption
-- as begin  
-- insert into Personnels (Id, Name, LastName, EmailAdress, CreateTime, HasErased) values 
-- (@Id, @Name, @LastName, @EmailAdress) 
-- end

-- procedure çalıştırmak için : 
exec AddPersonnelRegistration @Id = 6, @Name = 'Onur5', @LastName = 'Derman5', @EmailAdress = 'onrdrmn3@gmail.com'
-- *******************************************************************************************************************************
-- procedure güncellemek :  
alter proc AddPersonnelRegistration
(
@Id int,
@Name nvarchar (50),
@LastName nvarchar(50),
@EmailAdress nvarchar(50)
)
as begin  
insert into Personnels (Id, Name, LastName, EmailAdress, CreateTime, ChangeTime, HasErased) values 
(@Id, @Name, @LastName, @EmailAdress, getdate(), getdate(), 1) 
end
-- *******************************************************************************************************************************
-- procedure silmek : 
drop proc AddPersonnelRegistration
-- *******************************************************************************************************************************
-- Parametre almayan procedure de oluşturulabilir. Kullanımm amacı daha çok select ile tablo verisi almak
create proc GetPersonnel
as begin  
select * from Personnels
end

exec GetPersonnel
-- *******************************************************************************************************************************



