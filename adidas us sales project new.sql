-- Dataset = adidas US sales
use adidas;
SELECT * FROM SALES;

/* for  sum(totalsales) and remove $ sigh we use string method*/
set sql_safe_updates = 0;
update sales set totalsales=replace(totalsales, '$', '');
update sales set totalsales=replace(totalsales, ',', '');
select cast(totalsales as unsigned) from sales;


--- Total product,Reatailers  and  Total sales...
select distinct(product) from sales; 
select distinct(Retailer) from sales;
select sum(totalsales) from sales;

 --- 1)TOP 5 Reatailers and their Sales Method....
select retailer,salesmethod,sum(totalsales) from sales group by retailer order by sum(totalsales) desc limit 5;


--- 2) Top 5 Product and their sales method....
select product ,sum(totalsales),salesmethod from sales group by totalsales order by sum(totalsales) desc limit 5;

---  3) TOP price wise Product....
SELECT distinct(product),(priceperunit) from SALES order by (priceperunit) desc ;

---  4) Data Between any Duration.....
SELECT * FROM sales WHERE InvoiceDate BETWEEN  2020-01-01 AND 2020-12-31 ;

--- 5) TO find any specific cty or states data ....
SELECT *  from SALES where city = 'boise';
SELECT *  from SALES where region = 'west'; 

--- 6)TOP 3 Region sales....
select region,sum(totalsales) from SALES group by region order by region desc limit 3;

---  7) Product and  unitssale...
select distinct(product),(unitssold) from sales;

--- 8)Product and sales...
select distinct(product),sum(totalsales) from sales group by product order by sum(totalsales) desc;

---  9)Reatailers and sales....
select Retailer,sum(totalsales) from sales group by Retailer order by sum(totalsales) desc;

--- 10) Top 3 Retailer saleswise.....
 select Retailer,sum(totalsales) from sales group by retailer order by sum(totalsales) desc limit 3;

--- 11)Top 3 Products ---
 select product,sum(totalsales) from sales group by product order by sum(totalsales) desc limit 3;


---  12)  Retailors product Unit Sold...
select (retailer),(unitssold) from sales;


---  12) Operational margin of Reatailers and products....
select distinct(product),(operatingmargin) from sales order by  operatingmargin desc;


/* Conclusion - 
1) Top region saleswise - WEST

2) Top 3 State - New York
                 Texas
				 California

2) Top 3 Products - Men's Street Footwear
					Men's Street Footwear
                    Women's Athletic Footwear.
                    
4) Top 3 Retailers-  sport direct
                     walmart
                     foot locker
		
5) Top 3 operating marginal products -  Women's Apparel
										 Women's Apparel
                                         Men's Apparel
6) Top sales method is - Outlet
*/




