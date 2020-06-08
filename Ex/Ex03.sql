select salary, first_name
from employees;

select avg(salary), first_name
from employees
group by first_name;

select *
from employees;

select manager_id
from employees;

select count(*)
from employees;

select count(manager_id)
from employees;

select count(*), count(manager_id)
from employees;

select count(*), count(commission_pct), avg(salary)
from employees;

select count(*)
from employees
where salary > 16000;

select count(manager_id)
from employees
where salary > 16000;

select count(manager_id), count(*)
from employees
where salary > 16000;

select sum(salary), count(*), round(avg(salary), 0)
from employees;

select avg(nvl(manager_id, 0))
from employees;

select max(salary)
from employees;

select min(salary)
from employees;

select max(salary), min(salary), sum(salary)
from employees;

select sum(salary), department_id
from employees
group by department_id;

select sum(salary), department_id, job_id
from employees
group by department_id, job_id;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000
and department_id = 100;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) < 20000
and sum(salary) > 10000;

select employee_id,
       first_name,
       job_id,
       salary,
       CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
            WHEN job_id = 'SA_REP'     THEN salary + salary * 0.2
            WHEN job_id = 'ST_CLERK'   THEN salary + salary * 0.3
            ELSE salary
       END realSalary
from employees;

select first_name "ÀÌ¸§", 
       department_id "ºÎ¼­",
       case when department_id >=10 and department_id <=50 then 'A-TEAM'
            when department_id >=60 and department_id <=100 then 'B-TEAM'
            when department_id >=110 and department_id <=150 then 'C-TEAM'
            else 'ÆÀ¾øÀ½'
       end "ÆÀ"
from employees;