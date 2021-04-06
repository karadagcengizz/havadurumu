--DDL (Data Defination Language)
--DML (Data Manipulation Language)
--select, insert, update, delete

--select

--M��terilerin adresini Adres, �lke ve �ehir bilgilerini birle�tirerek getiren sorgu.
select [Address],[Country],[City] from Customers

select [Address] 'Adres',[Country] '�lke',[City] '�ehir' --alias
from Customers

select [Address] as 'Adres',[Country] as '�lke',[City] as '�ehir' --alias
from Customers

--�lkesi "Me" ile ba�layan m��teriler
select * from Customers where Country like 'Me%'
--�lkesi "y" ile biten m��teriler
select * from Customers where upper(Country) like '%Y'
--�lke ad�nda "ar" ge�en m��teriler
select * from Customers where Country like '%ar%'

--Ya�� 50 ile 60 aras�nda olan �al��anlar
select *,datediff(year,BirthDate,getdate()) 'Ya��' from Employees
where datediff(year,BirthDate,getdate())>=50
and datediff(year,BirthDate,getdate())<=60

select *,datediff(year,BirthDate,getdate()) 'Ya��' from Employees
where datediff(year,BirthDate,getdate()) between 50 and 60

--Fax numaras� girilmemi� m��teriler
select * from Customers where Fax is null

--�lkesi Almanya �ehri Berlin olan m��teriler
select * from Customers where Country='Germany' and City='Berlin'

--son eklenen sipari�in bilgilerini getiren sorgu
select top 3 * from Orders order by OrderDate desc,OrderID desc

--�r�nleri kategori adlar� ile getiren sorgu
select P.ProductID,P.ProductName,C.CategoryName 
from Categories C
inner join Products P 
on C.CategoryID=P.CategoryID

--Kategoriler tablosundaki t�m kategorileri e�le�en �r�nlerle
--getiren sorgu
select P.ProductID,P.ProductName,C.CategoryName 
from Categories C
left join Products P 
on C.CategoryID=P.CategoryID 
where P.ProductID is null

--Kategoriler tablosundaki t�m kategorileri e�le�en �r�nlerle
--getiren sorgu
select P.ProductID,P.ProductName,C.CategoryName 
from Products P
right join Categories C 
on C.CategoryID=P.CategoryID 
where P.ProductID is null

--Sipari� bilgilerini sipari�te yap�lan al��veri� tutar� ile getiren sorgu
select O.OrderID,O.CustomerID,O.OrderDate,
sum(OD.Quantity*OD.UnitPrice) 'Total Price'
from Orders O
inner join [Order Details] OD
on O.OrderID=OD.OrderID
group by O.OrderID,O.CustomerID,O.OrderDate

--�u ana kadar toplam sipari� tutar� en y�ksek olan 
--ilk 3 m��teri
select top 3 C.CustomerID,C.Country+'/'+ C.City 'Country',
C.ContactName,C.Phone,sum(OD.Quantity*OD.UnitPrice) 'Total Price'
from [Order Details] OD
inner join Orders O on O.OrderID=OD.OrderID
inner join Customers C on C.CustomerID=O.CustomerID
group by C.CustomerID,C.ContactName,C.Phone,C.Country,C.City
order by sum(OD.Quantity*OD.UnitPrice) desc

--Ortalama sipari� say�s�n�n �zerinde sipari�i olan m��teriler
with resultset as
(
	select CustomerID,count(*) TotalOrder from Orders
	group by CustomerID
)
select * from resultset
where TotalOrder>()
