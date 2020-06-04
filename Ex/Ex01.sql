select * from employees;

select * from departments;

select employee_id, first_name, last_name from employees;

select employee_id "empNO", first_name "E-name", salary "연 봉" from employees;

select employee_id "empNO", 
       first_name "E-name", 
       salary "연 봉"
from employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' ''hire date is'' ' || hire_date
from employees;

select first_name "이름", salary "월급", salary*12 "연봉"
from employees;

select job_id
from employees;

select first_name || '-' || last_name "성명",
       salary "급여",
       salary*12 "연봉",
       salary*12+5000 "연봉2",
       phone_number "전화번호"
from employees;

select first_name
from employees
where department_id = 10;

select *
from employees
where department_id = 10;

select first_name || ' ' || last_name "이 름", salary "연 봉"
from employees
where salary >= 15000;

select first_name || ' ' || last_name "이 름", salary "연 봉", hire_date
from employees
where hire_date >= '07/01/01';

select first_name || ' ' || last_name "이 름", salary "연 봉"
from employees
where 17000 <= salary or 14000 >= salary;

select first_name || ' ' || last_name "이 름", hire_date "입사일"
from employees
where '05/12/31' >= hire_date and hire_date >= '04/01/01';

select first_name || ' ' || last_name "이 름", salary "연 봉"
from employees
where salary between 14000 and 17000;

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name || ' ' || last_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name || ' ' || last_name, salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

select first_name, last_name, salary
from employees
where first_name like 'L%';

select first_name, salary
from employees
where first_name like '%am%';

select first_name, salary
from employees
where first_name like '_a%';

select first_name
from employees
where first_name like '___a%';

select first_name
from employees
where first_name like '____'
and first_name like '_a%';

select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name, salary, commission_pct
from employees
where commission_pct is null;

select first_name, salary, commission_pct
from employees
where commission_pct is not null;

select first_name
from employees
where manager_id is null
and commission_pct is null;

select first_name, salary
from employees
where salary >= 5000
order by salary desc;

select department_id, salary ,first_name
from employees
order by department_id asc;

select first_name, salary
from employees
where salary >= 1000
order by salary desc;

select department_id, salary, first_name
from employees
order by department_id asc, salary desc;