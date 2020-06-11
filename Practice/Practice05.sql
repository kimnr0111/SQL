--巩力 1.
select first_name,
       manager_id,
       commission_pct,
       salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

--巩力 2.
select employee_id,
       first_name,
       salary,
       to_char(hire_date, 'YYYY-MM-DD DAY') hire_date,
       replace(phone_number, '.', '-') phone_number,
       department_id
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id
                                  )
order by salary desc;

--巩力 3.
select m.manager_id,
       e.first_name,
       m.avgs,
       m.mins,
       m.maxs
from employees e, (select manager_id,
                          round(avg(salary), 1) avgs,
                          min(salary) mins,
                          max(salary) maxs
                   from employees
                   where hire_date >= '2005/01/01'
                   group by manager_id
                   having avg(salary) >= 5000
                   ) m
where e.employee_id = m.manager_id;

--巩力 4.
select e.employee_id,
       e.first_name,
       d.department_name,
       m.first_name manager
from employees e, employees m, departments d
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id;

--巩力 5.
select rn,
       employee_id,
       first_name,
       department_name,
       salary,
       hire_date
from (select rownum rn,
             employee_id,
             first_name,
             department_name,
             salary,
             hire_date
      from (select employee_id,
                   first_name,
                   department_name,
                   salary,
                   hire_date
            from employees e, departments d
            where e.department_id = d.department_id(+)
            and hire_date >= '2005/01/01'
            order by hire_date
            )
      )
where rn >= 11
and rn <= 20;

--巩力 6.
select first_name || ' ' || last_name name,
       salary,
       department_name,
       hire_date
from employees e, departments d
where e.department_id = d.department_id
and hire_date = (select max(hire_date)
                 from employees);

--巩力 7.
select employee_id,
       first_name,
       last_name,
       job_title,
       salary
from employees e, jobs j
where e.job_id = j.job_id
and e.department_id = (select department_id
                       from employees
                       group by department_id
                       having avg(salary) = (select max(avg(salary))
                                             from employees
                                             group by department_id
                                             )
                      );

--巩力 8.
select department_name
from departments
where department_id = (select department_id
                        from employees
                        group by department_id
                        having avg(salary) = (select max(avg(salary))
                                              from employees
                                              group by department_id
                                              )
                       );

--巩力 9.

select l.country_id,
       avg(avgs) avgs
from locations l ,(select d.location_id,
                          avg(avgs) avgs       
                   from departments d, (select round(avg(salary), 0) avgs,
                                               department_id
                                        from employees
                                        group by department_id) e
                   where d.department_id = e.department_id
                   group by d.location_id
                   ) d
where l.location_id = d.location_id
group by l.country_id;

select region_name
from regions r, countries c, locations l, departments d, employees e
where c.region_id = r.region_id
and l.country_id = c.country_id
and d.location_id = l.location_id
and e.department_id = d.department_id
group by region_name
having avg(salary) = (select max(avg(salary)) avgs
                      from regions r, countries c, locations l, departments d, employees e
                      where c.region_id = r.region_id
                      and l.country_id = c.country_id
                      and d.location_id = l.location_id
                      and e.department_id = d.department_id
                      group by region_name);


--巩力 10.
select job_title
from jobs j, (select job_id ,
                     avg(salary) avgs
              from employees
              group by job_id
              ) e
where j.job_id = e.job_id
and e.avgs = (select max(avg(salary)) maxs
              from employees
              group by job_id
              );