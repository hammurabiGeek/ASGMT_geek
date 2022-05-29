--sql 1 （题目1）
SELECT u.age AS age,
       avg(r.rate) AS avgrate
FROM t_user AS u
    JOIN
    t_rating AS r on (u.userid=r.userid)
where r.moviedid = 2216
group by u.age
order by u.age ASC

--sql2 (题目2）
SElECT u.sex AS sex,
       m.moviename AS name,
       avg(r.rate) AS avgrate,
       count(m.moviename) AS total
FROM t_user AS u
     JOIN
    t_rating AS r on (u.userid=r.userid)
     JOIN
    t_movie AS m on (r.movieid=m.movieid)
WHERE u.sex = "M"
      group by m.moviename
having total >50
ORDER BY avgrate DESC
LIMIT 10;

--------sql3 （题目3）

CREATE TABLE temp01 AS
    SELECT u.userid
    FROM t_user AS u
         JOIN
        t_rating AS r  on (u.userid=r.userid)
    WHERE u.sex = "F"
    GROUP BY u.userid
    ORDER BY COUNT(*) DESC
    LIMIT 1;
------得出女性影评次数最多，userid=1150
------评分最高的10部电影
 CREATE TABLE temp02 AS
     SELECT r.movieid ,
            r.rate
     FROM  t_rating AS r
    WHERE r.userid = 1150
   ORDER BY r.rate DESC
   LIMIT 10;
------最终结果
CREATE TABLE finalRes AS
    SELECT m.moviename AS moviename,
           avg(r.rate) AS avgrate
    FROM temp02 AS t
        JOIN
        t_movie AS m on (t.movieid=m.movieid)
        JOIN
        t_rating AS r on (m.movieid=r.movieid)
       GROUP BY r.movieid ,m.moviename;




