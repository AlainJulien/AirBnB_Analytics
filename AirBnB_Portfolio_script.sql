select * from listings$;

--Projected Monthly revenue for the next 30 days within AirBnBs in Newark--
select id, host_url, price, availability_30, (30-availability_30) as booked_days,
(price)*(30-availability_30) as proj_monthly_rev
from listings$
order by proj_monthly_rev desc
offset 0 rows fetch next 25 rows only;

--Most reviewed AirBnB in Newark--
select * from reviews$;

select r.listing_id, l.name, l.host_url, count(r.id) as no_of_reviews
from reviews$ r
inner join listings$ l on r.listing_id = l.id
group by r.listing_id, l.name, l.host_url
order by count(r.id) desc
offset 0 rows fetch next 20 rows only;

--AirBnBs rated nice/beautiful in Newark--
select r.listing_id, l.name, l.host_url, count(r.id) as no_of_reviews
from reviews$ r
inner join listings$ l on r.listing_id = l.id
where r.comments LIKE '%nice%' OR r.comments LIKE '%beautiful%'
group by r.listing_id, l.name, l.host_url
order by count(r.id) desc
offset 0 rows fetch next 25 rows only;