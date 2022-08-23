 use AdventureWorks2017
 --***** Select Komutunun İncelenmesi *****
-- select : Tablolarımızın içerisindeki datalara ulaşmamızı sağlayan komut
-- select kolonlarımızın isimleri / * from tablo adı
select * from Person.Person  
-- çok uzun tablolarda select from çok kullanılmaz
select 
BusinessEntityID,
PersonType,
FirstName,
LastName
from Person.Person
-- İki yukarıda da select var : select * from Person.Person ... Hemen yukarıda da select ve from içerisinde bazı data kolonları yazdık : BusinessEntityID, vs vs 
-- *** Eğer alt alta yazılılarsa bu şekilde her ikisi de çalışır. Fakat sadece birini çalıştırmak istiyorsak sadece onu select ve from sonuna kadar mouse ile seçmemiz lazım
-- select ve from arasına hangi kolonları alırsak sadece onların olduğu veri tablosu gelir
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--***** Kolonları Yeniden İncelemek *****

-- Person.Person tablosundan değer çektik.
-- 3 farklı kolon var burda. 
select Title,FirstName,LastName from Person.Person 

-- Kolonları birleştirmek için + operatöründen yararlanıyoruz : firstname ve last name i tek bir kolonda birleştirdik
select Title,FirstName + ' '+ LastName from Person.Person 

-- Kolonları yeniden adlandırmak : "as" kullanarak veya as olmadan yapılabilir.
-- Title için as kullandım ve tabloda title olan yeri ünvan diye değiştirdi. 
-- Firstname ve lastname için kullanmadım ama birşey farketmedi. Onların isimlerini de tabloda değiştirdi
select Title as Ünvan, FirstName İsim ,LastName Soyisim from Person.Person

-- Aşağıdaki şekilde tablo kolonlarına yeniden ad verdiğimizde bazı kelimeleri birleştirebiliyoruz : 
-- [İsim Soyisim] için [] kullanmamızın sebebi boşluk karakterinin hata vermesini önlemek
select Title as Ünvan, FirstName İsim ,LastName Soyisim, FirstName + ' ' + LastName [İsim Soyisim] from Person.Person
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ***** Sorgulama işlemlerinde "Top" kullanımı
select top 10 * from Person.Person  -- sadece tablodan en üstteki 10 satır veriyi bana göster

select top 10 BusinessEntityID, FirstName + ' ' + LastName as FullName from Person.Person  -- verilen kolonların 10 tane verisini getir

select top 10 percent * from Person.Person -- Tablonun yüzde 10 kadarını getir