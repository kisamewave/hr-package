--------------------------------------------------------
--  File created - œroda-paŸdziernika-30-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body EMPLOYEES_P
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."EMPLOYEES_P" 
as 
procedure i_emp (i_date date)
as 
begin
for x in (select first_name,last_name,hire_date from hr.employees where hire_date >= i_date)
loop
insert into z_emp
values (x.first_name,x.last_name,x.hire_date);
end loop;
end;

function ret_emp return tt pipelined is pragma autonomous_transaction;
c_r sys_refcursor;
t_record t;
begin

execute immediate 'truncate table z_emp';

i_emp(to_date('1999-10-10','yyyy-MM-dd'));
---
commit;
---
open c_r for select first_name from z_emp;
loop
fetch c_r into t_record;
exit when c_r%notfound;
pipe row (t_record);
end loop;
return;
end;
end;

/
