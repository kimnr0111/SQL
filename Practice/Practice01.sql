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
order by salary desc;

--���� 6.
select first_name,
       salary,
       to_char(hire_date, 'YYYY-MM'),
       department_id
from employees;

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
join locations
on locations.country_id = countries.country_id
group by country_name
order by country_name asc;

--���� 10.
select first_name "�̸�",
       salary "����",
       replace(phone_number, '.', '-') "��ȭ��ȣ",
       hire_date "�Ի���"
from employees
where hire_date <= '03/12/31';