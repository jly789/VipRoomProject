drop table review;
drop table notice;
drop table orders;
drop table reservation;
drop table roomImg;
drop table room;
drop table accommodationImg;
drop table accommodation;
drop table city;
drop table district;
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


CREATE TABLE district ( -- 회원 테이블
                          districtId  INT NOT NULL AUTO_INCREMENT, -- 지역구번호

                          districtName  VARCHAR(50) NOT NULL, -- 지역구이름


                          CONSTRAINT PK_DISTRICT PRIMARY KEY (districtId)
);


CREATE TABLE city ( -- 숙소 이미지 테이플
                      cityId INT NOT NULL AUTO_INCREMENT,  -- 도시번호
                      districtId INT NOT NULL, -- (외래키)지역구번호
                      cityName VARCHAR(300) NOT NULL, -- 도시이름

                      CONSTRAINT PK_CITY PRIMARY KEY (cityId),
                      CONSTRAINT FK_CITY_DISTRICTID FOREIGN KEY(districtId) REFERENCES district (districtId)

);







CREATE TABLE accommodation ( -- 숙소 테이블
                               accommodationId INT NOT NULL AUTO_INCREMENT, -- 숙소번호
                               accommodationName VARCHAR(30) NOT NULL,   -- 숙소이름
                               accommodationDistrict VARCHAR(30) NOT NULL,  -- 숙소지역구 ex)서울특별시,경기도,경상남도
                               accommodationCity VARCHAR(20) NOT NULL, -- 숙소 시 ex) ex)강남구/삼성구/용인시/성남시
                               accommodationAddress VARCHAR(100) NOT NULL, -- 숙소주소
                               accommodationCategory VARCHAR(30) NOT NULL,  -- 숙소유형: 모텔 호텔.리조트 펜션 게스트하우스 캠핑
                               accommodationInformation VARCHAR(5000) NOT NULL, -- 숙소 정보
                               accommodationCreateDate datetime NOT NULL default current_timestamp, -- 숙소 등록일

                               CONSTRAINT PK_ACCOMMODATION PRIMARY KEY (accommodationId)

);



CREATE TABLE accommodationImg ( -- 숙소 이미지 테이플
                                  accommodationImgId INT NOT NULL AUTO_INCREMENT,  -- 숙소 이미지번호
                                  accommodationId INT NOT NULL, -- (외래키)숙소번호
                                  accommodationImage     VARCHAR(300) NULL,  -- 숙소 이미지
                                  accommodationImagePath VARCHAR(300)  NULL, -- 숙소 이미지경로

                                  CONSTRAINT PK_ACCOMMODATIONIMG PRIMARY KEY (accommodationImgId),
                                  CONSTRAINT FK_ACCOMMODATIONIMG_ACCOMMODATIONID FOREIGN KEY(accommodationId) REFERENCES accommodation (accommodationId)

);



CREATE TABLE room ( -- 객실테이블
                      roomId INT NOT NULL AUTO_INCREMENT, -- 객실번호
                      accommodationId INT NOT NULL,  -- (외래키)숙소번호
                      roomPrice INT NOT NULL, -- 객실 1박당 가격
                      standardNumbers INT NOT NULL, -- 기준인원
                      maximumCapacity INT NOT NULL,   -- 최대 숙박인원
                      roomNumbers  INT NOT NULL,   -- 객실 수
                      roomName VARCHAR(30) NOT NULL,  -- 객실이름
                      roomDescription VARCHAR(5000) NOT NULL, -- 객실소개


                      CONSTRAINT PK_ROOM PRIMARY KEY (roomId),
                      CONSTRAINT FK_ROOM_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId)
);

