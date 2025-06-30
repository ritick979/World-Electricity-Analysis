create database projectk;
use projectk;

select top 1 * from dist_losses
select top 1 * from nuclear_sources
select top 1 * from oil_sources
select top 1 * from renewable_sources
select top 1 * from  rular_world
select top 1 * from electricity_total
----Comparison of access to electricity post 2000s in different countries---\


SELECT COUNTRY_Name, round(sum(_2001 + _2002+ _2003 + _2004  + _2005 + _2006 + _2007 
+ _2008 + _2009 + _2010  + _2011 + _2012 + _2013 + _2014 + _2015  + _2016 + _2017 +
_2018 + _2019 + _2020)/20,2)  AS AVERAGE_OF_ELECTRICITY_IN_POST_2000S
FROM electricity_total
group by
Country_Name;

----Present a way to compare every country’s performance with respect to world average for every year.
---As in, if someone wants to check how is the accessibility of electricity in India in 2006 as compared
---to average access of the world to electricity ----

select country_name ,round(sum(_1990+_1991+_1992+_1993+_1994+_1995+_1996+_1997+_1998+_1999+_2000+_2001 + _2002+ _2003 + _2004  + _2005 + _2006 + _2007 
+ _2008 + _2009 + _2010  + _2011 + _2012 + _2013 + _2014 + _2015  + _2016 + _2017 +
_2018 + _2019 + _2020)/31,2) AS AVERAGE_OF_ELECTRICITY,_1990,_1991,_1992,_1993,_1994,_1995,_1996,_1997,_1998,_1999,_1999,_2000,_2001,
_2002,_2003,_2004,_2005,_2006,_2007,_2008,_2009,_2010,_2011,_2012,_2013,_2014,_2015,_2016,_2017,_2018,_2019,_2020 from electricity_total
group by 
_1990,_1991,_1992,_1993,_1994,_1995,_1996,_1997,_1998,_1999,_1999,_2000,_2001,
_2002,_2003,_2004,_2005,_2006,_2007,_2008,_2009,_2010,_2011,_2012,_2013,_2014,_2015,_2016,_2017,_2018,_2019,_2020,Country_Name
order by Country_Name;

---A chart to depict the increase in count of country with greater than 75% electricity access in rural areas across different year.
---For example, what was the count of countries having ≥75% rural electricity access in 2000 as compared to 2010. 
Select count(case when _1990>=75 then 1 else 0 end) as _1990s,
count(*) as total_country from rular_world

--- excel part---


----Define a way/KPI to present the evolution of nuclear power presence grouped by Region and IncomeGroup. 
---How was the nuclear power generation in the region of Europe & Central Asia as compared to Sub-Saharan Africa. 

alter table metadata_country_code drop column column6

select region,IncomeGroup,round(sum(_1990+_1991+_1992+_1993+_1994+_1995+_1996+_1997+_1998+_1999+_2000+_2001 + _2002+ _2003 + _2004  + _2005 + _2006 + _2007 
+ _2008 + _2009 + _2010  + _2011 + _2012 + _2013 + _2014 + _2015),2) as Nueclear_Energy_Production  from metadata_country_code as mcc  join nuclear_sources as ns on ns.Country_Code = mcc.country_code
where region  is not null and IncomeGroup is not null
group by region,IncomeGroup order by Region,IncomeGroup

 
----A chart to present the production of electricity across different sources (nuclear, oil, etc.) as a function of time----
Select * from nuclear_sources
union
Select * from oil_sources
union 
select * from renewable_sources