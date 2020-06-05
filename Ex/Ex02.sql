/*단일형 함수*/

/*문자 함수*/

--initcap(emali)
select email, initcap(email), department_id
from employees
where department_id = 100;

select email,
       initcap('aaaaaa')
from employees;

--입력되는 글자를 소문자(lower)/대문자(upper)로 출력
select lower('aAaAaAaAaA'), upper('aAaAaAaAaA')
from dual;

select first_name, lower(first_name), upper(last_name)
from employees
where department_id = 100;

--substr(컬럼명, 시작위치, 글자수) 주어진 문자열에서 특정길이의 문자열을 구하는 함수
select substr('abcdefg', 3, 2)
from dual;

select first_name,
       substr(first_name, 1, 3),
       substr(first_name, -3, 2),
       substr(first_name, 3, 2)
from employees
where department_id = 100;

--왼쪽 공백에 특별한 문자 채우기(lpad)/오른쪽 공백에 특별한 문자 채우기(rpad)
select first_name,
lpad(first_name, 10, '*'),
rpad(first_name, 10, '*')
from employees;

--replace(컬럼명, 문자1, 문자2)컬럼명에서 문자1을 문자2로 바꾸는 함수
select first_name,
       replace(first_name, 'a', '*')
from employees
where department_id = 100;

select first_name,
       replace(first_name, 'a', '*'),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;

--공백제거
select ltrim('      aaaa      ') || '------',
       rtrim('      aaaa      ') || '------'
from dual;


--round(숫자, 출력을 원하는 자리수) 주어진 숫자를 반올림하는 함수
select round(123.456, 2) "r2",
       round(123.456, 0) "r0",
       round(123.456, -1) "r-1"
from dual;

--trunc(숫자, 출력을 원하는 자리수)
select trunc(123.456, 2) "r2",
       trunc(123.456, 0) "r0",
       round(123.456, -1) "r-1"
from dual;

--sysdate 현재날짜와 시간을 출력해주는 함수
select sysdate
from dual;

select sysdate
from employees;

--month_between(d1, d2) d1날짜와 d2날짜의 개월수를 출력하는 함수
select months_between(sysdate, hire_date)
from employees
where department_id = 110;

--to_char(숫자, '출력모양')
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

--to_char(날짜, '출력모양')
select sysdate,
       to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
from dual;

select commission_pct, nvl(commission_pct, 0), nvl2(commission_pct, 100, 0)
from employees;