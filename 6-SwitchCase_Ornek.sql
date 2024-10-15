--Çalýþanlarým içerisinde 1992 yýlýnda iþe girenlere 'Çok eski' , 1993 yýlýnda iþe girenlere 'Eski Çalýþan' , 1994 yýlýnda iþe girenlere 'Yeni Çalýþan ' þeklinde diðer bilgileriyle listeleyelim
use NORTHWND
go
select
	(FirstName + ' ' +LastName) as 'Full Name',
	Title,
	HireDate,
	(
	case
		when YEAR(HireDate)=1992 then 'Çok Eski Çalýþan'
		when YEAR(HireDate)=1993 then 'Eski Çalýþan'
		when Year(HireDate)=1994 then 'Yeni Çalýþan'
	end 
	) as ÇalýþanTürü

from Employees


--Ürünlerim içerisinde stok miktarý 20 ' nin altýnda olan ürünlere 'Stok Bitmek Üzere' , 50'nin altýnda olanlara 'Stoklarý gözden geçiriniz', diðerlerine ise 'Stokta Sorun yok' bilgilerinin yazdýðý bir kolon ile ürünleri stok miktarýna göre listeleyelim
--(Kategori adý , tedarikçi adý , ürün adý , stok miktarý , stok bilgisi(case))

select
	Categories.CategoryName,
	Suppliers.CompanyName,
	ProductName,
	UnitsInStock,
	(
	case
		when UnitsInStock=0 then 'Stokta Ürün Yok'
		when UnitsInStock<20 then 'Stok Bitmek Üzere'
		when UnitsInStock<50 then 'Stoklarý Gözden Geçiriniz'
		else 'Stokta Sorun Yok'
	end
	) as UnitInStockInfo
from Products
	inner join Categories on Products.CategoryID=Categories.CategoryID
	inner join Suppliers on Products.SupplierID=Suppliers.SupplierID
order by Products.UnitsInStock asc