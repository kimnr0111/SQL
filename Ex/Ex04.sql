select *
from employees, departments;

select employee_id,
       first_name,
       em.department_id, -- 테이블명(별명)
       de.department_id, -- 테이블명(별명)
       department_name
from employees em, departments de
where em.department_id = de.department_id;

select first_name,
       department_name,
       job_title,
       em.job_id,
       em.department_id
from employees em, departments de, jobs
where em.department_id = de.department_id
and em.job_id = jobs.job_id;

select *
from employees e left outer join departments d
on e.department_id = d.department_id;

select *
from employees e, departments d
where e.department_id = d.department_id(+);

select *
from employees e right outer join departments d
on e.department_id = d.department_id;

select *
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.department_id, e.first_name, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;


select emp.employee_id, emp.first_name, emp.salary, emp.manager_id,
       man.manager_id, man.first_name manager, man.salary
from employees emp, employees man
where emp.manager_id = man.employee_id;

select *
from employees e, locations l
where e.salary = l.location_id; --주의
