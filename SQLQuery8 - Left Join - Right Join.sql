-- ***** Left Join ***** 

select 
PP.BusinessEntityID, 
PP.FirstName, 
PP.LastName, 
HRE.*
from 
Person.Person PP inner join HumanResources.Employee HRE
on PP.BusinessEntityID = HRE.BusinessEntityID
where PP.BusinessEntityID is not null 
order by PP.BusinessEntityID desc

-- PP içerisinde 20bin civarı satır var ve HRE de ise sadece 290 satır bilgi var
-- Eğer inner join dersem PP ve HRE nin ortak olan columnları birleşir 
-- Toplma olarak 290 tane satır bilgimiz olur. Aslında kümelerdeki intersection işlemi gibi

-- Left joinde ise ilk verdiğimiz tablo olan PP nin bütün değerlerini yazdırır. 
-- Daha sonra ikinci tablo olan HRE de ise PP ye uyanları yazdırır ve uymayanları da null olarak oluşturur
-- Toplam olarak 20bin civarı yani PP nin satır sayısı kadar elimizde data olur. 
-- 290 tane ortak içinde null olmayan bilgimiz olur ve geri kalan 19binden fazla satır ise HRE üzerinden null görünür
-- Bir çeşit kümelerde union işlemi gibi

-- ÖDEV : 
select * from Sales.SalesOrderDetail  
select * from Production.Product 

select 
PP.Name,
PP.ProductID,
PP.Color,
SOD.*
from Production.Product PP left join Sales.SalesOrderDetail SOD
on PP.ProductID = SOD.ProductID   

-- ***** Right Join ***** 
-- Bu sefer ikinci tablonun içindeki tüm değerleri getiriyo, ilk tabloda olmayan değerleri de null olarak getiriyo.
-- Left Join tam tersi 
select  
SP.BusinessEntityID,
Sp.Bonus,
PP.FirstName,
PP.LastName,
PP.BusinessEntityID
from Sales.SalesPerson SP right join Person.Person PP
on SP.BusinessEntityID = PP.BusinessEntityID
order by PP.BusinessEntityID

-- Yukarda Person bütün dataları önce yazılıyo sonra Sales ekleniyo ortak olanlar işleniyo olmayanlar null 
-- Sonuç : Dolayısıyla toplam 19 bin satır var (person toplam satır sayısı)
-----------------------------------------------------------------------------------------------------------------------
-- Aşağıda ise Sales bütün dataları önce yazılıyo sonra Person ekleniyo ortak olanlar işleniyo olmayanlar null 
-- Sonuç : Dolayısıyla toplam sadece 17 tane satır var (sales.salesperson 17 kişilermiş toplam)  

select  
SP.BusinessEntityID,
Sp.Bonus,
PP.FirstName,
PP.LastName,
PP.BusinessEntityID
from Sales.SalesPerson SP left join Person.Person PP
on SP.BusinessEntityID = PP.BusinessEntityID
order by PP.BusinessEntityID
   
