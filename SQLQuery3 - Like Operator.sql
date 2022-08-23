
-- ***** LIKE Kullanımı ***** 
-- Geniş arama yapmamızı sağlar. Örnekler : 
-- ProductCode değeri AB ile başlayan kayıtları getir
-- İçerisinde 1290 olan kayıtları getir
-- Son değeri 9 olan kayıtları getir

-- Kullanımları : 	   
-- where colomn name like '%a'   : Başında ne olursa olsun, sonunda a olan kayıtları getir
-- where colomn name like 'a%'   : Başında a ile başlayan ve davamında ne olursa olsun bana kayıtları getir.
-- where colomn name like '%a%'  : Başında ve sonunda ne olursa olsun, içerisinde a harfi geçen bütün kayıtları getir
-- where colomn name like '_a%'  : İlk karakteri ne olursa olsun, ikinci karakteri a olan kayıtları getir
-- where colomn name like 'a%b'  : a ile başlayıp b ile biten bütün değerleri getir
-- like '%a'
select * from Production.Product
where ProductNumber like '%1'

-- like 'a%'
select * from Production.Product
where ProductNumber like 'H%'

-- like '%a%'
select * from Production.Product
where ProductNumber like '%W%'

-- like '_a'
select * from Production.Product
where ProductNumber like '_A%'

--***** Ödev 1: HumanResource.Employee tablosunda, NationalIDNumber içerisinde 96 geçen
-- Job Title değeri research ile başlayan, cinsiyeti M olan çalışan listesini getir
select * from HumanResources.Employee
where NationalIDNumber like '%96%' and 
JobTitle like 'research%' and 
Gender = 'M' 

--***** Ödev 2: ProductID değeri 100 den büyük ve 1000 den küçük olan 
-- CarrierTrackingNumber son iki değeri AE olan satış detaylarını getir
select * from  Sales.SalesOrderDetail
where ProductID > 100 and ProductID < 1000 and 
CarrierTrackingNumber like '%AE'

