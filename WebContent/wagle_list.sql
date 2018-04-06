CREATE TABLE wagle_list (
  wboardid INT not null,
  wname VARCHAR2(100),
  whost VARCHAR2(50),
  wagler VARCHAR2(50),
  wmax INT,
  wprofile VARCHAR2(3000),
  wintro VARCHAR2(3000),
  wcategory VARCHAR2(100),
  wloc VARCHAR2(100),
  wstart VARCHAR2(100),
  wend VARCHAR2(100),
  filename VARCHAR2(30),
  filesize INT );

CREATE SEQUENCE wagle_wagleser
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;

DROP SEQUENCE wagle_wagleser;

TRUNCATE TABLE wagle_list;
DROP TABLE wagle_list;
SELECT * FROM wagle_list;

COMMIT;