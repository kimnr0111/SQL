--Den���� �޿��� ���� �޴� ����� �̸��� �޿���?
select employee_id,
       salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den')
order by salary asc;

--�޿��� ���� ���Թ޴� ����� �̸�, �޿�, �����ȣ
select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--��պ��� ���� �޿��� �޴� ������ �̸��� �޿�
select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees);
                
--�μ���ȣ�� 110�� ������ �޿��� ���� ��� ������ ���, �̸�, �޿��� ����ϼ���
select employee_id,
       first_name,
       salary
from employees
where salary in (select salary
                from employees
                where department_id = 110);
       
--�� �μ����� �ְ�޿��� �޴� ����� ����ϼ���
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

--�μ���ȣ�� 110�� ������ �޿� ���� ū ��� ������ ���, �̸�, �޿��� ����ϼ���
--(or����-->8300���� ū)
select employee_id, first_name, salary
from employees
where salary >any (select salary
                   from employees
                   where department_id = 110); --12008, 8300
                   
--�μ���ȣ�� 110�� ������ �޿� ���� ū ��� ������ ���, �̸�, �޿��� ����ϼ���
--(and����-->12008���� ū)
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

--���ĸ���
select rownum,
       employee_id,
       first_name,
       salary
from (select employee_id,
             first_name,
             salary
      from employees
      order by salary desc);
      
--where �� ���(����)
select rownum,
       employee_id,
       first_name,
       salary
from (select employee_id,
             first_name,
             salary
      from employees
      order by salary desc)
where rownum >=  5; --�ӽ� ����� �����Ǳ� ���� where ���� ����
                    --rownum ���� �׻� 1�� �ȴ�.
                    --rownum ���� ������ �Ŀ� where ���� �����ؾ��Ѵ�.
                    
--where �� ���(�������)
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

--07�⿡ �Ի��� ������ �޿��� ���� ������ 3���� 7���� �̸� �޿� �Ի����� ���
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
