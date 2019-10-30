--------------------------------------------------------
--  File created - úroda-paüdziernika-30-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package EMPLOYEES_P
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."EMPLOYEES_P" 
as 
procedure i_emp (i_date date);

type t is record (x hr.employees.first_name%type);

type tt is table of t;

function ret_emp return tt pipelined;

end;

/
