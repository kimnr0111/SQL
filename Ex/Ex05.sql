--Den보다 급여를 많이 받는 사람의 이름과 급여는?
select employee_id,
       salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den')
order by salary asc;

--급여를 가장 적게받는 사람의 이름, 급여, 사원번호
select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--평균보다 적은 급여를 받는 직원의 이름과 급여
select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees);
                
--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
select employee_id,
       first_name,
       salary
from employees
where salary in (select salary
                from employees
                where department_id = 110);
       
--각 부서별로 최고급여를 받는 사원을 출력하세요
select first_name,
       department_id,
       salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id);
                                  
select e.first_name,
       e.department_id,
       e.salary
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary = s.salary;

--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요
--(or연산-->8300보다 큰)
select employee_id, first_name, salary
from employees
where salary >any (select salary
                   from employees
                   where department_id = 110); --12008, 8300
                   
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요
--(and연산-->12008보다 큰)
select employee_id,
       first_name,
       salary
from employees
where salary >ALL (select salary
                   from employees
                   where department_id = 110);
                   
--rowrum
select rownum,
       employee_id,
       first_name,
       salary
from employees
order by salary desc;

--정렬먼저
select rownum,
       employee_id,
       first_name,
       salary
from (select employee_id,
             first_name,
             salary
      from employees
      order by salary desc);
      
--where 절 사용(오류)
select rownum,
       employee_id,
       first_name,
       salary
from (select employee_id,
             first_name,
             salary
      from employees
      order by salary desc)
where rownum >=  5; --임시 결과가 생성되기 전에 where 절이 실행
                    --rownum 값이 항상 1이 된다.
                    --rownum 값을 생성한 후에 where 절을 실행해야한다.
                    
--where 절 사용(정상실행)
select rn,
       w.employee_id,
       w.first_name,
       w.salary
from (select rownum rn,
             e.employee_id,
             e.first_name,
             e.salary
      from (select employee_id,
                   first_name,
                   salary
            from employees
            order by salary desc
            ) e
      ) w
where rn >= 5;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일을 출력
select rn,
       r.first_name,
       r.salary,
       r.hire_date
from (select rownum rn,
       s.first_name,
       s.salary,
       s.hire_date
      from (select first_name,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc
            ) s
     ) r
where rn >= 3
and rn <= 7;
