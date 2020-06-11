--���� 1.
select count(manager_id) haveMngCnt
from employees;

--���� 2.
select max(salary) "�ְ��ӱ�",
       min(salary) "�����ӱ�",
       max(salary) - min(salary) "�ְ��ӱ� - �����ӱ�"
from employees;

--���� 3.
select max(to_char(hire_date, 'YYYY"��"MM"��"DD"��"'))
from employees;

--���� 4.
select round(avg(salary), 0) "����ӱ�",
       max(salary) "�ְ��ӱ�",
       min(salary) "�����ӱ�",
       department_id "�μ����̵�(department_id)"
from employees
group by department_id
order by department_id desc;

--���� 5.
select round(avg(salary), 0) "����ӱ�",
       max(salary) "�ְ��ӱ�",
       min(salary) "�����ӱ�",
       job_id "�������̵�(job_id)"
from employees
group by job_id
order by min(salary) desc,
         avg(salary) asc;

--���� 6.
select min(to_char(hire_date, 'YYYY"��"MM"��"DD"��" DAY'))
from employees;

--���� 7.
select department_id "�μ�(department_id)",
       round(avg(salary), 0) "����ӱ�",
       min(salary) "�����ӱ�",
       round(avg(salary) - min(salary), 0) "����ӱ� - �����ӱ�"
from employees
group by department_id
order by avg(salary) - min(salary) desc;

--���� 8.
select job_title,
       max_salary - min_salary "�ְ��ӱ� - �����ӱ�"
from jobs
order by max_salary - min_salary desc;

--���� 9.
select manager_id,
       round(avg(salary), 1),
       max(salary),
       min(salary)
from employees
where hire_date >= '2005/01/01'
group by manager_id
having avg(salary) >= 5000
order by avg(salary) desc;

--���� 10.
select first_name,
       case when hire_date <= '02/12/31' then 'â�����'
            when hire_date <= '03/12/31' then '03���Ի�'
            when hire_date <= '04/12/31' then '04���Ի�'
            else '���������Ի�'
       end optDate
from employees
order by hire_date asc;