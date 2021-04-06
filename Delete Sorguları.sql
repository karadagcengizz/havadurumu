--delete sorgularý

delete Products where ProductID=100

delete Products where 
ProductID in (select ProductID from Products where QuantityPerUnit is null)


select count(*) from Categories