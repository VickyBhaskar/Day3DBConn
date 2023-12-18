create database exercise
use exercise
create table Products
(PId int primary key,
PQ int not null,
PPrice float,
DiscountPercent int,
ManufacturingDate Date)
INSERT INTO Products (PID, PQ, PPrice, DiscountPercent, ManufacturingDate)
VALUES 
    (1, 10, 50.0, 10, '2022-01-01'),
    (2, 20, 100.0, 15, '2022-02-15'),
    (3, 5, 30.0, 5, '2022-03-10'),
    (4,  15, 75.0, 12, '2022-04-20'),
    (5,  8, 40.0, 8, '2022-05-05')


select * from Products

create function fnProducts
( 
@price float,
@discount int,
@mfgdate date )
returns float
As
begin
return (@price-(@discount*(@price/100)))
end
select PId,PQ,PPrice,DiscountPercent, dbo.fnProducts(PPrice,DiscountPercent,ManufacturingDate) as 'Discounted Price' from Products
