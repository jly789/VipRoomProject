drop table review;
drop table notice;
drop table orders;
drop table reservation;
drop table roomImg;
drop table room;
drop table accommodationImg;
drop table accommodation;
drop table member;




CREATE TABLE member ( -- 회원 테이블
                        memberId INT NOT NULL AUTO_INCREMENT, -- 회원번호
                        role VARCHAR(15) default '회원', -- 역할 EX)회원,관리자
                        userId VARCHAR(50) NOT NULL, -- 사용자아이디
                        pwd VARCHAR(100) NOT NULL, --  비밀번호
                        userName VARCHAR(50) NOT NULL, -- 사용자이름
                        nickName VARCHAR(50) NOT NULL, -- 사용자닉네임
                        tel VARCHAR(50) NOT NULL, -- 전화번호
                        postcode VARCHAR(50) NOT NULL, -- 우편번호
                        address VARCHAR(100) NOT NULL, -- 주소
                        detailAddress VARCHAR(100) NOT NULL, -- 상세주소
                        extraAddress VARCHAR(100) NULL, -- 참고주소
                        email VARCHAR(50) NOT NULL, -- 이메일
                        birth DATE NOT NULL, -- 생일

                        CONSTRAINT PK_MEMBER PRIMARY KEY (memberId)
);




CREATE TABLE accommodation ( -- 숙소 테이블
                               accommodationId INT NOT NULL AUTO_INCREMENT, -- 숙소번호
                               accommodationName VARCHAR(30) NOT NULL,   -- 숙소이름
                               accommodationDistrict VARCHAR(30) NOT NULL,  -- 숙소지역구 ex)서울특별시,경기도,경상남도
                               accommodationCity VARCHAR(20) NOT NULL, -- 숙소 시 ex) ex)강남구/삼성구/용인시/성남시
                               accommodationAddress VARCHAR(100) NOT NULL, -- 숙소주소
                               accommodationCategory VARCHAR(30) NOT NULL,  -- 숙소유형: 모텔 호텔.리조트 펜션 게스트하우스 캠핑
                               accommodationInformation VARCHAR(100) NOT NULL, -- 숙소 정보
                               accommodationCreateDate datetime NOT NULL default current_timestamp, -- 숙소 등록일

                               CONSTRAINT PK_ACCOMMODATION PRIMARY KEY (accommodationId)

);



CREATE TABLE accommodationImg ( -- 숙소 이미지 테이플
                                  accommodationImgId INT NOT NULL AUTO_INCREMENT,  -- 숙소 이미지번호
                                  accommodationId INT NOT NULL, -- (외래키)숙소번호
                                  accommodationImage     VARCHAR(300) NOT NULL,  -- 숙소 이미지
                                  accommodationImagePath VARCHAR(300) NOT NULL, -- 숙소 이미지경로

                                  CONSTRAINT PK_ACCOMMODATION PRIMARY KEY (accommodationImgId),
                                  CONSTRAINT FK_ACCOMMODATIONIMG_ACCOMMODATIONID FOREIGN KEY(accommodationId) REFERENCES accommodation (accommodationId)

);





CREATE TABLE room ( -- 객실테이블
                      roomId INT NOT NULL AUTO_INCREMENT, -- 객실번호
                      accommodationId INT NOT NULL,  -- (외래키)숙소번호
                      roomPrice INT NOT NULL, -- 객실 1박당 가격
                      maximumCapacity INT NOT NULL,   -- 최대 숙박인원
                      roomNumbersy  INT NOT NULL,   -- 객실 수
                      roomName VARCHAR(30) NOT NULL,  -- 객실이름
                      roomDescription VARCHAR(300) NOT NULL, -- 객실소개


                      CONSTRAINT PK_ROOM PRIMARY KEY (roomId),
                      CONSTRAINT FK_ROOM_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId)
);

CREATE TABLE roomImg ( -- 객실 이미지 테이플
                         roomImgId INT NOT NULL  AUTO_INCREMENT,  -- 숙소 이미지번호
                         roomId  INT NOT NULL,  -- (외래키)숙소번호
                         roomImage  VARCHAR(300) NOT NULL,  -- 객실 이미지
                         roomImagePath VARCHAR(300) NOT NULL, -- 객실 이미지경로

                         CONSTRAINT PK_ROOMIMG PRIMARY KEY (roomImgId),
                         CONSTRAINT FK_ROOMIMG_ROOMID FOREIGN KEY (roomId) REFERENCES room (roomId)

);


