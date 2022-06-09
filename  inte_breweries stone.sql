select * from int_breweries;

/*Within the space of the last three years, what was the profit worth of the 
breweries, inclusive of the anglophone and the francophone territories*/
select case when countries in ('Nigeria','Ghana')
then 'anglophone countries'
else 'francophone countries'
end as territories,years,
sum (profit) as total_profit
from int_breweries
group by 1,2 
order by 2 asc;

QUESTION 2
/*Compare the total profit between these two territories in order for 
the territory manager, Mr. Stone made a strategic
decision that will aid profit maximization in 2020*/

select case when countries in ('Nigeria','Ghana')
then 'anglophone countries'
else 'francophone countries'
end as territories,sum (profit) as total_profit
from int_breweries
group by 1;

QUESTION 3
/*Country that generated the highest profit in 2019*/
 select sum (profit) as highest_profit, countries
 from int_breweries
 where years = '2019'
 group by 2
 order by 1 desc
 limit 1;
 
 Question 4
 --Help him find the year with the highest profit.
 select years,sum (profit)  as highest_profit
 from int_breweries
 group by 1
 order by 2 desc
 limit 1;
 
 Question 5
 --Which month in the three years was the least profit generated
 select months, sum (profit) as least_profit
 from int_breweries
 group by 1
 order by 2 asc
 limit 1;
 
 Question 6
 --What was the minimum profit in the month of December 2018?
 select months, min (profit) as min_profit
 from int_breweries
 where years = '2018' and months = 'December'
 group by 1;

 
 Question 8
 -- Which particular brand generated the highest profit in Senegal?
select brands, sum (profit) as highest_profit
from int_breweries
where countries = 'Senegal'
group by 1
order by 2 desc
limit 1;

--BRAND ANALYSIS
-- Within the last two years, the brand manager wants to know the top three brands 
--consumed in the francophone countries.
select brands, sum (quantity) as quantity_sold
from int_breweries
where countries in ('Togo','Senegal','Benin')
and years in ('2018','2019')
group by 1
order by 2 desc
limit 3;

--Find out the top two choice of consumer brands in Ghana
select brands, sum (quantity) as quantity_sold
from int_breweries
where countries = 'Ghana'
group by 1
order by 2 desc
limit 2;

--Find out the details of beers consumed in the past three years in the most oil
--reached country in West Africa.
select sum (quantity), brands, years, cost, unit_price, profit, countries
from int_breweries
where countries = 'Nigeria' and not brands in ('beta malt','grand malt')
group by 2, 3, 4, 5, 6, 7
order by 1 desc;

--Question 4
--Favorites malt brand in Anglophone region between 2018 and 2019
select brands, sum (quantity)
from int_breweries
where years in ('2018','2019')
and brands like '%malt'
and countries in ('Nigeria', 'Ghana')
group by 1
order by 2 desc;

--Question 5
--Which brands sold the highest in 2019 in Nigeria?
select brands, sum (quantity) 
from int_breweries
where countries = 'Nigeria' and years = '2019'
group by 1
order by 2 desc
limit 1;

--Question 6
--Favorites brand in South_South region in Nigeria
select brands, quantity
from int_breweries
where countries = 'Nigeria' and region = 'southsouth'
group by 1,2
order by 2 desc;

--Question 7
-- Beer consumption in Nigeria
select sum (quantity) as total_consumed, countries
from int_breweries
where countries = 'Nigeria' and brands not like 'malt'
group by 2;

--Level of consumption of Budweiser in the regions in Nigeria
select brands, region, sum (quantity) as consumed
from int_breweries
where brands = 'budweiser' and countries = 'Nigeria'
group by 1,2
order by 3 desc;

--Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
select brands, region, sum (quantity) as consumed
from int_breweries
where brands = 'budweiser' and countries = 'Nigeria' and years = '2019'
group by 1,2
order by 3 desc;
--southsouth is the lowest consumed so there should sales in the region 

--SESSION 2
--COUNTRIES ANALYSIS
-- Country with the highest consumption of beer
select sum (quantity) as consumed, countries
from int_breweries
where brands not like 'malt'
group by 2
order by 1 desc
limit 1;

--Highest sales personnel of Budweiser in Senegal
select sales_rep, quantity as consumed
from int_breweries
where brands = 'budweiser' and countries = 'Senegal'
group by 1,2
order by 2 desc;

--Country with the highest profit of the fourth quarter in 2019
select countries, sum (profit) as highest_profit
from int_breweries
where years ='2019' and months = 'October' or months = 'November' or months = 'December'
group by 1
order by 2 desc
limit 1;
