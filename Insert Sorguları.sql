--insert sorgular�

--Kategoriler tablosuna yeni bir kategori ekleyen sorgu
insert into Categories (CategoryName)
values('Yepyeni kategor')

--�r�nler tablosuna yeni bir �r�n ekleyelim
insert into Products
(ProductName,SupplierID,CategoryID,UnitsInStock,UnitPrice,Discontinued) 
values('Son �r�n',29,9,20,25.5,0)
