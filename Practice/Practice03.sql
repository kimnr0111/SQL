--���� 1.
select employee_id "���",
       first_name "�̸�",
       last_name "��",
       department_name "�μ���"
from employees e, departments d
where e.department_id = d.department_id
order by department_name asc, employee_id desc;

--���� 2.
select employee_id "���",
       first_name "�̸�",
       salary "�޿�",
       department_name "�μ���",
       job_title "�������"
from employees e, departments d, jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id
order by employee_id asc;

--���� 2-1.
select employee_id "���",
       first_name "�̸�",
       salary "�޿�",
       department_name "�μ���",
       job_title "�������"
from employees e left outer join departments d
on e.department_id = d.department_id, jobs j
where e.job_id = j.job_id
order by employee_id asc;

select employee_id "���",
       first_name "�̸�",
       salary "�޿�",
       department_name "�μ���",
       job_title "�������"
from employees e, departments d, jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id(+)
order by employee_id asc;

--���� 3.
select d.location_id,
       city,
       department_name,
       department_id
from locations l, departments d
where l.location_id = d.location_id
order by d.location_id asc;

--���� 3-1.
select d.location_id,
       city,
       department_name,
       department_id
from locations l, departments d
where l.location_id = d.location_id(+)
order by location_id asc;

--���� 4.
select region_name,
       country_name
from countries c, regions r
where c.region_id = r.region_id
order by region_name asc, country_name desc;

--���� 5.
select emp.employee_id "�����ȣ",
       emp.first_name "�̸�",
       emp.hire_date "ä����",
       man.first_name "�Ŵ����̸�",
       man.hire_date "�Ŵ����Ի���"
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

--���� 6.
select country_name,
       c.country_id,
       city,
       l.location_id,
       department_name,
       department_id
from countries c, locations l, departments d
where l.country_id = c.country_id
and d.location_id = l.location_id
order by city asc;

--���� 7.
select jh.employee_id,
       first_name || ' ' || last_name "name",
       jh.job_id,
       start_date,
       end_date
from employees e, job_history jh
where e.employee_id = jh.employee_id
and jh.job_id = 'AC_ACCOUNT';

--���� 8.
select e.department_id,
       department_name,
       e.first_name,
       city,
       country_name,
       region_name
from employees e, departments d, locations l, countries c, regions r
where e.employee_id = d.manager_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id;

--���� 9.
select emp.employee_id "�����ȣ",
       emp.first_name "�̸�",
       department_name "�μ���",
       man.first_name "�Ŵ��� �̸�"
from employees emp, employees man, departments d
where emp.manager_id = man.employee_id
and emp.department_id = d.department_id(+);

select emp.employee_id "�����ȣ",
       emp.first_name "�̸�",
       department_name "�μ���",
       man.first_name "�Ŵ��� �̸�"
from employees emp left outer join departments d
on emp.department_id = d.department_id, employees man
where emp.manager_id = man.employee_id;