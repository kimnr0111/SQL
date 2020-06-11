--문제 1.
select count(manager_id) haveMngCnt
from employees;

--문제 2.
select max(salary) "최고임금",
       min(salary) "최저임금",
       max(salary) - min(salary) "최고임금 - 최저임금"
from employees;

--문제 3.
select max(to_char(hire_date, 'YYYY"년"MM"월"DD"일"'))
from employees;

--문제 4.
select round(avg(salary), 0) "평균임금",
       max(salary) "최고임금",
       min(salary) "최저임금",
       department_id "부서아이디(department_id)"
from employees
group by department_id
order by department_id desc;

--문제 5.
select round(avg(salary), 0) "평균임금",
       max(salary) "최고임금",
       min(salary) "최저임금",
       job_id "업무아이디(job_id)"
from employees
group by job_id
order by min(salary) desc,
         avg(salary) asc;

--문제 6.
select min(to_char(hire_date, 'YYYY"년"MM"월"DD"일" DAY'))
from employees;

--문제 7.
select department_id "부서(department_id)",
       round(avg(salary), 0) "평균임금",
       min(salary) "최저임금",
       round(avg(salary) - min(salary), 0) "평균임금 - 최저임금"
from employees
group by department_id
order by avg(salary) - min(salary) desc;

--문제 8.
select job_title,
       max_salary - min_salary "최고임금 - 최저임금"
from jobs
order by max_salary - min_salary desc;

--문제 9.
select manager_id,
       round(avg(salary), 1),
       max(salary),
       min(salary)
from employees
where hire_date >= '2005/01/01'
group by manager_id
having avg(salary) >= 5000
order by avg(salary) desc;

--문제 10.
select first_name,
       case when hire_date <= '02/12/31' then '창립멤버'
            when hire_date <= '03/12/31' then '03년입사'
            when hire_date <= '04/12/31' then '04년입사'
            else '상장이후입사'
       end optDate
from employees
order by hire_date asc;