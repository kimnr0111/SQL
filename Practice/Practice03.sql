--문제 1.
select employee_id "사번",
       first_name "이름",
       last_name "성",
       department_name "부서명"
from employees e, departments d
where e.department_id = d.department_id
order by department_name asc, employee_id desc;

--문제 2.
select employee_id "사번",
       first_name "이름",
       salary "급여",
       department_name "부서명",
       job_title "현재업무"
from employees e, departments d, jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id
order by employee_id asc;

--문제 2-1.
select employee_id "사번",
       first_name "이름",
       salary "급여",
       department_name "부서명",
       job_title "현재업무"
from employees e left outer join departments d
on e.department_id = d.department_id, jobs j
where e.job_id = j.job_id
order by employee_id asc;

select employee_id "사번",
       first_name "이름",
       salary "급여",
       department_name "부서명",
       job_title "현재업무"
from employees e, departments d, jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id(+)
order by employee_id asc;

--문제 3.
select d.location_id,
       city,
       department_name,
       department_id
from locations l, departments d
where l.location_id = d.location_id
order by d.location_id asc;

--문제 3-1.
select d.location_id,
       city,
       department_name,
       department_id
from locations l, departments d
where l.location_id = d.location_id(+)
order by location_id asc;

--문제 4.
select region_name,
       country_name
from countries c, regions r
where c.region_id = r.region_id
order by region_name asc, country_name desc;

--문제 5.
select emp.employee_id "사원번호",
       emp.first_name "이름",
       emp.hire_date "채용일",
       man.first_name "매니저이름",
       man.hire_date "매니저입사일"
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

--문제 6.
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

--문제 7.
select jh.employee_id,
       first_name || ' ' || last_name "name",
       jh.job_id,
       start_date,
       end_date
from employees e, job_history jh
where e.employee_id = jh.employee_id
and jh.job_id = 'AC_ACCOUNT';

--문제 8.
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

--문제 9.
select emp.employee_id "사원번호",
       emp.first_name "이름",
       department_name "부서명",
       man.first_name "매니저 이름"
from employees emp, employees man, departments d
where emp.manager_id = man.employee_id
and emp.department_id = d.department_id(+);

select emp.employee_id "사원번호",
       emp.first_name "이름",
       department_name "부서명",
       man.first_name "매니저 이름"
from employees emp left outer join departments d
on emp.department_id = d.department_id, employees man
where emp.manager_id = man.employee_id;