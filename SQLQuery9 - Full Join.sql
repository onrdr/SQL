

-- ***** FULL JOIN *****
-- Her iki tablonun bütün verilerini getirir. Hem left hem de right gibi davranır.

-- AŞağıdaki iki tabloda sadece BusinessEntityID farklı. 
-- iki tablo da execute edince iki tablonun da bütün datalar select ile from arasındaki columnlar her iki tablo değerleri için de geliyo.
-- Mesela ilk tablonun BusinessEntityID 1-20 arasında, ikinicinin ise 20-40 arasında ise oluşan result tabloda BusinessEntityID 1 den 40 a kadar sıralanır.


select 
PP.BusinessEntityID,
PP.FirstName,
PP.LastName,
SS.*
from Person.Person PP
full join Sales.SalesPerson SS
on PP.BusinessEntityID = SS.BusinessEntityID


select 
PP.BusinessEntityID,
PP.FirstName,
PP.LastName,
SS.*
from Person.Person PP
full join Sales.SalesPerson SS
on PP.BusinessEntityID = SS.BusinessEntityID