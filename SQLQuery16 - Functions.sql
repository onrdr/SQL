
-- *************************************** MIN & MAX ********************************************************     
select  
color,
max (SafetyStockLevel) MaxValue,
min (ReorderPoint) MinValue
from Production.Product
group by Color 
order by MaxValue


-- *************************************** COUNT ********************************************************  
select count (*) from Production.Product  -- Total number of row in Production.Product

select count(*) from HumanResources.Employee
where 
LoginID = 'adventure-works\ken0'
and NationalIDNumber = '295847284'

select 
Color,
Count(*) as ToplamMiktar
from Production.Product
where Color is not null 
group by Color


-- *************************************** SUM & AVG && COUNT ********************************************************  
select sum (SafetyStockLevel) ToplamDeger from Production.Product
select count (SafetyStockLevel) CountOf from Production.Product
select avg (SafetyStockLevel) Average from Production.Product

select  
concat(PP.FirstName, ' ',PP.LastName) FullName,
sum (SSOD.LineTotal) TotalLineSum,
avg (SSOD.LineTotal) TotalLineAverage
from 
Sales.SalesOrderHeader SSOH
inner join 
Sales.SalesOrderDetail SSOD
on SSOH.SalesOrderID = SSOD.SalesOrderDetailID
inner join 
Person.Person PP 
on SSOH.SalesPersonID = PP.BusinessEntityID
where 
SSOH.OrderDate = '2011-05-31 00:00:00.000'
group by CONCAT(PP.FirstName,' ',PP.LastName)


-- *************************************** UPPER & LOWER ********************************************************
select 
LoginID, 
UPPER(LoginID) BüyükHarf_LoginID, 
JobTitle,
LOWER(JobTitle) KüçükHarf_JobTitle,
LOWER(UPPER(LoginID)) ToUpper_Then_ToLower_LoginID  -- First Upper and then lower ==> can use functions inner style  
from HumanResources.Employee


-- *************************************** LEN & CONCAT & SUBSTRING ********************************************************
select 
FirstName,
MiddLeName,
LastName,
LEN(FirstName) FirsName_Length, -- Length of the string 
CONCAT(FirstName + SPACE(3), MiddleName) NameAndMiddleName,  -- you can select the number of space u want to put btw two string 
SUBSTRING (LastName,1,3) FirstThreeChar_Name,  --  Gives 3 character starting from the first character 
-- ==> If name is DERMAN then output will be DER ==> first three char
SUBSTRING(UPPER(LastName), 1 ,3) FirstThreeChar_Name_UPPER  -- Fonksiyonları bu şekilde iç içe de kullanabiliyoruz
from Person.Person
where LEN(MiddleName) > 0


-- *************************************** RIGHT & LEFT ********************************************************
select 
FirstName, 
LastName,
RIGHT(FirstName, 3) LastThreeChar_Name,
LEFT(LastName, 3) FirstThreeChar_LastName 
from Person.Person 