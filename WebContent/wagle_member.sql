----- SELECT -----
SELECT * FROM WAGLE_member;
----- CREATE -----
CREATE TABLE wagle_member (
  num INT NOT NULL PRIMARY KEY,
  email VARCHAR2(50) NOT NULL,
  pwd VARCHAR2(50) NOT NULL,
  name VARCHAR2(50) NOT NULL,
  gender VARCHAR2(20) NOT NULL,
  age VARCHAR2(20),
  loc VARCHAR2(50),
  regdate DATE NOT NULL
);

CREATE SEQUENCE wagle_memberser
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;

COMMIT;

----- DROP -----
DROP TABLE wagle_member;
DROP SEQUENCE wagle_memberser;

COMMIT;

SELECT WAGLE_memberSER.nextval from dual

insert into wagle_member(num, email, pwd, name, gender, age, loc, regdate)
			values(WAGLE_memberSER.nextval,'admin','1234','admin','????', '????', '????', sysdate);
            
delete from wagle_member where email='admin';