use student;
/* number of record*/
select count(*) from student;

/* Find total number of male and female students */
select count( case
                when gender='Male' then 1
                end) as tot_boy,
		count(case
               when gender='Female' then 1
               end) as tot_girl from student;
               
/* find parent education with respect to no of students with average marks */

with a as (select distinct parenteduc,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by parenteduc)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by parenteduc
order by b desc;               

/* Marks with respect to parent maritalstatus */
with a as (select distinct parentmaritalstatus,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by parentmaritalstatus)

select parentmaritalstatus,(avg_maths+avg_read+avg_write)/3 as b from a
group by parentmaritalstatus
order by b desc;   

/* Marks with respect to practicesport*/
with a as (select distinct practicesport,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by practicesport)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by practicesport
order by b desc;

/* Marks with respect to FirstChild*/

with a as (select distinct isfirstchild,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by isfirstchild)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by isfirstchild
order by b desc;

 /* Marks with respect to no of siblings*/
 
 with a as (select distinct nrsiblings,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by nrsiblings)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by nrsiblings
order by b desc;

/* Does Means of transportation effect marks */
 with a as (select distinct transportmeans,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by transportmeans)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by transportmeans
order by b desc;

/* weekly study hours effecting marks */
with a as (select distinct wklystudyhours,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by wklystudyhours)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by wklystudyhours
order by b desc;

/* Characteristics of all columns of student with highest marks */
select *,mathscore from student
order by mathscore desc
limit 1;


/* Characteristic of student with lowest marks */

select *,mathscore from student
order by mathscore asc
limit 1;

/* Marks with respect to testprep */ 
with a as (select distinct testprep,count(column1) as num_stu,avg(mathscore) as avg_maths,avg(readingscore) as avg_read,
avg(writingscore) as avg_write from student
group by testprep)

select *,(avg_maths+avg_read+avg_write)/3 as b from a
group by testprep
order by b desc;

/* calculating average marks with different test conditions */

select *,(mathscore+readingscore+writingscore)/3 as avgmarks from student
where parenteduc like "master's degree"
and parentmaritalstatus like "widowed"
and isfirstchild like "yes"
and practicesport like "regularly"
order by avgmarks desc;

/* Second set of condition*/
select *,(mathscore+readingscore+writingscore)/3 as avgmarks from student
where parenteduc like "master's degree"
and parentmaritalstatus like "widowed"
and isfirstchild like "yes"
and transportmeans like "private"
order by avgmarks desc;

/*3rd set of test*/
select *,(mathscore+readingscore+writingscore)/3 as avgmarks from student
where parenteduc like "master's degree"
and parentmaritalstatus like "married"
and isfirstchild like "yes"
and practicesport like "regularly"
order by avgmarks desc;





 

 
 


