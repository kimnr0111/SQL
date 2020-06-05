--���� 1.
select first_name || ' ' || last_name "�̸�",
       salary "����",
       phone_number "��ȭ��ȣ",
       hire_date "�Ի���"
from employees
order by hire_date asc;

--���� 2.
select job_title,
       max_salary
from jobs
order by max_salary desc;

--���� 3.
select first_name || ' ' || last_name,
       manager_id,
       commission_pct,
       salary
from employees
where manager_id is not null
and salary > 3000
and commission_pct is null;

--���� 4.
select job_title,
       max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;

--���� 5.
select first_name,
       salary,
       nvl(commission_pct, 0)
from employees
where 14000 > salary 
and salary >= 10000
order by salary desc;

--���� 6.
select first_name,
       salary,
       to_char(hire_date, 'YYYY-MM'),
       department_id
from employees
where department_id in (10, 90, 100);

--���� 7.
select first_name,
       salary
from employees
where first_name like '%s%'
or first_name like '%S%';

--���� 8.
select *
from departments
order by LENGTH(department_name) desc;

--���� 9.
select upper(country_name)
from countries
where region_id != 4
order by country_name asc;


--���� 10.
select first_name "�̸�",
       salary "����",
       replace(phone_number, '.', '-') "��ȭ��ȣ",
       hire_date "�Ի���"
from employees
where hire_date <= '03/12/31';
