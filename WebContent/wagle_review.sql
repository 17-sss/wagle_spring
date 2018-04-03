create table reviewboard(
    num INT NOT NULL PRIMARY KEY,
    boardid varchar(1) default '1',
    writer varchar(30) not null,
    content varchar(3000) not null
);

CREATE SEQUENCE wagle_reviewser
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;
  
select * from reviewboard;