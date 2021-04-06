--insert sorgularý

--Kategoriler tablosuna yeni bir kategori ekleyen sorgu
insert into Categories (CategoryName)
values('Yepyeni kategor')

--Ürünler tablosuna yeni bir ürün ekleyelim
insert into Products
(ProductName,SupplierID,CategoryID,UnitsInStock,UnitPrice,Discontinued) 
values('Son ürün',29,9,20,25.5,0)
