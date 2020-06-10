--문제 1.
select count(salary)
from employees
where salary < (select avg(salary)
                from employees
                );

--문제 2.
select employee_id,
       first_name,
       salary,
       avg(salary),
       max(salary)
from employees
group by employee_id, first_name, salary
having salary >= (select avg(salary)
                  from employees
                  )
order by salary asc;

select employee_id,
       first_name,
       salary,
       avgsalary,
       maxsalary
from employees, (select round(avg(salary), 0) avgsalary,
                        max(salary) maxsalary
                 from employees
                 )
where salary >= (select avg(salary)
                  from employees
                  )
order by salary asc;
                
--문제 3.
select location_id,
       street_address,
       postal_code,
       city,
       state_province,
       country_id
from locations
where location_id = (select location_id
                     from departments
                     where department_id = (select department_id
                                            from employees
                                            where first_name = 'Steven'
                                            and last_name = 'King')
                                            );

--문제 4.
select employee_id,
       first_name,
       salary
from employees
where salary <any (select salary
                   from employees
                   where job_id = 'ST_MAN');
                   
--문제 5.

--조건절비교
select employee_id,
       first_name,
       salary,
       department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id
                                  )
order by salary desc; 

--테이블조인
select employee_id,
       first_name,
       e.salary,
       e.department_id
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id
                  ) m
where e.salary = m.salary
and e.department_id = m.department_id
order by salary desc;

--문제 6.
select j.job_title,
       e.sumsalary
from jobs j, (select job_id, 
                     sum(salary) sumsalary
              from employees
              group by job_id
              ) e
where j.job_id = e.job_id
order by e.sumsalary desc;

--문제 7.
select employee_id,
       first_name,
       e.salary
from employees e, (select department_id, 
                          avg(salary) salary
                   from employees
                   group by department_id
                   ) s
where e.department_id = s.department_id
and e.salary > s.salary;

select department_id,
       avg(salary)
from employees
group by department_id;

--문제 8.
select rn,
       r.employee_id,
       r.first_name,
       r.salary,
       r.hire_date
from (select rownum rn,
             o.employee_id,
             o.first_name,
             o.salary,
             o.hire_date
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date
            from employees
            order by hire_date
            ) o
      ) r
where rn >= 11
and rn <= 15;