CREATE TABLE reservation ( -- 예약테이블
                             reservationId INT NOT NULL  AUTO_INCREMENT, -- 예약번호
                             memberId INT NOT NULL, -- (외래키)회원번호
                             accommodationId INT NOT NULL, -- (외래키)숙소번호
                             roomId INT NOT NULL, -- (외래키)객실번호
                             reservationHeadCount INT NOT NULL,  -- 예약인원수
                             reservationStatus VARCHAR(30) default '예약가능',  -- 객실상태 ex)예약가능, 예약불가,
                             reservationDetails VARCHAR(300) NULL, -- 예약내용,
                             reservationCheckIn DATE NOT NULL, -- 체크인
                             reservationCheckOut DATE NOT NULL, -- 체크아웃

                             CONSTRAINT PK_RESERVATION PRIMARY KEY (reservationId),
                             CONSTRAINT FK_RESERVATION_MEMBERID FOREIGN KEY (memberId) REFERENCES member (memberId),
                             CONSTRAINT FK_RESERVATION_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId),
                             CONSTRAINT FK_RESERVATION_ROOMID FOREIGN KEY (roomId) REFERENCES room (roomId)
);




CREATE TABLE orders -- 주문
(
    orderId     INT NOT NULL AUTO_INCREMENT, -- 주문번호
    reservationId    INT  NOT NULL, -- (외래키)예약번호
    orderPrice  INT NOT NULL, -- 주문가격
    orderNum    VARCHAR(200) NOT NULL,
    impUid      VARCHAR(200) NULL,
    orderStatus VARCHAR(30) NOT NULL, -- 주문상태 ex)결제완료
    orderDate   datetime NOT NULL default current_timestamp , -- 주문날짜

    CONSTRAINT PK_ORDERS PRIMARY KEY (orderId),
    CONSTRAINT FK_ORDERS_RESERVATIONID FOREIGN KEY (reservationId) REFERENCES reservation (reservationId)

);

CREATE TABLE notice
(
    noticeId      INT NOT NULL  AUTO_INCREMENT,
    memberId      INT NOT NULL         NOT NULL,
    noticeViews   INT NOT NULL DEFAULT 0,
    noticeSubject VARCHAR(300)  NOT NULL,
    noticeContent VARCHAR(4000) NOT NULL,
    noticeType    VARCHAR(50)   NOT NULL, -- 중요,공지,긴급
    noticeDate    datetime NOT NULL default current_timestamp,

    CONSTRAINT PK_NOTICE PRIMARY KEY (noticeId),
    CONSTRAINT FK_NOTICE_MEMBERID FOREIGN KEY (memberId) REFERENCES member (memberId)
);



CREATE TABLE review
(
    reviewId    INT NOT NULL AUTO_INCREMENT,   -- 리뷰번호
    memberId      INT NOT NULL, -- (외래키)회원번호
    accommodationId  INT NOT NULL,  -- (외래키)숙소번호
    reservationId INT NOT NULL, -- (외래키)예약번호
    views  INT NOT NULL default 0 , -- 리뷰수
    reviewSubject  VARCHAR(255)      NOT NULL,  -- 리뷰제목
    reviewContent  VARCHAR(4000)     NOT NULL,  -- 리뷰내용
    reviewFileName VARCHAR(255)  NULL, -- 리뷰이미지
    reviewFilePath VARCHAR(255)  NULL, -- 리뷰이미지경로
    grade  VARCHAR(255) NOT NULL, -- 리뷰평점
    reviewState VARCHAR(50) DEFAULT '리뷰완료' not null, -- 리뷰상태
    reviewDate datetime NOT NULL default current_timestamp , -- 리뷰등록날짜
    CONSTRAINT PK_REVIEW PRIMARY KEY (reviewId),
    CONSTRAINT FK_REVIEW_MEMBERID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_REVIEW_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId),
    CONSTRAINT FK_REVIEW_RESERVATIONID FOREIGN KEY (reservationId) REFERENCES reservation (reservationId)
);


INSERT into member
VALUES(1,'회원','asd','asd','윤재일','비운의소나기','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','참고사항','jly789@naver.com','1995-04-01');

INSERT into member
VALUES(2,'회원','jly789','a123','김민정','민정이','01012345678','13112','경기도 성남시 수진동','수앤수캐슬','','jly456@naver.com','1999-05-01');

INSERT into accommodation
VALUES(1,'야놀자','경기도','성남시','경기도 성남시 태평동 7210','모텔','없음',sysdate());


commit;

select * from member;
select * from accommodation;
select * from accommodationImg;
select * from room;
select * from roomImg;
select * from reservation;
select * from orders;
select * from notice;
select * from review;






select userId from member
where userName ='윤재일' and email='jly789@naver.com';



select count(*) from member
where userId ='a123' and pwd ='a123';

-- delete from member
-- where userId ='a123' and pwd ='a123';














--  오라클 문법
-- select nvl(max(memberId),0) from member;

--   select nvl(count(*),0) from member;
-- select max(memberId),0 from member;

--   -- mysql문법
--   select ifnull(max(memberId),1) as memberId from member;
--   select count(*),0 from member;


-- accommodation