CREATE TABLE roomImg ( -- 객실 이미지 테이플
                         roomImgId INT NOT NULL  AUTO_INCREMENT,  -- 객실이미지번호
                         roomId  INT NOT NULL,  -- (외래키)객실번호
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
VALUES(1,'관리자','admin','admin','관리자','관리자','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','참고사항','jly123@naver.com','1995-04-01');


INSERT into member
VALUES(2,'회원','asd','asd','윤재일','비운의소나기','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','참고사항','jly789@naver.com','1993-04-01');

INSERT into member
VALUES(3,'회원','jly789','a123','김민정','민정이','01012345678','13112','경기도 성남시 수진동','수앤수캐슬','','jly456@naver.com','1999-05-01');


INSERT into district VALUES(1,'서울');
INSERT into district VALUES(2,'부산');
INSERT into district VALUES(3,'제주');
INSERT into district VALUES(4,'경기');
INSERT into district VALUES(5,'인천');
INSERT into district VALUES(6,'강원');
INSERT into district VALUES(7,'경상');
INSERT into district VALUES(8,'전라');
INSERT into district VALUES(9,'충청');


INSERT into city VALUES(1,1,'강남/역삼/삼성');
INSERT into city VALUES(2,1,'신사/청담/압구정');
INSERT into city VALUES(3,1,'서초/교대/사당');
INSERT into city VALUES(4,1,'잠실/송파/강동');
INSERT into city VALUES(5,1,'을지로/명동/중구/동대문');
INSERT into city VALUES(6,1,'서울역/이태원/용산');
INSERT into city VALUES(7,1,'종로/인사동');
INSERT into city VALUES(8,1,'홍대/합정/마포/서대문');
INSERT into city VALUES(9,1,'여의도');
INSERT into city VALUES(10,1,'영등포역');
INSERT into city VALUES(11,1,'구로/신도림/금천');
INSERT into city VALUES(12,1,'김포공항/염창/강서');
INSERT into city VALUES(13,1,'건대입구/성수/왕십리');
INSERT into city VALUES(14,1,'성북/강북/노원/도봉');

INSERT into city VALUES(15,2,'해운대/마린시티');
INSERT into city VALUES(16,2,'벡스코/센텀시티');
INSERT into city VALUES(17,2,'송정/기장/정관');
INSERT into city VALUES(18,2,'광안리/경성대');
INSERT into city VALUES(19,2,'부산역');
INSERT into city VALUES(20,2,'자갈치/남포동/영도');
INSERT into city VALUES(21,2,'송도/다대포');
INSERT into city VALUES(22,2,'서면/연산/범일');
INSERT into city VALUES(23,2,'동래/온천/금정구');
INSERT into city VALUES(24,2,'사상/강서/김해공항/하단');


INSERT into city VALUES(25,3,'제주시/제주국제공항');
INSERT into city VALUES(26,3,'서귀포시/모슬포');
INSERT into city VALUES(27,3,'애월/한림/협재');
INSERT into city VALUES(28,3,'중문');
INSERT into city VALUES(29,3,'표선/성산');
INSERT into city VALUES(30,3,'함덕/김녕/세화');

INSERT into city VALUES(31,4,'가평/청평/양평');
INSERT into city VALUES(32,4,'수원/화성');
INSERT into city VALUES(33,4,'고양/파주/김포');
INSERT into city VALUES(34,4,'의정부/포천/동두천');
INSERT into city VALUES(35,4,'용인/동탄');
INSERT into city VALUES(36,4,'오산/평택');
INSERT into city VALUES(37,4,'남양주/구리/성남/분당');
INSERT into city VALUES(38,4,'이천/광주/여주/하남');
INSERT into city VALUES(39,4,'부천/광명/시흥/안산');
INSERT into city VALUES(40,4,'안양/의왕/군포');

INSERT into city VALUES(41,5,'송도/소래포구');
INSERT into city VALUES(42,5,'인천국제공항/강화/을왕리');
INSERT into city VALUES(43,5,'영종도/월미도');
INSERT into city VALUES(44,5,'주안/간석/인천시청');
INSERT into city VALUES(45,5,'청라/계양/부평');

INSERT into city VALUES(46,6,'강릉');
INSERT into city VALUES(47,6,'속초/고성');
INSERT into city VALUES(48,6,'양양(서피비치/낙산)');
INSERT into city VALUES(49,6,'춘천/인제/철원');
INSERT into city VALUES(50,6,'평창/정선/영월');
INSERT into city VALUES(51,6,'동해/삼척/태백');
INSERT into city VALUES(52,6,'홍천/횡성/원주');

INSERT into city VALUES(53,7,'대구/구미/안동/문경');
INSERT into city VALUES(54,7,'경주');
INSERT into city VALUES(55,7,'울산/양산/밀양');
INSERT into city VALUES(56,7,'거제/통영');
INSERT into city VALUES(57,7,'포항/영덕/울진/청송');
INSERT into city VALUES(58,7,'창원/마산/진해/김해/부곡');
INSERT into city VALUES(59,7,'남해/사천/하동/진주');

INSERT into city VALUES(60,8,'전주/완주');
INSERT into city VALUES(61,8,'광주/나주/함평');
INSERT into city VALUES(62,8,'여수');
INSERT into city VALUES(63,8,'순천/광양/담양/보성/화순');
INSERT into city VALUES(64,8,'남원/부안/정읍/고창/무주/구례');
INSERT into city VALUES(65,8,'군산/익산');
INSERT into city VALUES(66,8,'목포/신안/영광/진도/고흥/영암/완도/강진');

INSERT into city VALUES(67,9,'대전/세종');
INSERT into city VALUES(68,9,'천안/아산/도고');
INSERT into city VALUES(69,9,'당진/덕산/태안/서산/안면도');
INSERT into city VALUES(70,9,'보령/대천/부여/공주/금산');
INSERT into city VALUES(71,9,'청주/음성/진천');
INSERT into city VALUES(72,9,'충주/제천/단양/괴산/증평');


INSERT into accommodation VALUES(1,'강남 캠퍼스','서울','강남/역삼/삼성','서울 강남구 테헤란로2길 13 (역삼동)','모텔','★강남역 1번 출구 도보 1분거리★',sysdate());

INSERT into accommodation VALUES(2,'호텔 센트럴베이 광안리','부산','광안리/경성대','부산광역시 수영구 광안해변로 189','호텔/리조트','넓고 푸르른 바다를 객실에서 바라보며, 일상의 피로를 안락하고 편안한 공간에서
해소하며 재충전할 수 있는 휴식처 입니다. 최선의 서비스를 제공하여 고객에게 최고의 만족을 선사하기 위해 노력하겠습니다.',sysdate());


INSERT into accommodation VALUES(3,'호텔 휘슬락 바이 베스트웨스턴 시그니처 컬렉션','제주','제주시/제주국제공항','제주특별자치도 제주시 서부두2길 26','호텔/리조트','제주국제공항과 여객선터미널이 근접하여 접근성이 매우 우수하고 넓은 탑동광장을 비롯하여 아름다운 제주바다풍경을 온몸으로 맞이할 수 있는 힐링과 낭만을 선물합니다.
흑돼지 특화거리 및 서부두 명품 횟집거리 등의 향토음식거리가 즐비하여 제주 향토음식을 가까이서 즐길 수 있습니다.',sysdate());




INSERT into accommodationImg VALUES(1,1,'01_강남캠퍼스.jpg','/accommodationImg/01_강남캠퍼스.jpg');
INSERT into accommodationImg VALUES(2,2,'02_호텔센트럴베이광안리.jpg','/accommodationImg/02_호텔센트럴베이광안리.jpg');
INSERT into accommodationImg VALUES(3,3,'03_호텔 휘슬락 바이 베스트웨스턴 시그니처 컬렉션.jpg','/accommodationImg/03_호텔 휘슬락 바이 베스트웨스턴 시그니처 컬렉션.jpg');



INSERT into room VALUES(1,1,55000,2,2,5,'Standard','Standard 객실 랜덤배정');


INSERT into room VALUES(2,2,99000,1,1,5,'비즈니스싱글 시티뷰','기본정보
일회용품 무료 제공 불가 (칫솔, 치약, 면도기)
기준 1인 / 최대 1인
싱글 침대 1개
에어컨, TV, 냉장고, 커피포트, 생수
샤워시설, 욕조, 욕실용품, 드라이기, 가운
금연 객실
시설 및 서비스
객실구조
원룸형
객실구성
침대룸 1개
욕실 1개');

INSERT into room VALUES(3,3,95000,2,2,5,'디럭스 트윈','7.4평, 싱글 침대 2개
2인 기준 / 인원 추가 불가
에어컨, TV, 냉장고, 커피포트, 생수
샤워시설, 욕실용품, 드라이기
개별 테라스
무료 Wi-Fi
금연객실');


INSERT into roomImg VALUES(1,1,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(2,2,'02_비즈니스싱글 시티뷰.jpg','/roomImg/02_비즈니스싱글 시티뷰.jpg');
INSERT into roomImg VALUES(3,3,'03_디럭스 트윈.jpg','/roomImg/03_디럭스 트윈.jpg');

commit;

select * from member;
select * from district;
select * from city;
select * from accommodation;
select * from accommodationImg;
select * from room;
select * from roomImg;
select * from reservation;
select * from orders;
select * from notice;
select * from review;


--    select accommodationImg.accommodationImgId  from  accommodation
-- 	left join  accommodationImg
-- 	on accommodation.accommodationId= accommodationImg.accommodationId
--         where  accommodation.accommodationId=1;

















