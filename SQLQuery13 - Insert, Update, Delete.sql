
-- ***** INSERT :  Tablo içerisine yeni bir kayıt eklemek için insert komutunu kullanırız 
create table student 
(
Id int primary key,
Name nvarchar(50),
LastName nvarchar(50),
EmailAdress nvarchar(50)
)

select * from student 

insert into student (Id, Name, LastName) values (1, 'Onur', 'Derman')
-- Id column = 1 , Name column = Onur ve LastName kolonuna = Derman değerlerini ekle

-- ***** Eğer column belirtmezsem, tablodaki bütün column lara bir değer eklemeyi taahhüt ediyorum demektir.
insert into student values (2, 'Onur2', 'Derman2', 'onrdrmn@gmail.com')
 -------------------------------------------------------------------------------------------------------------------------------------
 -- ***** UPDATE :  Tablo içerisine bir kaydın değerlerini update etmek için update komutunu kullanırız. Genelde where ile kullanılır
 update student 
 set 
 Name = 'Onur2',
 LastName = 'Derman2'
 where Id = 2

 -- Burda where Id = 2 dedikten sonra bir veya birden fazla constraint daha koyabiliriz : 
 -- where Id = 2 and Name = 'Onur'    
 -- where Id = 2 or Name = 'Onur'     
 -- ===>>> Bu tarz kullanımlar da mümkün ve çoğaltılabilir. Birden fazla operatör veya constraint eklenebilir.

 -------------------------------------------------------------------------------------------------------------------------------------
 -- ***** DELETE :  Tablo içerisine bir kaydın değerlerini silmek için delete komutunu kullanırız. Genelde where ile kullanılır
 delete student
 where 
 Id = 2  
 -- Burda where Id = 2 dedikten sonra bir veya birden fazla constraint daha koyabiliriz : 
 -- where Id = 2 and Name = 'Onur'    
 -- where Id = 2 or Name = 'Onur'     
 -- ===>>> Bu tarz kullanımlar da mümkün ve çoğaltılabilir. Birden fazla operatör veya constraint eklenebilir.
