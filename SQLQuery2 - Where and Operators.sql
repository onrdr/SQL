-- ***** Sorgularımızda WHERE Kullanımı ***** // Bunu epey çok kullanıyoruz. VERY IMPORTANT
use AdventureWorks2017
select * from Person.Person
-- person tablosunda person type değeri EM olan kayıtları getir : 
-- where kullanımı : select * from tablo_adi where şart veya şartlarımız
select * from Person.Person 
where 
PersonType = 'EM'  -- persontype EM olan kayıtları person.person içerisinden aldık

-- Örnek : Adı Ken olan kayıtları getir
select * from Person.Person
where FirstName = 'ken'

-- Örnek : color kolonunda değeri black olan kayıtların name, product number ve color değerlerini getir :
select Name, ProductNumber, Color from Production.Product
where color ='black'

-- AND Operatörü
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color  from Production.Product
where color ='black' and SafetyStockLevel='500'

-- OR Operatörü
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color  from Production.Product
where color ='black' or SafetyStockLevel='500'

--  > (büyüktür) Operatörü
select * from Production.Product
where SafetyStockLevel > '500'

--  >= (büyük eşittir) Operatörü 
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color from Production.Product
where SafetyStockLevel >= '500'

--  < (küçüktür) Operatörü 
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color from Production.Product
where SafetyStockLevel < '10'

--  <= (küçük eşittir) Operatörü
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color from Production.Product
where SafetyStockLevel <= '60'

--  = (eşittir) Operatörü 
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color from Production.Product
where SafetyStockLevel <= '60' and Color = 'Black'

--  != (eşit değildir) Operatörü
select ProductID, Name,  ProductNumber, SafetyStockLevel, Color from Production.Product
where SafetyStockLevel <= '60' or Color != 'NULL'

-- ÖDEV 1: Renk değeri black veya yelow olan kayıtların ilk 60 tanesini göster 
select top 60 * from Production.Product
where Color = 'yellow' or Color = 'black'

-- ÖDEV 2: Renk değeri multi olan kayıtların standartcost değeri 6 dan büyük olanların productId, Color, Name ve ProductNumber değerlerini birleştirip  getir
select ProductId, Name, Color, ProductNumber from Production.Product
where Color = 'multi' and StandardCost > 6

-- ÖDEV 3: List price değeri 0 dan büyük olan kayıtlatın toplam adedinin %10 oranına denk gelen kayıtları getir
select top 10 percent * from Production.Product
where ListPrice > 0
