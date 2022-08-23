--***** Inner Join ***** : İki veya daha fazla tabloyu birleştirir

-- select * from table_1 inner join table_2 on table1.columnName = table2.columnName
select * from HumanResources.Employee
select * from Person.Person

-- we have two table above : How to join them is below

-- Örnek : Joining to tables via a common property
select * from Person.Person inner join HumanResources.Employee 
on Person.BusinessEntityID = Employee.BusinessEntityID 
-- we joined two table in one table via their common property of BusinessEntityID
order by Employee.BusinessEntityID desc 
-- You cannot just write BusinessEntityID, because the table it belongs to is not certain

-- Above example modified :  
select * from Person.Person as PP inner join HumanResources.Employee as HRE  
-- We can give nickname to tables and use them like PP or HRE (whatever you chose)
on PP.BusinessEntityID = HRE.BusinessEntityID 
order by PP.BusinessEntityID desc 
-- or you can use => HRE.BusinessEntityID instead of PP.BusinessEntityID. It s the same table anymore

-- Örnek : Getting the desired columns only, after joining them
select 
PP.BusinessEntityID,
PP.FirstName,
PP.LastName,
PP.PersonType,
HRE.BirthDate,
HRE.JobTitle 
from Person.Person as PP inner join HumanResources.Employee as HRE
on PP.BusinessEntityID = HRE.BusinessEntityID 

