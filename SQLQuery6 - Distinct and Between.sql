-- ***** DISTINCT ***** : Give me existing list of any column without any repetation
-- Birden fazla aynı değere sahip column lar var. Mesela 100 tane black olan satır var vs vs
-- Distinct ile sadece renklerin hangileri olduğunu veren data çekebiliyorum (Set of color gibi): 

-- Örnek : 
select ProductID, ProductNumber, Name, Color from Production.Product
where 
ProductID in 
(
select distinct ProductID from Sales.SalesOrderDetail  
-- Burdan bize id ler verecek biz de onları kullanarak production.product ile eşleşen id lerin üstte belirtilen özelliklerini görecez
-- Bunu bir parametre gibi düşünebiliriz. 
-- Mesela (id 707) parametre olarak sales den geliyo ve Production.Product tablosunda 707 ile eşleşen değerin bilgilerini alıyorum
)
-- Örnek
select Color, SUM(ListPrice) Sum from Production.Product
where 
ProductID in 
(
select distinct ProductID from Sales.SalesOrderDetail  
)
and Color is not null
group by Color

-- 1) Product tablosundan color ve sum of ListPrice diye iki column oluşturdum
-- 2) Kural 1 : Sadece Sales den gelen Id lerin eşleştiği color ve onlarım sum ları sıralanacak 
-- 3) Kural 2 : Ayrıca color null olmayacak ve gruplamayı color a göre yapacaz. 
-- 4) Sonuç olarak hangi color dan ne kadar satılmış görmek için oluşturulmuş bi liste oldu 


-- ***** Between *****
select * from Production.Product
where 
ProductID >= 1 and ProductID <= 500
-- Yukarıdaki kullanım yerine aşağıdaki between de kullanılabilir

select * from Production.Product
where 
ProductID between 1 and 500
