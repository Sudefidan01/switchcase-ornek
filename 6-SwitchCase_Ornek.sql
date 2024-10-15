--�al��anlar�m i�erisinde 1992 y�l�nda i�e girenlere '�ok eski' , 1993 y�l�nda i�e girenlere 'Eski �al��an' , 1994 y�l�nda i�e girenlere 'Yeni �al��an ' �eklinde di�er bilgileriyle listeleyelim
use NORTHWND
go
select
	(FirstName + ' ' +LastName) as 'Full Name',
	Title,
	HireDate,
	(
	case
		when YEAR(HireDate)=1992 then '�ok Eski �al��an'
		when YEAR(HireDate)=1993 then 'Eski �al��an'
		when Year(HireDate)=1994 then 'Yeni �al��an'
	end 
	) as �al��anT�r�

from Employees


--�r�nlerim i�erisinde stok miktar� 20 ' nin alt�nda olan �r�nlere 'Stok Bitmek �zere' , 50'nin alt�nda olanlara 'Stoklar� g�zden ge�iriniz', di�erlerine ise 'Stokta Sorun yok' bilgilerinin yazd��� bir kolon ile �r�nleri stok miktar�na g�re listeleyelim
--(Kategori ad� , tedarik�i ad� , �r�n ad� , stok miktar� , stok bilgisi(case))

select
	Categories.CategoryName,
	Suppliers.CompanyName,
	ProductName,
	UnitsInStock,
	(
	case
		when UnitsInStock=0 then 'Stokta �r�n Yok'
		when UnitsInStock<20 then 'Stok Bitmek �zere'
		when UnitsInStock<50 then 'Stoklar� G�zden Ge�iriniz'
		else 'Stokta Sorun Yok'
	end
	) as UnitInStockInfo
from Products
	inner join Categories on Products.CategoryID=Categories.CategoryID
	inner join Suppliers on Products.SupplierID=Suppliers.SupplierID
order by Products.UnitsInStock asc