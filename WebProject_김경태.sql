--------------------------------------------------------
--  ������ ������ - ȭ����-3��-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_QNA_BOARD_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_QNA_BOARD_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FREE_BOARD_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_FREE_BOARD_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 25 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FILE_BOARD_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_FILE_BOARD_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBER" 
   (	"ID" VARCHAR2(10 BYTE), 
	"PASS" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"REGIDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FREEBOARD
--------------------------------------------------------

  CREATE TABLE "HR"."FREEBOARD" 
   (	"NO" NUMBER(10,0), 
	"ID" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENTS" VARCHAR2(2000 BYTE), 
	"POSTDATE" DATE DEFAULT sysdate, 
	"VISITCOUNT" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILEBOARD
--------------------------------------------------------

  CREATE TABLE "HR"."FILEBOARD" 
   (	"FILENO" NUMBER(10,0), 
	"ID" VARCHAR2(20 BYTE), 
	"FILETITLE" VARCHAR2(200 BYTE), 
	"FILECONTENTS" VARCHAR2(2000 BYTE), 
	"FILEPOSTDATE" DATE DEFAULT sysdate, 
	"FILEVISITCOUNT" NUMBER(10,0) DEFAULT 0, 
	"OFILE" VARCHAR2(200 BYTE), 
	"SFILE" VARCHAR2(30 BYTE), 
	"DOWNCOUNT" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QNABOARD
--------------------------------------------------------

  CREATE TABLE "HR"."QNABOARD" 
   (	"QNANO" NUMBER(10,0), 
	"ID" VARCHAR2(20 BYTE), 
	"QNATITLE" VARCHAR2(200 BYTE), 
	"QNACONTENTS" VARCHAR2(2000 BYTE), 
	"QNAPOSTDATE" DATE DEFAULT sysdate, 
	"QNAVISITCOUNT" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View EMP_ST_MAN_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."EMP_ST_MAN_VIEW" ("E_ID", "NAME", "EMAIL", "M_ID") AS 
  select 
        employee_id, first_name||' '||last_name, email, manager_id
    from employees where job_id='ST_MAN'
;
--------------------------------------------------------
--  DDL for View VIEW_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."VIEW_EMPLOYEES" ("ID", "FNAME", "JOBID", "HDATE", "DEPTID") AS 
  select
        employee_id, first_name, job_id, hire_date, department_id
    from employees where job_id='ST_CLERK'
;
--------------------------------------------------------
--  DDL for View V_EMP_JOIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."V_EMP_JOIN" ("EMPID", "FULLNAME", "DEPTID", "DEPTNAME", "HDATE", "LOCNAME") AS 
  select
        employee_id, first_name||' '||last_name, 
        department_id, department_name,
        to_char(hire_date, 'yyyy"��"mm"��"dd"��"'),
        state_province||'���� '||city
    from employees
        inner join departments using(department_id)
        inner join locations using(location_id)
;
--------------------------------------------------------
--  DDL for View V_EMP_SALARY
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "HR"."V_EMP_SALARY" ("EMP_ID", "L_NAME", "ANNUAL_SAL") AS 
  select employee_id, last_name, trim(to_char(((salary+(salary*nvl(commission_pct, 0)))*12), '990,000'))
    from employees
;
REM INSERTING into HR.MEMBER
SET DEFINE OFF;
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test2','12341','12341','123123@123.com',to_date('24/03/12','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test10','1234','�ӽ�Ʈ','test@test.com',to_date('24/03/12','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test4','1234','�����','ekzmfldj1@gmail.com',to_date('24/03/19','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test','1234','11�غ�11','test11tae@test.com',to_date('24/03/12','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test1','1234','test1','test1@test1.net',to_date('24/03/12','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('asdf','asdf','asdf','asdf@asdf.adf',to_date('24/03/13','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test0','1234','������Ʈ','123123@123.com',to_date('24/03/14','RR/MM/DD'));
Insert into HR.MEMBER (ID,PASS,NAME,EMAIL,REGIDATE) values ('test3','1234','ļ��','123123@123.com',to_date('24/03/14','RR/MM/DD'));
REM INSERTING into HR.FREEBOARD
SET DEFINE OFF;
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (19,'test','�����Խ��� ���� �Ϸ�.(������)','����������������
��������������������',to_date('24/03/13','RR/MM/DD'),59);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (24,'test2','240317 free(edit)','240317 free
240317 free 240317 free
240317 free',to_date('24/03/17','RR/MM/DD'),3);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (1,'test','test�Դϴ�','����������',to_date('24/03/12','RR/MM/DD'),3);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (2,'test','test1�Դϴ�','����������',to_date('24/03/12','RR/MM/DD'),0);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (3,'test1','����1�Դϴ�','������������',to_date('24/03/12','RR/MM/DD'),1);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (4,'test1','����2�Դϴ�','������������',to_date('24/03/12','RR/MM/DD'),4);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (22,'test3','2024-03-14-2','333333333333
3
3
3
',to_date('24/03/14','RR/MM/DD'),21);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (15,'test','�����Խ���1��11','�����Խ��������Խ��� �����Խ���111
�����Խ���1
�����Խ���1',to_date('24/03/13','RR/MM/DD'),51);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (16,'test','�����Խ���2��°','�����Խ���2��°zzzzzzzzzzzzz',to_date('24/03/13','RR/MM/DD'),13);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (21,'test','2024-03-14-1','zzzzzzzzzzzzzz',to_date('24/03/14','RR/MM/DD'),27);
Insert into HR.FREEBOARD (NO,ID,TITLE,CONTENTS,POSTDATE,VISITCOUNT) values (14,'test1','����0�Դϴ�','������������',to_date('24/03/13','RR/MM/DD'),58);
REM INSERTING into HR.FILEBOARD
SET DEFINE OFF;
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (6,'test','file3','careers_visual.',to_date('24/03/14','RR/MM/DD'),2,'careers_visual.jpg','20240314_12594723.jpg',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (7,'test','file4','���� ��',to_date('24/03/14','RR/MM/DD'),1,'thumb-4973c6cb7de37644994d68648e5a1a67_1682319956_73_360x278.jpg','20240314_1304110.jpg',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (8,'test','file5','�Ҿƹ��� ��',to_date('24/03/14','RR/MM/DD'),1,'main_mid_img_01_new.png','20240314_13019354.png',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (9,'test','file6','��',to_date('24/03/14','RR/MM/DD'),3,'jo.png','20240314_13046256.png',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (10,'test','����7','Ŵ',to_date('24/03/14','RR/MM/DD'),2,'kim.png','20240314_1313674.png',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (11,'test','����8','��',to_date('24/03/14','RR/MM/DD'),20,'yoon.png','20240314_131146.png',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (12,'test','������9','123
123',to_date('24/03/14','RR/MM/DD'),7,null,null,0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (19,'test','240319 1__','1234
������',to_date('24/03/19','RR/MM/DD'),2,'careers_visual.jpg','20240319_93017770.jpg',2);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (2,'test','�ڷ���2','blog_icon',to_date('24/03/14','RR/MM/DD'),2,null,null,0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (18,'test0','test11(����)','����_�̵�_���
����',to_date('24/03/17','RR/MM/DD'),3,'winner_logo.jpg','20240317_750382.jpg',1);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (14,'test','�����1','����',to_date('24/03/14','RR/MM/DD'),8,'�迬�� - ����Ѵٴ� ���� ��.mp3','20240314_15283385.mp3',1);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (15,'test','����1','����',to_date('24/03/14','RR/MM/DD'),6,'��ī���� �� ȥ��.mp4','20240314_15314478.mp4',0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (16,'test','�ؽ�Ʈ1','123
123
123 123',to_date('24/03/14','RR/MM/DD'),53,'Tjoeun��ū.txt','20240314_154459245.txt',4);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (1,'test','�ڷ���1','blog-icon',to_date('24/03/14','RR/MM/DD'),3,null,null,0);
Insert into HR.FILEBOARD (FILENO,ID,FILETITLE,FILECONTENTS,FILEPOSTDATE,FILEVISITCOUNT,OFILE,SFILE,DOWNCOUNT) values (17,'test3','file10','�ؽ��ΰ�
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1

',to_date('24/03/14','RR/MM/DD'),19,'main_logo.png','20240314_16224372.png',1);
REM INSERTING into HR.QNABOARD
SET DEFINE OFF;
Insert into HR.QNABOARD (QNANO,ID,QNATITLE,QNACONTENTS,QNAPOSTDATE,QNAVISITCOUNT) values (1,'test','test�Դϴ�zzzz','����������zzzz',to_date('24/03/12','RR/MM/DD'),0);
Insert into HR.QNABOARD (QNANO,ID,QNATITLE,QNACONTENTS,QNAPOSTDATE,QNAVISITCOUNT) values (2,'test','test1�Դϴ�zzzz','����������zzzz',to_date('24/03/12','RR/MM/DD'),0);
Insert into HR.QNABOARD (QNANO,ID,QNATITLE,QNACONTENTS,QNAPOSTDATE,QNAVISITCOUNT) values (3,'test1','����1�Դϴ�zzzz','zzzz������������',to_date('24/03/12','RR/MM/DD'),1);
Insert into HR.QNABOARD (QNANO,ID,QNATITLE,QNACONTENTS,QNAPOSTDATE,QNAVISITCOUNT) values (4,'test1','����2�Դϴ�zzzz','zzz������������',to_date('24/03/12','RR/MM/DD'),1);
Insert into HR.QNABOARD (QNANO,ID,QNATITLE,QNACONTENTS,QNAPOSTDATE,QNAVISITCOUNT) values (5,'test','�����Խ���','�����Խ��������Խ���',to_date('24/03/13','RR/MM/DD'),13);
Insert into HR.QNABOARD (QNANO,ID,QNATITLE,QNACONTENTS,QNAPOSTDATE,QNAVISITCOUNT) values (6,'test','240314 qna1 (����)','11111111111111
2222222222222',to_date('24/03/14','RR/MM/DD'),15);
--------------------------------------------------------
--  DDL for Index SYS_C008455
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008455" ON "HR"."FILEBOARD" ("FILENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008430
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008430" ON "HR"."QNABOARD" ("QNANO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008424
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008424" ON "HR"."FREEBOARD" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008418
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008418" ON "HR"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008418
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008418" ON "HR"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008424
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008424" ON "HR"."FREEBOARD" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008455
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008455" ON "HR"."FILEBOARD" ("FILENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008430
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008430" ON "HR"."QNABOARD" ("QNANO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure PCD_EMP_SALARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."PCD_EMP_SALARY" 
is
    /* PL/SQL������ declare���� ������ ����������, ���ν��������� is���� �����Ѵ�.
    ���� ������ �ʿ���ٸ� ������ �� �ִ�. */
    --������̺��� �޿� �÷��� �����ϴ� ���������� ����
    v_salary employees.salary%type;
begin
    --100�� ����� �޿��� into�� ���� ������ �����Ѵ�.
    select salary into v_salary
    from employees
    where employee_id = 100;

    dbms_output.put_line('�����ȣ100�� �޿���:'||
        to_char(v_salary, '990,000')||'�Դϴ�');
end;

/
--------------------------------------------------------
--  DDL for Procedure PCD_IN_PARAM_SALARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."PCD_IN_PARAM_SALARY" 
    (param_name in employees.first_name%type)
is
    valSalary number(10);
begin
    select salary into valSalary
    from employees where first_name = param_name;

    dbms_output.put_line(param_name||'�� �޿��� '||valSalary||'�Դϴ�');
end;

/
--------------------------------------------------------
--  DDL for Procedure PCD_OUT_PARAM_SALARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."PCD_OUT_PARAM_SALARY" 
    (
        param_name in varchar2,
        param_salary out employees.salary%type
    )
is

begin
    select salary into param_salary
    from employees where first_name = param_name;
end;

/
--------------------------------------------------------
--  DDL for Procedure PCD_UPDATE_SALARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."PCD_UPDATE_SALARY" 
    (
        p_empid in number,
        p_salary in number,
        rCount out number
    )
is  /* �߰����� ���� ������ �ʿ�����Ƿ� �����Ѵ�. */
begin
    --���� ������Ʈ�� ó���ϴ� ���������� in�Ķ���͸� ���� ���� �����Ѵ�.
    update zcopy_employees
        set salary = p_salary
        where employee_id = p_empid;

    /*
    SQL%notfound : ���� ���� �� ����� ���� ���� ��� true�� ��ȯ�Ѵ�.
        found�� �ݴ��� ��츦 ��ȯ�Ѵ�.
    sql%rowcount : ���� ���� �� ���� ����� ���� ������ ��ȯ�Ѵ�.
    */
    if SQL%notfound then
        dbms_output.put_line(p_empid||'��(��) ���»���Դϴ�.');
        rCount := 0;
    else
        dbms_output.put_line(SQL%rowcount||'���� �ڷᰡ �����Ǿ����ϴ�.');

        --���� ����� ���� ������ out�Ķ���͸� ���� ��ȯ�Ѵ�.
        rCount := sql%rowcount;
    end if;

    /* ���� ��ȭ�� �ִ� ������ ������ ��� �ݵ�� commit�� �ؾ� ���� ���̺� ����Ǿ�
    Oracle �ܺο��� Ȯ���� �� �ִ�. */
    commit;
end;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  DDL for Function CALSUMBETWEEN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."CALSUMBETWEEN" (
    num1 in number,
    num2 number
)
return
    number
is
    sumNum number;
begin
    sumNum := 0;

    for i in num1 .. num2 loop
        sumNum := sumNum+i;
    end loop;

    return sumNum;
end;

/
--------------------------------------------------------
--  DDL for Function FINDGENDER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."FINDGENDER" (
    num1 varchar
)
/* ������ �Ǵ��� �� '����' Ȥ�� '����'�� ��ȯ�ϹǷ� ��ȯŸ���� ���������� �����Ѵ�. */
return
    varchar2
is
    --�ֹι�ȣ���� ������ �ش��ϴ� ���ڸ� �߶� ������ ����
    gender varchar2(100);
begin    
    gender := substr(num1,8,1);

    if gender = '1' then
        gender := '����';
    elsif gender = '3' then
        gender := '����';
    elsif gender = '2' then
        gender := '����';
    elsif gender = '4' then
        gender := '����';
    else
        gender := '�Է¿���';
    end if;

    --���ϰ��� ������ ����
    return gender;
end;

/
--------------------------------------------------------
--  DDL for Function FUNC_DEPTNAME
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "HR"."FUNC_DEPTNAME" (
    param_name varchar2
)
return
    varchar2
is
    return_deptname departments.department_name%type;
begin
    select department_name into return_deptname
    from employees inner join departments using(department_id)
    where first_name=param_name;

    return return_deptname;
end;

/
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("PASS" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FREEBOARD
--------------------------------------------------------

  ALTER TABLE "HR"."FREEBOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."FREEBOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "HR"."FREEBOARD" MODIFY ("CONTENTS" NOT NULL ENABLE);
  ALTER TABLE "HR"."FREEBOARD" MODIFY ("POSTDATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."FREEBOARD" MODIFY ("VISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "HR"."FREEBOARD" ADD PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FILEBOARD
--------------------------------------------------------

  ALTER TABLE "HR"."FILEBOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."FILEBOARD" MODIFY ("FILETITLE" NOT NULL ENABLE);
  ALTER TABLE "HR"."FILEBOARD" MODIFY ("FILECONTENTS" NOT NULL ENABLE);
  ALTER TABLE "HR"."FILEBOARD" MODIFY ("FILEPOSTDATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."FILEBOARD" MODIFY ("FILEVISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "HR"."FILEBOARD" MODIFY ("DOWNCOUNT" NOT NULL ENABLE);
  ALTER TABLE "HR"."FILEBOARD" ADD PRIMARY KEY ("FILENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QNABOARD
--------------------------------------------------------

  ALTER TABLE "HR"."QNABOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."QNABOARD" MODIFY ("QNATITLE" NOT NULL ENABLE);
  ALTER TABLE "HR"."QNABOARD" MODIFY ("QNACONTENTS" NOT NULL ENABLE);
  ALTER TABLE "HR"."QNABOARD" MODIFY ("QNAPOSTDATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."QNABOARD" MODIFY ("QNAVISITCOUNT" NOT NULL ENABLE);
  ALTER TABLE "HR"."QNABOARD" ADD PRIMARY KEY ("QNANO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FREEBOARD
--------------------------------------------------------

  ALTER TABLE "HR"."FREEBOARD" ADD CONSTRAINT "FREE_BOARD_MEM_FK" FOREIGN KEY ("ID")
	  REFERENCES "HR"."MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILEBOARD
--------------------------------------------------------

  ALTER TABLE "HR"."FILEBOARD" ADD CONSTRAINT "FILE_BOARD_MEM_FK" FOREIGN KEY ("ID")
	  REFERENCES "HR"."MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QNABOARD
--------------------------------------------------------

  ALTER TABLE "HR"."QNABOARD" ADD CONSTRAINT "QNA_BOARD_MEM_FK" FOREIGN KEY ("ID")
	  REFERENCES "HR"."MEMBER" ("ID") ENABLE;
