
-- Kısıtlayıcı : Not Null : Karşısına not null işaretlenen columnların içeriği doldurulurken not null yazılamaz 
create table constraintNotNull
(
ID int not null,
Name nvarchar(50),
LastName nvarchar(50) not null
)
----------------------------------------------------------------------------------------------------------------------
-- Kısıtlayıcı : Unique : Belirtilen columnların benzersiz olduğunu sağlıyo. 
-- TCKN gibi mesela. Aynı değerde ikinci bir kaydın olmasını istemediğimiz değerler unique olur 
create table constraintUnique
(
ID int not null unique,
Name nvarchar(50),
LastName nvarchar(50) not null,
EmailAdress nvarchar (100) unique
)
----------------------------------------------------------------------------------------------------------------------
-- Kısıtlayıcı : Primary Key : Diğer tablolar ile ilişki kurmada yardımcı olan tablo değeri		 
create table constraintPrimaryKey
(
ID int primary key, -- means not null and unique 
Name nvarchar(50),
LastName nvarchar(50),
)
----------------------------------------------------------------------------------------------------------------------
-- Kısıtlayıcı : Check : Verilen kriterlere uygun bir kayıt girilirse kabul eder, uygun değilse kaydedilmez
create table constraintCheck
(
ID int primary key, 
Name nvarchar(50),
LastName nvarchar(50),
Age int not null check (Age >= 18)  
)
---------------------------------------------------------------------------------------------------------------------- 
-- Kısıtlayıcı : Default : İlgili kolonları null olarak bırakırsak verdiğimiz default değerleri null değerlerin içine atar
create table constraintDefault
(
ID int primary key, 
Name nvarchar(50),
LastName nvarchar(50),
CreatedTime DateTime default getDate()  -- Tarih girmezsen eğer anlık tarihi ilgili kolona otomatik atar
)
----------------------------------------------------------------------------------------------------------------------
-- Kısıtlayıcı : Foreign Key : Aynı özellikte birden fazla değer varsa mesela adres bilgisi, iletişim bilgisi, bunları tek bir kolonda tutamayız
-- 
create table constraintForeignKey_Client
(
ClientID int primary key, 
ClientNo int,
Name nvarchar(50),
LastName nvarchar(50),
TCKN nvarchar(15),
VKN nvarchar(15),
CreatedTime DateTime default getDate()
)

create table constraintForeignKey_ClientInfo
( 
ID_Client int,
InfoID int primary key,
İletişimTipi int, -- 1: GSM / 2: Açık Adres / 3: Sabit Telefon /
Değer nvarchar(500), 
CreatedTime DateTime default getDate()
foreign key (ID_Client) references constraintForeignKey_Client (ClientID)  -- bu tabloda ID_Client değeri bir foreign key
-- bu key, constraintForeignKey tablosundaki ClientID kolonuna referans ediyor diye de belirtmek gerekiyor.
-- Yani bu tablodaki bir kolonu diğer bir tablodaki bir değer ile eşleştiriyoruz
)
 
----------------------------------------------------------------------------------------------------------------------
select * from constraintForeignKey_Client
