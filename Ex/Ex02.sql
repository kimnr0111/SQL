/*������ �Լ�*/

/*���� �Լ�*/

--initcap(emali)
select email, initcap(email), department_id
from employees
where department_id = 100;

select email,
       initcap('aaaaaa')
from employees;

--�ԷµǴ� ���ڸ� �ҹ���(lower)/�빮��(upper)�� ���
select lower('aAaAaAaAaA'), upper('aAaAaAaAaA')
from dual;

select first_name, lower(first_name), upper(last_name)
from employees
where department_id = 100;

--substr(�÷���, ������ġ, ���ڼ�) �־��� ���ڿ����� Ư�������� ���ڿ��� ���ϴ� �Լ�
select substr('abcdefg', 3, 2)
from dual;

select first_name,
       substr(first_name, 1, 3),
       substr(first_name, -3, 2),
       substr(first_name, 3, 2)
from employees
where department_id = 100;

--���� ���鿡 Ư���� ���� ä���(lpad)/������ ���鿡 Ư���� ���� ä���(rpad)
select first_name,
lpad(first_name, 10, '*'),
rpad(first_name, 10, '*')
from employees;

--replace(�÷���, ����1, ����2)�÷����� ����1�� ����2�� �ٲٴ� �Լ�
select first_name,
       replace(first_name, 'a', '*')
from employees
where department_id = 100;

select first_name,
       replace(first_name, 'a', '*'),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

--��������
select ltrim('      aaaa      ') || '------',
       rtrim('      aaaa      ') || '------'
from dual;


--round(����, ����� ���ϴ� �ڸ���) �־��� ���ڸ� �ݿø��ϴ� �Լ�
select round(123.456, 2) "r2",
       round(123.456, 0) "r0",
       round(123.456, -1) "r-1"
from dual;

--trunc(����, ����� ���ϴ� �ڸ���)
select trunc(123.456, 2) "r2",
       trunc(123.456, 0) "r0",
       round(123.456, -1) "r-1"
from dual;

--sysdate ���糯¥�� �ð��� ������ִ� �Լ�
select sysdate
from dual;

select sysdate
from employees;

--month_between(d1, d2) d1��¥�� d2��¥�� �������� ����ϴ� �Լ�
select months_between(sysdate, hire_date)
from employees
where department_id = 110;

--to_char(����, '��¸��')
select first_name, to_char(salary*12, '$999,999.99') "SAL"
from employees
where department_id = 110;

select to_char('9876', '99999'),
       to_char('9876', '099999'),
       to_char('9876', '$9999'),
       to_char('9876', '9999.99'),
       to_char('9876', '99,999'),
       to_char('9876', '999')
from dual;

--to_char(��¥, '��¸��')
select sysdate,
       to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
from dual;

select commission_pct, nvl(commission_pct, 0), nvl2(commission_pct, 100, 0)
from employees;