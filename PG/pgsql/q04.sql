--q1
SELECT movid,title FROM movies
where EXTRACT(YEAR FROM movies.releasedate)>=2021;

--q2
SELECT review.userid FROM movies
NATURAL JOIN review where movies.movid=review.movid
and movies.title='Casablanca'
order by userid;

--q3
-- 1959 >=7 and 2016 <=4
(select userid from review r
    natural join movies m where m.title = 'Ben-Hur' and extract(year from m.releasedate)='1959' and rating>=7
intersect
((select userid from review r where r.movid=(select movid from movies where title = 'Ben-Hur'
and extract(year from releasedate)='2016') and r.rating<=4)))
union
-- 1959 >=7 and 2016 dne
((select userid from review r
natural join movies m where m.title = 'Ben-Hur' and extract(year from m.releasedate)='1959' and rating>=7
intersect
-- those who did not review 2016 ver
(select userid from review except (select userid from review r
natural join movies m where m.title = 'Ben-Hur' and extract(year from m.releasedate)='2016'))))
order by userid;
/* jack23ss jill33 tdude veronica4 */

-- shorter version
select distinct userid from review r
natural join movies m where m.title = 'Ben-Hur' and extract(year from m.releasedate)='1959' and rating>=7
intersect
(select userid from review r where r.movid=(select movid from movies where title = 'Ben-Hur'
and extract(year from releasedate)='2016') and r.rating<=4 union (select userid from review except
(select userid from review r natural join movies m where m.title = 'Ben-Hur' and
extract(year from m.releasedate)='2016'))) order by userid;

--q4
SELECT title, releasedate, rating FROM users
    NATURAL JOIN review
    NATURAL JOIN movies where email='talkiesdude@movieinfo.com'
ORDER BY rating DESC;

--q5
(SELECT movid,title,releasedate FROM movies
    NATURAL JOIN moviegenres where genre='Comedy'
        AND EXTRACT(YEAR FROM releasedate)='2021'
    )
INTERSECT
(SELECT movid,title,releasedate FROM movies
    NATURAL JOIN moviegenres where genre='Sci-Fi'
        AND EXTRACT(YEAR FROM releasedate)='2021')
ORDER BY releasedate, title;

--q6 not sure what they're asking by language/place of production
(select distinct title,releasedate from movies natural join releaselanguages
 where language='French')
except
(select title,releasedate from movies natural join releaselanguages where language='English')
order by releasedate, title;

--q7 --not done
-- select title,releasedate,language from movies natural join releaselanguages r where movies.movid = r.movid and language='Italian'
-- union
-- (select title,releasedate,language from movies natural join releaselanguages r where movies.movid = r.movid and language='French');
select distinct title,releasedate,string_agg(language,',' order by language) from movies
    natural join releaselanguages r where movies.movid = r.movid and language in ('Italian','French')
group by title,releasedate
;
--q8
--distinct?
select distinct userid, email from users natural join review r where users.userid = r.userid
and movid in
(select movid from releaselanguages where language='French'
intersect
(select movid from releaselanguages group by movid having count(*)=1))
order by email;

--q9
SELECT count(*) as nummovies FROM movies
NATURAL JOIN moviegenres WHERE genre='Comedy' AND EXTRACT(YEAR FROM releasedate)='2021';

--q10
select title,releasedate from movies m natural join releaselanguages r where m.movid=r.movid and language='English'
intersect (
    select title,releasedate from movies m natural join releaselanguages r where m.movid=r.movid and language='French'
)
intersect (select title,releasedate from movies m natural join releaselanguages r where movid in
    (select movid from review group by movid having count(movid)>=5)
)
order by releasedate, title;

--q11
(SELECT title,releasedate FROM movies NATURAL JOIN review r
where movies.movid = r.movid
group by movid,title,releasedate
having count(movid)<=2)
union
(select title,releasedate FROM movies WHERE movid NOT IN (SELECT movid FROM review))
order by releasedate,title;

--q12
select title,releasedate,count(*) as numreviews from movies
    natural join review where extract(year from releasedate)='2021'
group by movid
union
(select title,releasedate,0 as numreviews from movies
where movid not in (select movid from review) and extract(year from releasedate)='2021')
order by numreviews desc, releasedate, title;

--q13
select distinct movid,title, releasedate
from movies m natural join review r where m.movid = r.movid
group by movid
having count(movid)= (
    select max(rcount) from
(select count(movid) rcount from movies m natural join review r
 where m.movid = r.movid group by movid) as mr )
order by releasedate,title;

--q14
select title, releasedate, avg(rating) avgrating
from movies m natural join review r where m.movid = r.movid
group by movid
having count(movid) >=2
order by avgrating DESC, releasedate, title;


--q15 should work fine but title gives me an error?
select title, coalesce(count(*),null) as numreviews from movies m natural join review r where m.movid=r.movid and releasedate in
(select max(releasedate) from movies)
group by title
;


-- select title,releasedate,count(*) as numreviews from movies
-- natural join review where extract(year from releasedate)='2021'
-- group by movid
-- union
-- (select title,releasedate,0 as numreviews from movies
--  where movid not in (select movid from review) and extract(year from releasedate)='2021')
-- order by numreviews desc, releasedate, title;

--q16
select distinct title,releasedate,avg(rating) from movies natural join moviegenres natural join review where movies.movid=moviegenres.movid and genre='Comedy' and movid in
(select distinct review.movid from review natural join users u where review.userid = u.userid and email<>'cinebuff@movieinfo.com')
and movid in (select distinct movid from review where rating>=(select * from (select avg(rating) from review natural join users
where review.userid=users.userid and users.email='cinebuff@movieinfo.com') as ratings))
group by title,releasedate;


--q17
select distinct email from review natural join users where review.movid in (
select movid from users natural join review r
where users.userid = (select users.userid from users where users.email='cinebuff@movieinfo.com')) and movid in
(select distinct movid from(
select movid,rating,userid from review natural join users u where review.userid = u.userid and u.email<>'cinebuff@movieinfo.com') as mr
group by movid,rating,userid
having rating between mr.rating-1 and mr.rating+1)
except (select users.email from users
where userid=(select users.userid from users where users.email='cinebuff@movieinfo.com'))
order by email;

--q18

select genre from(
select genre,rank() over (order by avg(r.rating) desc) rnk
from review r natural join moviegenres m
where r.movid = m.movid and r.userid = (select userid from users where email='cinebuff@movieinfo.com')
group by genre) as gr
where gr.rnk=1
order by genre;


--q19
select distinct title, releasedate from movies m natural join review r
where m.movid=r.movid and extract(year from releasedate)<=2017 group by movid having avg(rating)>=7
intersect
(select title, releasedate from movies m natural join review r
where m.movid=r.movid and extract(year from releasedate)>=2019 group by movid having avg(rating)<=5)
order by releasedate, title;

--q20
--try dis one
select rm.language, rm.genre from
(select language, genre, rank() over (partition by language order by count(*) desc) maxcnt
from moviegenres natural join releaselanguages r where moviegenres.movid = r.movid group by genre,language) rm
where rm.maxcnt=1;




