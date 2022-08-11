#create database
create database if not exists persons_arrested_2014;

#calling data
select * from persons_arrested_2014_updated;

#finding number of rows
select count(*) from persons_arrested_2014_updated;

#finding number of columns
select count(*) from information_schema.columns
where table_name = 'persons_arrested_2014_updated';

#changing column name
alter table persons_arrested_2014_updated
rename column states_ut to States_ut,
rename column year_of_crime to Year_of_crime;

select * from persons_arrested_2014_updated;

#finding null values
select States_ut, Crimes, Year_of_crime, Persons_arrested_male, Persons_arrested_female, Persons_arrested_total
from persons_arrested_2014_updated
where States_ut is null;

#finding duplicate values
select distinct * from persons_arrested_2014_updated;

#------------------------------------------------------------------------------------------------------------------

#which states are registered most number of arrests in 2014?

select States_ut as States_UT,sum(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
group by States_ut
order by total_arrests desc;

#most cases registered based on gender

select States_ut as States_UT, sum(Persons_arrested_male) as Male , sum(Persons_arrested_female) as Female,sum(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
group by States_ut
order by total_arrests desc;

#top 10 crimes which most of the peoples were arrested in 2014

select Crimes,sum(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
group by Crimes
order by total_arrests desc
limit 10;

#top 10 crimes which most of the females were arrested?

select Crimes,sum(Persons_arrested_female) as Persons_arrested_female
from persons_arrested_2014_updated
group by Crimes
order by Persons_arrested_female desc
limit 10;

#top 10 crimes which most of the males were arrested?

select Crimes,sum(Persons_arrested_male) as Persons_arrested_male
from persons_arrested_2014_updated
group by Crimes
order by Persons_arrested_male desc
limit 10;

#Top 10 states where most of the females got arrested?

select States_ut,sum(Persons_arrested_female) as Persons_arrested_female
from persons_arrested_2014_updated
group by States_ut
order by Persons_arrested_female desc
limit 10;

#Top 10 states where most of the males got arrested?

select States_ut,sum(Persons_arrested_male) as Persons_arrested_male
from persons_arrested_2014_updated
group by States_ut
order by Persons_arrested_male desc
limit 10;

#for which crimes most of the peoples where arrested in kerala in 2014?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where States_ut = 'Kerala'
group by Crimes
order by total_arrests desc;

#for which crimes most of the peoples where arrested in uttar pradesh in 2014?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where States_ut = 'Uttar Pradesh'
group by Crimes
order by total_arrests desc
limit 10;

#which states have the more murder arrests?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where Crimes = 'Murder (Section 302 IPC)'
group by States_ut
order by total_arrests desc
limit 10;

#which states have the more dowery deaths arrests?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where Crimes = 'Dowry Deaths (Section 304-B IPC)'
group by States_ut
order by total_arrests desc
limit 10;

# which states have the more gang rape arrests?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where Crimes = 'Gang Rape'
group by States_ut
order by total_arrests desc
limit 10;

#which states have the more Voyeurism arrests?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where Crimes = 'Voyeurism (Section 354C IPC)'
group by States_ut
order by total_arrests desc
limit 10;

#which states have the more custodial rape arrests?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where Crimes = 'Custodial Rape'
group by States_ut
order by total_arrests desc;

#which states have the more caste conflict arrests?

select States_ut,Crimes,max(Persons_arrested_total) as total_arrests
from persons_arrested_2014_updated
where Crimes = 'Caste Conflict'
group by States_ut
order by total_arrests desc
limit 10;

