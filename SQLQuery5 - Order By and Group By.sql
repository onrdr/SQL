-- ***** Order By *****
select * from Production.Product
where 
ProductNumber like '%20%' -- productNumber including 20
order by ProductID -- Ascending Order

select * from Production.Product
where 
ProductNumber like '%20%'
order by ProductID desc -- Descending Order

-- ***** Group By *****  
select Color, Sum(SafetyStockLevel) Sum, AVG(ListPrice) Average from Production.Product
where Color is not null
group by Color   
-- Grouped by color and gives sum and avg of each color that is not null

-- You can use having instead of where
select Color, Sum(SafetyStockLevel) Sum, AVG(ListPrice) Average from Production.Product
group by Color   -- Grouped by color and gives sum and avg of each color that is not null
having Color is not null