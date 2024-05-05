
drop table member;

CREATE TABLE member (
                        memberId int NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        role VARCHAR(15) default '회원',
                        userId VARCHAR(50) NOT NULL,
                        pwd VARCHAR(100) NOT NULL,
                        userName VARCHAR(50) NOT NULL,
                        nickName VARCHAR(50) NOT NULL,
                        birth DATE NOT NULL,
                        tel VARCHAR(50) NOT NULL,
                        postcode VARCHAR(50) NOT NULL,
                        address VARCHAR(100) NOT NULL,
                        detailAddress VARCHAR(100) NOT NULL,
                        extraAddress VARCHAR(100) NULL,
                        email VARCHAR(50) NOT NULL


);



select userId from member
where userName ='윤재일' and email='jly789@naver.com';



-- CREATE TABLE grade (
--     num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     student_id CHAR(8) NOT NULL,
--     subject_name VARCHAR(10) NOT NULL,
--     score INT NOT NULL,
--     FOREIGN KEY(student_id) REFERENCES student(student_id)
-- );

select * from member;


INSERT into member
VALUES(1,'회원','asd','asd','윤재일','재일이다','1995-04-01','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','','jly789@naver.com');


commit;

select * from member;

select count(*) from member
where userId ='' and pwd ='';




select pwd from member
where userId ='asd' and email='jly789@naver.com';










--  오라클 문법
-- select nvl(max(memberId),0) from member;

--   select nvl(count(*),0) from member;
-- select max(memberId),0 from member;

-- mysql문법
select ifnull(max(memberId),1) as memberId from member;
select count(*),0 from member;


