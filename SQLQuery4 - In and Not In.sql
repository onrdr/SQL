-- ***** IN - NOT IN *****
select * from Production.Product
where ProductNumber In -- means including : aşağıdaki değerleri içeren kayıtları getir
(
'AR-5381',
'BA-8327',
'BE-2349',
'CA-6738',
'CN-6137'
)

select * from Production.Product
where ProductNumber Not In -- means not  including : aşağıdaki değerleri içermeyen kayıtları getir
(
'AR-5381',
'BA-8327',
'BE-2349',
'CA-6738',
'CN- 6137'
)

select * from Production.Product