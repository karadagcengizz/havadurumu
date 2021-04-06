--DDL (Data Defination Language)
--DML (Data Manipulation Language)
--select, insert, update, delete

--select

--Müşterilerin adresini Adres, Ülke ve Şehir bilgilerini birleştirerek getiren sorgu.
select [Address],[Country],[City] from Customers

select [Address] 'Adres',[Country] 'Ülke',[City] 'Şehir' --alias
from Customers

select [Address] as 'Adres',[Country] as 'Ülke',[City] as 'Şehir' --alias
from Customers

--Ülkesi "Me" ile başlayan müşteriler
select * from Customers where Country like 'Me%'
--Ülkesi "y" ile biten müşteriler
select * from Customers where upper(Country) like '%Y'
--Ülke adında "ar" geçen müşteriler
select * from Customers where Country like '%ar%'

--Yaşı 50 ile 60 arasında olan çalışanlar
select *,datediff(year,BirthDate,getdate()) 'Yaşı' from Employees
where datediff(year,BirthDate,getdate())>=50
and datediff(year,BirthDate,getdate())<=60

select *,datediff(year,BirthDate,getdate()) 'Yaşı' from Employees
where datediff(year,BirthDate,getdate()) between 50 and 60

--Fax numarası girilmemiş müşteriler
select * from Customers where Fax is null

--Ülkesi Almanya şehri Berlin olan müşteriler
select * from Customers where Country='Germany' and City='Berlin'

--son eklenen siparişin bilgilerini getiren sorgu
select top 3 * from Orders order by OrderDate desc,OrderID desc

--Ürünleri kategori adları ile getiren sorgu
select P.ProductID,P.ProductName,C.CategoryName 
from Categories C
inner join Products P 
on C.CategoryID=P.CategoryID

--Kategoriler tablosundaki tüm kategorileri eşleşen ürünlerle
--getiren sorgu
select P.ProductID,P.ProductName,C.CategoryName 
from Categories C
left join Products P 
on C.CategoryID=P.CategoryID 
where P.ProductID is null

--Kategoriler tablosundaki tüm kategorileri eşleşen ürünlerle
--getiren sorgu
select P.ProductID,P.ProductName,C.CategoryName 
from Products P
right join Categories C 
on C.CategoryID=P.CategoryID 
where P.ProductID is null

--Sipariş bilgilerini siparişte yapılan alışveriş tutarı ile getiren sorgu
select O.OrderID,O.CustomerID,O.OrderDate,
sum(OD.Quantity*OD.UnitPrice) 'Total Price'
from Orders O
inner join [Order Details] OD
on O.OrderID=OD.OrderID
group by O.OrderID,O.CustomerID,O.OrderDate

--Şu ana kadar toplam sipariş tutarı en yüksek olan 
--ilk 3 müşteri
select top 3 C.CustomerID,C.Country+'/'+ C.City 'Country',
C.ContactName,C.Phone,sum(OD.Quantity*OD.UnitPrice) 'Total Price'
from [Order Details] OD
inner join Orders O on O.OrderID=OD.OrderID
inner join Customers C on C.CustomerID=O.CustomerID
group by C.CustomerID,C.ContactName,C.Phone,C.Country,C.City
order by sum(OD.Quantity*OD.UnitPrice) desc

--Ortalama sipariş sayısının üzerinde siparişi olan müşteriler
with resultset as
(
	select CustomerID,count(*) TotalOrder from Orders
	group by CustomerID
)
select * from resultset
where TotalOrder>()
