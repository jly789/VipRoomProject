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

CREATE TABLE district ( -- 지역구 테이블
                          districtId  INT NOT NULL AUTO_INCREMENT, -- 지역구번호
                          districtName  VARCHAR(50) NOT NULL, -- 지역구이름

                          CONSTRAINT PK_DISTRICT PRIMARY KEY (districtId)
);

CREATE TABLE city ( -- 도시 테이플
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
                      roomName VARCHAR(30) NOT NULL,  -- 객실이름
                      roomDescription VARCHAR(5000) NOT NULL, -- 객실소개


                      CONSTRAINT PK_ROOM PRIMARY KEY (roomId),
                      CONSTRAINT FK_ROOM_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId)
);

CREATE TABLE roomImg ( -- 객실 이미지 테이플
                         roomImgId INT NOT NULL  AUTO_INCREMENT,  -- 객실이미지번호
                         roomId  INT NOT NULL,  -- (외래키)객실번호
                         accommodationId Int NOT NULL, -- (외래키)숙소번호
                         roomImage  VARCHAR(300) NOT NULL,  -- 객실 이미지
                         roomImagePath VARCHAR(300) NOT NULL, -- 객실 이미지경로

                         CONSTRAINT PK_ROOMIMG PRIMARY KEY (roomImgId),
                         CONSTRAINT FK_ROOMIMG_ROOMID FOREIGN KEY (roomId) REFERENCES room (roomId),
                         CONSTRAINT FK_ROOMIMG_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId)

);

CREATE TABLE reservation ( -- 예약테이블
                             reservationId INT NOT NULL  AUTO_INCREMENT, -- 예약번호
                             memberId INT NOT NULL, -- (외래키)회원번호
                             accommodationId INT NOT NULL, -- (외래키)숙소번호
                             roomId INT NOT NULL, -- (외래키)객실번호
                             reservationStatus VARCHAR(30) default '예약가능',  -- 객실상태 ex)예약가능, 예약불가,
                             reservationDetails VARCHAR(300) default '숙소예약에 필요한 정보를 입력해주세요', -- 예약내용,
                             reservationCheckIn VARCHAR(30) NOT NULL, -- 체크인
                             reservationCheckOut VARCHAR(30) NOT NULL, -- 체크아웃

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
    orderNum    VARCHAR(200) NOT NULL,  -- 주문번호
    impUid      VARCHAR(200) NULL, -- 결제번호
    orderStatus VARCHAR(30) NOT NULL, -- 주문상태 ex)결제완료
    orderDate   datetime NOT NULL default current_timestamp , -- 주문결제일

    CONSTRAINT PK_ORDERS PRIMARY KEY (orderId),
    CONSTRAINT FK_ORDERS_RESERVATIONID FOREIGN KEY (reservationId) REFERENCES reservation (reservationId)

);

CREATE TABLE notice
(
    noticeId      INT NOT NULL  AUTO_INCREMENT, -- 공지번호
    memberId      INT NOT NULL         NOT NULL, -- (외래키)회원번호
    noticeSubject VARCHAR(300)  NOT NULL, -- 공지제목
    noticeContent VARCHAR(4000) NOT NULL, -- 공지내용
    noticeType    VARCHAR(50)   NOT NULL, -- 중요,공지
    noticeDate    datetime NOT NULL default current_timestamp, -- 공지등록일
    noticeViews   INT NOT NULL DEFAULT 0, -- 공지조회수

    CONSTRAINT PK_NOTICE PRIMARY KEY (noticeId),
    CONSTRAINT FK_NOTICE_MEMBERID FOREIGN KEY (memberId) REFERENCES member (memberId)
);



CREATE TABLE review
(
    reviewId    INT NOT NULL AUTO_INCREMENT,   -- 리뷰번호
    memberId      INT NOT NULL, -- (외래키)회원번호
    accommodationId  INT NOT NULL,  -- (외래키)숙소번호
    reservationId INT NOT NULL, -- (외래키)예약번호
    roomId        INT NOT NULL, -- (외래키)객실번호
    views  INT NOT NULL default 0 , -- 리뷰수
    grade  INT NOT NULL, -- 리뷰평점
    reviewSubject  VARCHAR(255)      NOT NULL,  -- 리뷰제목
    reviewContent  VARCHAR(4000)     NOT NULL,  -- 리뷰내용
    reviewFileName VARCHAR(255)  NULL, -- 리뷰이미지
    reviewFilePath VARCHAR(255)  NULL, -- 리뷰이미지경로
    reviewState VARCHAR(50)  null, -- 리뷰상태
    reviewDate datetime NOT NULL default current_timestamp , -- 리뷰등록일
    CONSTRAINT PK_REVIEW PRIMARY KEY (reviewId),
    CONSTRAINT FK_REVIEW_MEMBERID FOREIGN KEY (memberId) REFERENCES member (memberId),
    CONSTRAINT FK_REVIEW_ACCOMMODATIONID FOREIGN KEY (accommodationId) REFERENCES accommodation (accommodationId),
    CONSTRAINT FK_REVIEW_RESERVATIONID FOREIGN KEY (reservationId) REFERENCES reservation (reservationId),
    CONSTRAINT FK_REVIEW_ROOMID FOREIGN KEY (roomId) REFERENCES room (roomId)
);

INSERT into member
VALUES(1,'관리자','admin','admin','관리자','관리자','01020893971','13111','경기도 성남시 태평동','수앤수캐슬','참고사항','jly789@naver.com','1995-04-01');
INSERT into member
VALUES(2,'회원','asd','asd','윤재일','윤재일','01012345678','13112','경기도 성남시 수진동','수앤수캐슬','','asd@naver.com','1999-05-01');
INSERT into member
VALUES(3,'회원','user1','user1','이지은','이지은','01042938422','13113','경기도 성남시 신흥동','리마빌딩','참고사항','user1@naver.com','1993-04-01');
INSERT into member
VALUES(4,'회원','user2','user2','김민정','김민정','01031229955','13114','서울시 강남구 청담동','임마스테이','','user2@naver.com','1992-08-01');
INSERT into member
VALUES(5,'회원','user3','user3','김채원','김채원','01021356966','13115','경기도 용인시 마북동','로앤스카이','','user3@naver.com','2001-03-01');
INSERT into member
VALUES(6,'회원','user4','user4','손흥민','손흥민','01077995433','13116','서울시 강남구 역삼동','강남스퀘어','','user4@naver.com','1997-01-01');

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
INSERT into city VALUES(25,3,'제주시 서부(공항/애월/협재)');
INSERT into city VALUES(26,3,'제주시 동부(조천/구좌/우도)');
INSERT into city VALUES(27,3,'서귀포 서부(중문/안덕/대정)');
INSERT into city VALUES(28,3,'사귀포 동부(성산/표선/남원)');
INSERT into city VALUES(29,4,'수원인계동/나혜석거리');
INSERT into city VALUES(30,4,'수원역/구운/행궁/장안구');
INSERT into city VALUES(31,4,'안양/평촌/인덕원/과천');
INSERT into city VALUES(32,4,'성남/분당/위례');
INSERT into city VALUES(33,4,'용인');
INSERT into city VALUES(34,4,'동탄/화성/오산/병점');
INSERT into city VALUES(35,4,'안산');
INSERT into city VALUES(36,4,'군포/의왕/금정/산본');
INSERT into city VALUES(37,4,'광명');
INSERT into city VALUES(38,4,'부천');
INSERT into city VALUES(39,4,'일산/고양');
INSERT into city VALUES(40,4,'남양주');
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
INSERT into city VALUES(67,9,'태안(만리포/청포대)');
INSERT into city VALUES(68,9,'태안(안면도/꽃지)');
INSERT into city VALUES(69,9,'보령(대천)');
INSERT into city VALUES(70,9,'당진/서천/서산/예산');
INSERT into city VALUES(71,9,'부여/논산/공주/어선/금산');

-- 서울 호텔
INSERT into accommodation VALUES(1,'글래드 강남 코엑스센터','서울','강남/역삼/삼성','서울특별시 강남구 테헤란로 610','호텔','★삼성역 1번출구 도보 1분★',sysdate());
INSERT into accommodation VALUES(2,'에이든 바이 베스트웨스턴 청담','서울','신사/청담/압구정','서울특별시 강남구 도산대로 216','호텔','압구정역 3번출구 도보 13분',sysdate());
INSERT into accommodation VALUES(3,'신라스테이 서초','서울','서초/교대/사당','서울특별시 서초구 효령로 427','호텔','강남역,양재역 도보 10분',sysdate());
INSERT into accommodation VALUES(4,'파크 하비오 호텔','서울','잠실/송파/강동','서울특별시 송파구 송파대로 111','호텔','장지역 4번출구 도보 5분',sysdate());
INSERT into accommodation VALUES(5,'나인트리 프리미어 명동2','서울','을지로/명동/중구/동대문','서울특별시 중구 마른내로 28','호텔','을지로3가역 11번출구 도보 5분',sysdate());
INSERT into accommodation VALUES(6,'노보텔 앰배서더 서울 용산','서울','서울역/이태원/용산','서울특별시 용산구 청파로20길 95','호텔','용산역 3번출구 도보 3분',sysdate());
INSERT into accommodation VALUES(7,'신라스테이 광화문','서울','종로/인사동','서울특별시 종로구 삼봉로 71','호텔','광화문역 2번 출구 447m',sysdate());
INSERT into accommodation VALUES(8,'글래드 마포','서울','홍대/합정/마포/서대문','서울특별시 마포구 마포대로 92','호텔','공덕역 바로 앞',sysdate());
INSERT into accommodation VALUES(9,'글래드 여의도','서울','여의도','서울특별시 영등포구 의사당대로 16','호텔','국회의사당역 4번출구 도보 1분',sysdate());
INSERT into accommodation VALUES(10,'페어필드 바이 메리어트 서울','서울','영등포역','서울특별시 영등포구 경인로 870','호텔','영등포역 5번출구 도보 3분',sysdate());
INSERT into accommodation VALUES(11,'신라스테이 구로','서울','구로/신도림/금천','서울특별시 동작구 시흥대로 596','호텔','구로디지털단지역 6번출구 도보 6분',sysdate());
INSERT into accommodation VALUES(12,'인터시티 서울 호텔','서울','김포공항/염창/강서','서울특별시 강서구 마곡중앙6로 76-3','호텔','발산역 9번출구 도보 2분',sysdate());
INSERT into accommodation VALUES(13,'호텔 더 디자이너스 건대','서울','건대입구/성수/왕십리','호텔 더 디자이너스 건대 서울특별시 광진구 천호대로 521','호텔','군자역 1번출구 도보 4분',sysdate());
INSERT into accommodation VALUES(14,'아리랑힐 호텔 동대문','서울','성북/강북/노원/도봉','서울특별시 성북구 아리랑로 8','호텔','성신여대입구역 6번출구 도보 1분',sysdate());
-- 부산 리조트
INSERT into accommodation VALUES(15,'엘리시아','부산','해운대/마린시티','부산광역시 해운대구 구남로 49','리조트','해운대해수욕장 바로 앞',sysdate());
INSERT into accommodation VALUES(16,'센텀 프리미어 호텔','부산','벡스코/센텀시티','부산광역시 해운대구 센텀1로 17','리조트','센텀시티역 11번 출구 도보 5분',sysdate());
INSERT into accommodation VALUES(17,'아난티 앳 부산 코브','부산','송정/기장/정관','부산광역시 기장군 기장읍 기장해안로 268-32','리조트','해동용궁사 1.45km',sysdate());
INSERT into accommodation VALUES(18,'호텔 센트럴베이 광안리','부산','광안리/경성대','부산광역시 수영구 광안해변로 189','리조트','부산 광안리해수욕장 정중앙',sysdate());
INSERT into accommodation VALUES(19,'코모도호텔 부산','부산','부산역','부산광역시 중구 중구로 151','리조트','중앙역 17번출구 464m',sysdate());
INSERT into accommodation VALUES(20,'하운드 남포 프리미어','부산','자갈치/남포동/영도','부산광역시 중구 보수대로 24','리조트','자갈치역 3번출구 도보 2분',sysdate());
INSERT into accommodation VALUES(21,'그랩 디 오션 송도','부산','송도/다대포','부산광역시 서구 송도해변로 97','리조트','송도해수욕장 도보 3분',sysdate());
INSERT into accommodation VALUES(22,'서면 라이온호텔 부산','부산','서면/연산/범일','부산광역시 부산진구 중앙대로691번가길 14-7','리조트','부전동 롯데백화점,서면시장 도보 1분',sysdate());
INSERT into accommodation VALUES(23,'브라운도트 구서역점','부산','동래/온천/금정구','부산광역시 금정구 중앙대로 1833','리조트','구서역 4번출구 30m, 금정경찰서 10m',sysdate());
INSERT into accommodation VALUES(24,'신라스테이 서부산','부산','사상/강서/김해공항/하단','부산광역시 강서구 명지국제7로 38','리조트','강서구 명지동',sysdate());
-- 제주 펜션
INSERT into accommodation VALUES(25,'제주 바다위에펜션','제주','제주시 서부(공항/애월/협재)','제주특별자치도 제주시 애월읍 일주서로 7219-1','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(26,'제주 써니펜션','제주','제주시 동부(조천/구좌/우도)','제주특별자치도 제주시 구좌읍 해맞이해안로 2232','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(27,'서귀포 모이라펜션','제주','서귀포 서부(중문/안덕/대정)','제주특별자치도 서귀포시 516로 296','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(28,'서귀포 바다위언덕펜션','제주','서귀포 동부(성산/표선/남원)','제주특별자치도 서귀포시 남원읍 태위로 594-6','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
-- 경기 모텔
INSERT into accommodation VALUES(29,'수원(인계동) NO.1 넘버원','경기','수원인계동/나혜석거리','경기 수원시 팔달구 권광로180번길 42-20 (인계동)','모텔','수원시청역 9, 10번 출구',sysdate());
INSERT into accommodation VALUES(30,'수원역 BIZ Hotel (비즈)','경기','수원역/구운/행궁/장안구','경기도 수원시 팔달구 고매로 5 (고등동)','모텔','수원역 그랜드 사우나 옆 위치.수원역 도보 5분',sysdate());
INSERT into accommodation VALUES(31,'안양 SS(상상)','경기','안양/평촌/인덕원/과천','경기 안양시 만안구 병목안로 12 (안양동)','모텔','1호선 안양역',sysdate());
INSERT into accommodation VALUES(32,'성남 YAJA 수진역점','경기','성남/분당/위례','경기 성남시 중원구 산성대로 164 (성남동)','모텔','분당선 모란역',sysdate());
INSERT into accommodation VALUES(33,'용인 HOTEL VOLE','경기','용인','경기 용인시 수지구 신수로 623 (풍덕천동)','모텔','신분당선 수지구청역',sysdate());
INSERT into accommodation VALUES(34,'동탄 호텔벨라','경기','동탄/화성/오산/병점','경기 화성시 노작로 147 (반송동)','모텔','동탄 복합 문화센터 도보 3분거리',sysdate());
INSERT into accommodation VALUES(35,'안산 Design Hotel XYM','경기','안산 중앙역','경기 안산시 단원구 고잔1길 63 (고잔동)','모텔','차량으로 오실때에는 지하 2층~지하3층 주차장을 이용하시기 바랍니다',sysdate());
INSERT into accommodation VALUES(36,'의왕 HOTEL ON','경기','군포/의왕/금정/산본','경기도 의왕시 복지로 6','모텔','버스 : 계원예술대, 롯데마트 (일반) 의왕시 51',sysdate());
INSERT into accommodation VALUES(37,'광명(철산) 루체','경기','광명','경기도 광명시 오리로854번길 16-15','모텔','7호선 철산역',sysdate());
INSERT into accommodation VALUES(38,'부천 YAM 부천역점','경기','부천','경기도 부천시 부일로 444-17','모텔','부천역 3번 출구에서 도보로 약 5분이내',sysdate());
INSERT into accommodation VALUES(39,'고양(화정) 프라자','경기','일산/고양','경기 고양시 덕양구 화정로 53-1 (화정동)','모텔','3호선 화정역',sysdate());
INSERT into accommodation VALUES(40,'남양주 골드 호텔','경기','남양주','경기 남양주시 별내면 청학로92번길 133','모텔','요금 : [무료]유형 : [숙소 내 주차장]',sysdate());
-- 인천 호텔
INSERT into accommodation VALUES(41,'송도 센트럴파크 호텔','인천','송도/소래포구','인천광역시 연수구 테크노파크로 193','호텔','인천1호선 인천대입구역',sysdate());
INSERT into accommodation VALUES(42,'골든튤립 인천공항 호텔 & 스위트','인천','인천국제공항/강화/을왕리','인천광역시 중구 흰바위로59번길 8','호텔','운서역 1번출구 도보 1분',sysdate());
INSERT into accommodation VALUES(43,'웨스턴 그레이스 호텔','인천','영종도/월미도','인천광역시 중구 은하수로29번길 36','호텔','영종역 차량 15분
구읍뱃터 도보 4분 거리',sysdate());
INSERT into accommodation VALUES(44,'호텔 더 디자이너스 인천','인천','주안/간석/인천시청','인천광역시 남동구 남동대로765번길 8','호텔','인천1호선 인천시청역',sysdate());
INSERT into accommodation VALUES(45,'호텔 소프라 인천청라','인천','청라/계양/부평','인천광역시 서구 서곶로301번길 21','호텔','인천2호선 아시아드경기장역',sysdate());
-- 강원 호텔
INSERT into accommodation VALUES(46,'강릉 세인트존스호텔','강원','강릉','강원도 강릉시 창해로 307','호텔','강문해변 인근',sysdate());
INSERT into accommodation VALUES(47,'라마다 속초 호텔','강원','속초/고성','강원도 속초시 대포항희망길 106','호텔','대포항 약 300m',sysdate());
INSERT into accommodation VALUES(48,'디그니티 호텔','강원','양양(서피비치/낙산)','강원도 양양군 양양읍 일출로 159-5','호텔','낙산해수욕장 도보 1분',sysdate());
INSERT into accommodation VALUES(49,'춘천 더 잭슨나인스 호텔','강원','춘천/인제/철원','강원도 춘천시 중앙로 193','호텔','공지천 도보 4분',sysdate());
INSERT into accommodation VALUES(50,'메이힐스 리조트','강원','평창/정선/영월','강원도 정선군 고한읍 물한리길 8','호텔','정선 강원랜드 카지노, 하이원CC 차량 10분
· 정선 하이원 스키장, 워터월드 차량 5분',sysdate());
INSERT into accommodation VALUES(51,'아이체크호텔','강원','동해/삼척/태백','강원도 동해시 한섬로 133-9','호텔','동해역 3.27km',sysdate());
INSERT into accommodation VALUES(52,'소노벨 비발디파크 B , C','강원','홍천/횡성/원주','강원도 홍천군 서면 한치골길 262','호텔','홍천군 서면',sysdate());
-- 경상 호텔
INSERT into accommodation VALUES(53,'대구 앙코르 호텔','경상','대구/구미/안동/문경','대구광역시 동구 이노밸리로 7','호텔','율하역 차량 약 5분 거리',sysdate());
INSERT into accommodation VALUES(54,'힐튼 경주','경상','경주','경상북도 경주시 보문로 484-7','호텔','경주 보문관광단지 내',sysdate());
INSERT into accommodation VALUES(55,'울산 리버사이드호텔','경상','울산/양산/밀양','울산광역시 중구 젊음의거리 20','호텔','태화강변 바로 앞',sysdate());
INSERT into accommodation VALUES(56,'통영 스탠포드 호텔앤리조트','경상','거제/통영','경상남도 통영시 도남로 347','호텔','통영시 통영종합버스터미널 약 10km',sysdate());
INSERT into accommodation VALUES(57,'라한호텔 포항','경상','포항/영덕/울진/청송','경상북도 포항시 북구 삼호로265번길 1','호텔','영일대 해수욕장 도보 2분 거리에 해변이 위치함',sysdate());
INSERT into accommodation VALUES(58,'베스트 루이스 해밀턴 창원','경상','창원/마산/진해/김해/부곡','경상남도 창원시 성산구 마디미로70번길 8','호텔','창원시청 차량 3분 거리',sysdate());
INSERT into accommodation VALUES(59,'사천 아르떼 리조트','경상','남해/사천/하동/진주','경상남도 사천시 해안관광로 109-10','호텔','삼천포시외버스터미널 차량 10분 거리',sysdate());
-- 전라 호텔
INSERT into accommodation VALUES(60,'라한호텔 전주','전라','전주/완주','전라북도 전주시 완산구 기린대로 85','호텔','전주한옥마을 안에 위치',sysdate());
INSERT into accommodation VALUES(61,'광주 유탑 부티크 호텔&레지던스','전라','광주/나주/함평','광주광역시 서구 시청로 53','호텔','기아챔피언스필드 차량 10분',sysdate());
INSERT into accommodation VALUES(62,'여수 유탑 마리나 호텔&리조트','전라','여수','전남 여수시 오동도로 61-15','호텔','여수 엑스포 아쿠아플라넷 도보4분',sysdate());
INSERT into accommodation VALUES(63,'순천 호텔 라움','전라','순천/광양/담양/보성/화순','전라남도 순천시 하풍동길 1-1','호텔','순천역 도보 10분',sysdate());
INSERT into accommodation VALUES(64,'무주 나봄리조트','전라','남원/부안/정읍/고창/무주/구례','전라북도 무주군 설천면 월곡길 45','호텔','무주 덕유산 스키장 차량 약 10분',sysdate());
INSERT into accommodation VALUES(65,'에이본 호텔 군산','전라','군산/익산','전라북도 군산시 해망로 10','호텔','군산시 군산시외버스터미널 50m',sysdate());
INSERT into accommodation VALUES(66,'쏠비치 진도 리조트','전라','목포/신안/영광/진도/고흥/완도/강진','전라남도 진도군 의신면 송군길 30-40','호텔','진도군 의신면',sysdate());
-- 충청 풀빌라
INSERT into accommodation VALUES(67,'태안 썬스톤풀빌라','충청','태안(만리포/청포대)','충청남도 태안군 남면 진산1길 277-75','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(68,'태안 지중해아침펜션','충청','태안(안면도/꽃지)','충청남도 태안군 고남면 큰장돌길 141-98','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(69,'보령(대천) 너울펜션','충청','보령(대천)','충청남도 보령시 해수욕장13길 10-26','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(70,'당진 라메르펜션','충청','당진/서천/서산/예산','충청남도 당진시 석문면 석문해안로 133','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
INSERT into accommodation VALUES(71,'논산 열린펜션','충청','부여/논산/공주/어선/금산','충청남도 논산시 연무읍 연무로404번길 17-9','펜션/풀빌라','픽업 서비스를 제공하지 않는 펜션입니다.',sysdate());
-- 서울 호텔
INSERT into accommodationImg VALUES(1,1,'01_1_글래드강남코엑스센터.jpg','/accommodationImg/01_1_글래드강남코엑스센터.jpg');
INSERT into accommodationImg VALUES(2,2,'02_에이든바이베스트웨스턴청담.jpg','/accommodationImg/02_에이든바이베스트웨스턴청담.jpg');
INSERT into accommodationImg VALUES(3,3,'03_신라스테이서초.jpg','/accommodationImg/03_신라스테이서초.jpg');
INSERT into accommodationImg VALUES(4,4,'04_파크하비오호텔.jpg','/accommodationImg/04_파크하비오호텔.jpg');
INSERT into accommodationImg VALUES(5,5,'05_나인트리프리미어명동2.jpg','/accommodationImg/05_나인트리프리미어명동2.jpg');
INSERT into accommodationImg VALUES(6,6,'06_노보텔앰배서더서울용산.jpg','/accommodationImg/06_노보텔앰배서더서울용산.jpg');
INSERT into accommodationImg VALUES(7,7,'07_신라스테이광화문.jpg','/accommodationImg/07_신라스테이광화문.jpg');
INSERT into accommodationImg VALUES(8,8,'08_글래드마포.jpg','/accommodationImg/08_글래드마포.jpg');
INSERT into accommodationImg VALUES(9,9,'09_글래드여의도.jpg','/accommodationImg/09_글래드여의도.jpg');
INSERT into accommodationImg VALUES(10,10,'10_페어필드바이메리어트서울.jpg','/accommodationImg/10_페어필드바이메리어트서울.jpg');
INSERT into accommodationImg VALUES(11,11,'11_신라스테이구로.jpg','/accommodationImg/11_신라스테이구로.jpg');
INSERT into accommodationImg VALUES(12,12,'12_인터시티서울호텔.jpg','/accommodationImg/12_인터시티서울호텔.jpg');
INSERT into accommodationImg VALUES(13,13,'13_호텔더디자이너스건대.jpg','/accommodationImg/13_호텔더디자이너스건대.jpg');
INSERT into accommodationImg VALUES(14,14,'14_아리랑힐호텔동대문.jpg','/accommodationImg/14_아리랑힐호텔동대문.jpg');
-- 부산 리조트
INSERT into accommodationImg VALUES(15,15,'15_1_엘리시아.jpg','/accommodationImg/15_1_엘리시아.jpg');
INSERT into accommodationImg VALUES(16,16,'16_센텀프리미어호텔.jpg','/accommodationImg/16_센텀프리미어호텔.jpg');
INSERT into accommodationImg VALUES(17,17,'17_아난티앳부산코브.jpg','/accommodationImg/17_아난티앳부산코브.jpg');
INSERT into accommodationImg VALUES(18,18,'18_호텔센트럴베이광안리.jpg','/accommodationImg/18_호텔센트럴베이광안리.jpg');
INSERT into accommodationImg VALUES(19,19,'19_코모도호텔.jpg','/accommodationImg/19_코모도호텔.jpg');
INSERT into accommodationImg VALUES(20,20,'20_하운드남포프리미어.jpg','/accommodationImg/20_하운드남포프리미어.jpg');
INSERT into accommodationImg VALUES(21,21,'21_그랩디오션송도.jpg','/accommodationImg/21_그랩디오션송도.jpg');
INSERT into accommodationImg VALUES(22,22,'22_서면라이온호텔부산.jpg','/accommodationImg/22_서면라이온호텔부산.jpg');
INSERT into accommodationImg VALUES(23,23,'23_브라운도트구서역점.jpg','/accommodationImg/23_브라운도트구서역점.jpg');
INSERT into accommodationImg VALUES(24,24,'24_신라스테이서부산.jpg','/accommodationImg/24_신라스테이서부산.jpg');
-- 제주 펜션
INSERT into accommodationImg VALUES(25,25,'25_1_제주바다위에펜션.jpg','/accommodationImg/25_1_제주바다위에펜션.jpg');
INSERT into accommodationImg VALUES(26,26,'26_제주써니펜션.jpg','/accommodationImg/26_제주써니펜션.jpg');
INSERT into accommodationImg VALUES(27,27,'27_서귀포모이라펜션.jpg','/accommodationImg/27_서귀포모이라펜션.jpg');
INSERT into accommodationImg VALUES(28,28,'28_서귀포바다위언덕펜션.jpg','/accommodationImg/28_서귀포바다위언덕펜션.jpg');
-- 경기 모텔
INSERT into accommodationImg VALUES(29,29,'29_1_수원넘버원.jpg','/accommodationImg/29_1_수원넘버원.jpg');
INSERT into accommodationImg VALUES(30,30,'30_수원역BIZHotel.jpg','/accommodationImg/30_수원역BIZHotel.jpg');
INSERT into accommodationImg VALUES(31,31,'31_안양SS.jpg','/accommodationImg/31_안양SS.jpg');
INSERT into accommodationImg VALUES(32,32,'32_성남YAJA수진역점.jpg','/accommodationImg/32_성남YAJA수진역점.jpg');
INSERT into accommodationImg VALUES(33,33,'33_용인HOTELVOLE.jpg','/accommodationImg/33_용인HOTELVOLE.jpg');
INSERT into accommodationImg VALUES(34,34,'34_동탄호텔벨라.jpg','/accommodationImg/34_동탄호텔벨라.jpg');
INSERT into accommodationImg VALUES(35,35,'35_안산DesignHotelXYM.jpg','/accommodationImg/35_안산DesignHotelXYM.jpg');
INSERT into accommodationImg VALUES(36,36,'36_의왕HOTELON.jpg','/accommodationImg/36_의왕HOTELON.jpg');
INSERT into accommodationImg VALUES(37,37,'37_루체.jpg','/accommodationImg/37_루체.jpg');
INSERT into accommodationImg VALUES(38,38,'38_부천YAM부천역점.jpg','/accommodationImg/38_부천YAM부천역점.jpg');
INSERT into accommodationImg VALUES(39,39,'39_고양프라자.jpg','/accommodationImg/39_39_고양프라자.jpg');
INSERT into accommodationImg VALUES(40,40,'40_남양주골드호텔.jpg','/accommodationImg/40_남양주골드호텔.jpg');
-- 인천 호텔
INSERT into accommodationImg VALUES(41,41,'41_1_송도센트럴파크호텔.jpg','/accommodationImg/41_1_송도센트럴파크호텔.jpg');
INSERT into accommodationImg VALUES(42,42,'42_골든튤립인천공항호텔스위트.jpg','/accommodationImg/42_골든튤립인천공항호텔스위트.jpg');
INSERT into accommodationImg VALUES(43,43,'43_웨스턴그레이스호텔.jpg','/accommodationImg/43_웨스턴그레이스호텔.jpg');
INSERT into accommodationImg VALUES(44,44,'44_호텔더디자이너스인천.jpg','/accommodationImg/44_호텔더디자이너스인천.jpg');
INSERT into accommodationImg VALUES(45,45,'45_호텔소프라인천청라.jpg','/accommodationImg/45_호텔소프라인천청라.jpg');
-- 강원 호텔
INSERT into accommodationImg VALUES(46,46,'46_1_강릉세인트존스호텔.jpg','/accommodationImg/46_1_강릉세인트존스호텔.jpg');
INSERT into accommodationImg VALUES(47,47,'47_라마다속초호텔.jpg','/accommodationImg/47_라마다속초호텔.jpg');
INSERT into accommodationImg VALUES(48,48,'48_디그니티호텔.jpg','/accommodationImg/48_디그니티호텔.jpg');
INSERT into accommodationImg VALUES(49,49,'49_춘천더잭슨나인스호텔.jpg','/accommodationImg/49_춘천더잭슨나인스호텔.jpg');
INSERT into accommodationImg VALUES(50,50,'50_메이힐스리조트.jpg','/accommodationImg/50_메이힐스리조트.jpg');
INSERT into accommodationImg VALUES(51,51,'51_아이체크호텔.jpg','/accommodationImg/51_아이체크호텔.jpg');
INSERT into accommodationImg VALUES(52,52,'52_소노벨비발디파크.jpg','/accommodationImg/52_소노벨비발디파크.jpg');
-- 경상 호텔
INSERT into accommodationImg VALUES(53,53,'53_1_대구앙코르호텔.jpg','/accommodationImg/53_1_대구앙코르호텔.jpg');
INSERT into accommodationImg VALUES(54,54,'54_힐튼경주.jpg','/accommodationImg/54_힐튼경주.jpg');
INSERT into accommodationImg VALUES(55,55,'55_울산리버사이드호텔.jpg','/accommodationImg/55_울산리버사이드호텔.jpg');
INSERT into accommodationImg VALUES(56,56,'56_통영스탠포드호텔앤리조트.jpg','/accommodationImg/56_통영스탠포드호텔앤리조트.jpg');
INSERT into accommodationImg VALUES(57,57,'57_라한호텔포항.jpg','/accommodationImg/57_라한호텔포항.jpg');
INSERT into accommodationImg VALUES(58,58,'58_베스트루이스해밀턴창원.jpg','/accommodationImg/58_베스트루이스해밀턴창원.jpg');
INSERT into accommodationImg VALUES(59,59,'59_사천아르떼리조트.jpg','/accommodationImg/59_사천아르떼리조트.jpg');
-- 전라 호텔
INSERT into accommodationImg VALUES(60,60,'60_1_라한호텔전주.jpg','/accommodationImg/60_1_라한호텔전주.jpg');
INSERT into accommodationImg VALUES(61,61,'61_광주유탑부티크호텔&레지던스.jpg','/accommodationImg/61_광주유탑부티크호텔&레지던스.jpg');
INSERT into accommodationImg VALUES(62,62,'62_여수유탑마리나호텔&리조트.jpg','/accommodationImg/62_여수유탑마리나호텔&리조트.jpg');
INSERT into accommodationImg VALUES(63,63,'63_순천호텔라움.jpg','/accommodationImg/63_순천호텔라움.jpg');
INSERT into accommodationImg VALUES(64,64,'64_무주나봄리조트.jpg','/accommodationImg/64_무주나봄리조트.jpg');
INSERT into accommodationImg VALUES(65,65,'65_에이본호텔군산.jpg','/accommodationImg/65_에이본호텔군산.jpg');
INSERT into accommodationImg VALUES(66,66,'66_쏠비치진도리조트.jpg','/accommodationImg/66_쏠비치진도리조트.jpg');
-- 충청 풀빌라
INSERT into accommodationImg VALUES(67,67,'67_1_태안썬스톤풀빌라.jpg','/accommodationImg/67_1_태안썬스톤풀빌라.jpg');
INSERT into accommodationImg VALUES(68,68,'68_태안지중해아침펜션.jpg','/accommodationImg/68_태안지중해아침펜션.jpg');
INSERT into accommodationImg VALUES(69,69,'69_너울펜션.jpg','/accommodationImg/69_너울펜션.jpg');
INSERT into accommodationImg VALUES(70,70,'70_당진라메르펜션.jpg','/accommodationImg/70_당진라메르펜션.jpg');
INSERT into accommodationImg VALUES(71,71,'71_논산열린펜션.jpg','/accommodationImg/71_논산열린펜션.jpg');

INSERT into room VALUES(1,1,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(2,1,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(3,1,400000,2,2,'할리우드 더블','할리우드 더블 객실 랜덤배정');
INSERT into room VALUES(4,2,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(5,2,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(6,3,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(7,3,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(8,4,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(9,4,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(10,5,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(11,5,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(12,6,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(13,6,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(14,7,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(15,7,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(16,8,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(17,8,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(18,9,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(19,9,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(20,10,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(21,10,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(22,11,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(23,11,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(24,12,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(25,12,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(26,13,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(27,13,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(28,14,150000,2,2,'스탠다드 더블','스탠다드 더블 객실 랜덤배정');
INSERT into room VALUES(29,14,300000,2,2,'스탠다드 트윈','스탠다드 트윈 객실 랜덤배정');
INSERT into room VALUES(30,15,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(31,15,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(32,15,200000,2,2,'오션시티 더블','오션시티 더블 객실 랜덤배정');
INSERT into room VALUES(33,16,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(34,16,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(35,17,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(36,17,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(37,18,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(38,18,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(39,19,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(40,19,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(41,20,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(42,20,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(43,21,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(44,21,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(45,22,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(46,22,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(47,23,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(48,23,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(49,24,120000,2,2,'패밀리 더블','패밀리 더블 객실 랜덤배정');
INSERT into room VALUES(50,24,150000,2,2,'오션 스탠다드더블','오션 스탠다드더블 객실 랜덤배정');
INSERT into room VALUES(51,25,80000,2,2,'우드룸','우드룸 객실 랜덤배정');
INSERT into room VALUES(52,25,100000,2,2,'화이트룸','화이트룸 객실 랜덤배정');
INSERT into room VALUES(53,25,150000,2,2,'스파룸','스파룸 객실 랜덤배정');
INSERT into room VALUES(54,26,80000,2,2,'우드룸','우드룸 객실 랜덤배정');
INSERT into room VALUES(55,26,100000,2,2,'화이트룸','화이트룸 객실 랜덤배정');
INSERT into room VALUES(56,27,80000,2,2,'우드룸','우드룸 객실 랜덤배정');
INSERT into room VALUES(57,27,100000,2,2,'화이트룸','화이트룸 객실 랜덤배정');
INSERT into room VALUES(58,28,80000,2,2,'우드룸','우드룸 객실 랜덤배정');
INSERT into room VALUES(59,28,100000,2,2,'화이트룸','화이트룸 객실 랜덤배정');
INSERT into room VALUES(60,29,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(61,29,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(62,29,60000,2,2,'스위트B','스위트B 객실 랜덤배정');
INSERT into room VALUES(63,30,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(64,30,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(65,31,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(66,31,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(67,32,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(68,32,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(69,33,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(70,33,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(71,34,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(72,34,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(73,35,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(74,35,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(75,36,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(76,36,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(77,37,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(78,37,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(79,38,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(80,38,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(81,39,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(82,39,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(83,40,51000,2,2,'일반실','일반실 랜덤배정');
INSERT into room VALUES(84,40,55000,2,2,'커플PC','커플PC 객실 랜덤배정');
INSERT into room VALUES(85,41,140000,2,2,'디럭스 패밀리트윈','디럭스 패밀리트윈실 랜덤배정');
INSERT into room VALUES(86,41,160000,2,2,'디럭스 더블-하프센트럴파크뷰','디럭스 더블-하프센트럴파크뷰 객실 랜덤배정');
INSERT into room VALUES(87,41,200000,2,2,'디럭스 더블-센트럴파크뷰','디럭스 더블-센트럴파크뷰 객실 랜덤배정');
INSERT into room VALUES(88,42,140000,2,2,'디럭스 패밀리트윈','디럭스 패밀리트윈실 랜덤배정');
INSERT into room VALUES(89,42,160000,2,2,'디럭스 더블-하프센트럴파크뷰','디럭스 더블-하프센트럴파크뷰 객실 랜덤배정');
INSERT into room VALUES(90,43,140000,2,2,'디럭스 패밀리트윈','디럭스 패밀리트윈실 랜덤배정');
INSERT into room VALUES(91,43,160000,2,2,'디럭스 더블-하프센트럴파크뷰','디럭스 더블-하프센트럴파크뷰 객실 랜덤배정');
INSERT into room VALUES(92,44,140000,2,2,'디럭스 패밀리트윈','디럭스 패밀리트윈실 랜덤배정');
INSERT into room VALUES(93,44,160000,2,2,'디럭스 더블-하프센트럴파크뷰','디럭스 더블-하프센트럴파크뷰 객실 랜덤배정');
INSERT into room VALUES(94,45,140000,2,2,'디럭스 패밀리트윈','디럭스 패밀리트윈실 랜덤배정');
INSERT into room VALUES(95,45,160000,2,2,'디럭스 더블-하프센트럴파크뷰','디럭스 더블-하프센트럴파크뷰 객실 랜덤배정');
INSERT into room VALUES(96,46,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(97,46,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(98,46,200000,2,2,'슈페리어 헐리우드 노오션뷰','슈페리어 헐리우드 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(99,47,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(100,47,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(101,48,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(102,48,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(103,49,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(104,49,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(105,50,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(106,50,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(107,51,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(108,51,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(109,52,110000,2,2,'슈페리어 더블 노오션뷰','슈페리어 더블 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(110,52,130000,2,2,'슈페리어 트윈 노오션뷰','슈페리어 트윈 노오션뷰 객실 랜덤배정');
INSERT into room VALUES(111,53,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(112,53,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(113,53,80000,2,2,'트윈','트윈 객실 랜덤배정');
INSERT into room VALUES(114,54,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(115,54,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(116,55,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(117,55,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(118,56,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(119,56,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(120,57,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(121,57,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(122,58,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(123,58,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(124,59,60000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(125,59,70000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(126,60,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(127,60,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(128,60,250000,2,2,'트리플','트리플 객실 랜덤배정');
INSERT into room VALUES(129,61,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(130,61,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(131,62,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(132,62,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(133,63,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(134,63,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(135,64,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(136,64,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(137,65,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(138,65,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(139,66,210000,2,2,'패밀리 트윈','패밀리 트윈 객실 랜덤배정');
INSERT into room VALUES(140,66,230000,2,2,'패밀리 트윈-시티뷰','패밀리 트윈-시티뷰 객실 랜덤배정');
INSERT into room VALUES(141,67,120000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(142,67,150000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(143,67,180000,2,2,'트윈','트윈 객실 랜덤배정');
INSERT into room VALUES(144,68,120000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(145,68,150000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(146,69,120000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(147,69,150000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(148,70,120000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(149,70,150000,2,2,'비즈니스','비즈니스 객실 랜덤배정');
INSERT into room VALUES(150,71,120000,2,2,'스탠다드','스탠다드 객실 랜덤배정');
INSERT into room VALUES(151,71,150000,2,2,'비즈니스','비즈니스 객실 랜덤배정');

INSERT into roomImg VALUES(1,1,1,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(2,2,1,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(3,3,1,'01_Suite.jpg','/roomImg/01_Suite.jpg');
INSERT into roomImg VALUES(4,4,2,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(5,5,2,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(6,6,3,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(7,7,3,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(8,8,4,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(9,9,4,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(10,10,5,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(11,11,5,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(12,12,6,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(13,13,6,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(14,14,7,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(15,15,7,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(16,16,8,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(17,17,8,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(18,18,9,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(19,19,9,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(20,20,10,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(21,21,10,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(22,22,11,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(23,23,11,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(24,24,12,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(25,25,12,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(26,26,13,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(27,27,13,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(28,28,14,'01_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(29,29,14,'01_Deluxe.jpg','/roomImg/01_Deluxe.jpg');
INSERT into roomImg VALUES(30,30,15,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(31,31,15,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(32,32,15,'02_Suite.jpg','/roomImg/02_Suite.jpg');
INSERT into roomImg VALUES(33,33,16,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(34,34,16,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(35,35,17,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(36,36,17,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(37,37,18,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(38,38,18,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(39,39,19,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(40,40,19,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(41,41,20,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(42,42,20,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(43,43,21,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(44,44,21,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(45,45,22,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(46,46,22,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(47,47,23,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(48,48,23,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(49,49,24,'02_Standard.jpg','/roomImg/02_Standard.jpg');
INSERT into roomImg VALUES(50,50,24,'02_Deluxe.jpg','/roomImg/02_Deluxe.jpg');
INSERT into roomImg VALUES(51,51,25,'03_Standard.jpg','/roomImg/03_Standard.jpg');
INSERT into roomImg VALUES(52,52,25,'03_Deluxe.jpg','/roomImg/03_Deluxe.jpg');
INSERT into roomImg VALUES(53,53,25,'03_Suite.jpg','/roomImg/03_Suite.jpg');
INSERT into roomImg VALUES(54,54,26,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(55,55,26,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(56,56,27,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(57,57,27,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(58,58,28,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(59,59,28,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(60,60,29,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(61,61,29,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(62,62,29,'04_Suite.jpg','/roomImg/04_Suite.jpg');
INSERT into roomImg VALUES(63,63,30,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(64,64,30,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(65,65,31,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(66,66,31,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(67,67,32,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(68,68,32,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(69,69,33,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(70,70,33,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(71,71,34,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(72,72,34,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(73,73,35,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(74,74,35,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(75,75,36,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(76,76,36,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(77,77,37,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(78,78,37,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(79,79,38,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(80,80,38,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(81,81,39,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(82,82,39,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(83,83,40,'04_Standard.jpg','/roomImg/04_Standard.jpg');
INSERT into roomImg VALUES(84,84,40,'04_Deluxe.jpg','/roomImg/04_Deluxe.jpg');
INSERT into roomImg VALUES(85,85,41,'05_Standard.jpg','/roomImg/05_Standard.jpg');
INSERT into roomImg VALUES(86,86,41,'05_Deluxe.jpg','/roomImg/05_Deluxe.jpg');
INSERT into roomImg VALUES(87,87,41,'05_Suite.jpg','/roomImg/05_Suite.jpg');
INSERT into roomImg VALUES(88,88,42,'05_Standard.jpg','/roomImg/05_Standard.jpg');
INSERT into roomImg VALUES(89,89,42,'05_Deluxe.jpg','/roomImg/05_Deluxe.jpg');
INSERT into roomImg VALUES(90,90,43,'05_Standard.jpg','/roomImg/05_Standard.jpg');
INSERT into roomImg VALUES(91,91,43,'05_Deluxe.jpg','/roomImg/05_Deluxe.jpg');
INSERT into roomImg VALUES(92,92,44,'05_Standard.jpg','/roomImg/05_Standard.jpg');
INSERT into roomImg VALUES(93,93,44,'05_Deluxe.jpg','/roomImg/05_Deluxe.jpg');
INSERT into roomImg VALUES(94,94,45,'05_Standard.jpg','/roomImg/05_Standard.jpg');
INSERT into roomImg VALUES(95,95,45,'05_Deluxe.jpg','/roomImg/05_Deluxe.jpg');
INSERT into roomImg VALUES(96,96,46,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(97,97,46,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(98,98,46,'06_Suite.jpg','/roomImg/06_Suite.jpg');
INSERT into roomImg VALUES(99,99,47,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(100,100,47,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(101,101,48,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(102,102,48,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(103,103,49,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(104,104,49,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(105,105,50,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(106,106,50,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(107,107,51,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(108,108,51,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(109,109,52,'06_Standard.jpg','/roomImg/06_Standard.jpg');
INSERT into roomImg VALUES(110,110,52,'06_Deluxe.jpg','/roomImg/06_Deluxe.jpg');
INSERT into roomImg VALUES(111,111,53,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(112,112,53,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(113,113,53,'07_Suite.jpg','/roomImg/07_Suite.jpg');
INSERT into roomImg VALUES(114,114,54,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(115,115,54,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(116,116,55,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(117,117,55,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(118,118,56,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(119,119,56,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(120,120,57,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(121,121,57,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(122,122,58,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(123,123,58,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(124,124,59,'07_Standard.jpg','/roomImg/07_Standard.jpg');
INSERT into roomImg VALUES(125,125,59,'07_Deluxe.jpg','/roomImg/07_Deluxe.jpg');
INSERT into roomImg VALUES(126,126,60,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(127,127,60,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(128,128,60,'08_Suite.jpg','/roomImg/08_Suite.jpg');
INSERT into roomImg VALUES(129,129,61,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(130,130,61,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(131,131,62,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(132,132,62,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(133,133,63,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(134,134,63,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(135,135,64,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(136,136,64,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(137,137,65,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(138,138,65,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(139,139,66,'08_Standard.jpg','/roomImg/08_Standard.jpg');
INSERT into roomImg VALUES(140,140,66,'08_Deluxe.jpg','/roomImg/08_Deluxe.jpg');
INSERT into roomImg VALUES(141,141,67,'09_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(142,142,67,'09_Deluxe.jpg','/roomImg/09_Deluxe.jpg');
INSERT into roomImg VALUES(143,143,67,'09_Suite.jpg','/roomImg/09_Suite.jpg');
INSERT into roomImg VALUES(144,144,68,'09_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(145,145,68,'09_Deluxe.jpg','/roomImg/09_Deluxe.jpg');
INSERT into roomImg VALUES(146,146,69,'09_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(147,147,69,'09_Deluxe.jpg','/roomImg/09_Deluxe.jpg');
INSERT into roomImg VALUES(148,148,70,'09_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(149,149,70,'09_Deluxe.jpg','/roomImg/09_Deluxe.jpg');
INSERT into roomImg VALUES(150,150,71,'09_Standard.jpg','/roomImg/01_Standard.jpg');
INSERT into roomImg VALUES(151,151,71,'09_Deluxe.jpg','/roomImg/09_Deluxe.jpg');

INSERT into reservation VALUES(1,2,1,1,'예약중','도착하면 연락하겠습니다','2024-05-29','2024-05-30');
INSERT into reservation VALUES(2,3,1,1,'예약중','도착하면 연락하겠습니다','2024-06-01','2024-06-02');
INSERT into reservation VALUES(3,3,1,2,'예약중','도착하면 연락하겠습니다','2024-06-05','2024-06-06');
INSERT into reservation VALUES(4,3,1,3,'예약중','도착하면 연락하겠습니다','2024-06-10','2024-06-11');
INSERT into reservation VALUES(5,4,2,4,'예약중','도착하면 연락하겠습니다','2024-06-01','2024-06-02');
INSERT into reservation VALUES(6,4,2,5,'예약중','도착하면 연락하겠습니다','2024-06-05','2024-06-06');
INSERT into reservation VALUES(7,4,2,5,'예약중','도착하면 연락하겠습니다','2024-06-10','2024-06-11');
INSERT into reservation VALUES(8,5,3,6,'예약중','도착하면 연락하겠습니다','2024-06-01','2024-06-02');
INSERT into reservation VALUES(9,5,3,7,'예약중','도착하면 연락하겠습니다','2024-06-05','2024-06-06');
INSERT into reservation VALUES(10,5,3,7,'예약중','도착하면 연락하겠습니다','2024-06-10','2024-06-11');
INSERT into reservation VALUES(11,6,4,8,'예약중','도착하면 연락하겠습니다','2024-06-01','2024-06-02');
INSERT into reservation VALUES(12,6,4,9,'예약중','도착하면 연락하겠습니다','2024-06-05','2024-06-06');
INSERT into reservation VALUES(13,6,4,9,'예약중','도착하면 연락하겠습니다','2024-06-10','2024-06-11');

INSERT into orders VALUES(1,1,150000,'01','01','결제완료','2024-05-29');
INSERT into orders VALUES(2,2,150000,'02','02','결제완료','2024-06-01');
INSERT into orders VALUES(3,3,300000,'03','03','결제완료','2024-06-05');
INSERT into orders VALUES(4,4,400000,'04','04','결제완료','2024-06-10');
INSERT into orders VALUES(5,5,150000,'05','05','결제완료','2024-06-01');
INSERT into orders VALUES(6,6,300000,'06','06','결제완료','2024-06-05');
INSERT into orders VALUES(7,7,300000,'07','07','결제완료','2024-06-10');
INSERT into orders VALUES(8,8,150000,'08','08','결제완료','2024-06-01');
INSERT into orders VALUES(9,9,300000,'09','09','결제완료','2024-06-05');
INSERT into orders VALUES(10,10,300000,'10','10','결제완료','2024-06-10');
INSERT into orders VALUES(11,11,150000,'11','11','결제완료','2024-06-01');
INSERT into orders VALUES(12,12,300000,'12','12','결제완료','2024-06-05');
INSERT into orders VALUES(13,13,300000,'13','13','결제완료','2024-06-10');

INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(1,1,'긴급공지입니다','7월 1일 14시 점검합니다','중요',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(2,1,'환불 공지','환불 필요시 02-1234-5678로 전화문의 바랍니다','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(3,1,'회원탈퇴 공지','회원탈퇴후 재가입은 1주일후에 가입이 가능합니다','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(4,1,'5월 서울 이벤트공지','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 / 7257\n경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150  \n경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(5,1,'5월 부산 이벤트공지','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 / 7257\n 경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150\n 경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(6,1,'5월 제주 이벤트공지','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 / 7257\n 경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150\n 경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(7,1,'5월 경기/인천 이벤트공지','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 / 7257\n 경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150\n 경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(8,1,'5월 강원 이벤트공지','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 /7257\n 경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150\n 경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(9,1,'5월 경상 이벤트공지','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 / 7257\n 경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150\n 경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);
INSERT into notice (noticeId,  memberId, noticeSubject ,noticeContent, noticeType, noticeDate, noticeViews)
values(10,1,'5월 전라/충청 이벤트공지 ','경품) 도드람 3인 바비큐 세트 김*민 / 5260 김*민 / 1905 원*희 / 7257\n 경품) 구명조끼 2매 강*택 / 5486 정*윤 / 9003 안*성 / 9611 도*희 / 7962 강*란 / 3508
고*진 / 1140 김*진 / 3741 김*연 / 6188 임*석 / 4122 김*찬 / 6150\n 경품) 츄러스 이용권 1매 이*영 / 8881 백*희 / 4741 노*석 / 1413 손*영 / 4624 박*유 / 0764 최*신 / 1973 한*진 / 8783 이*희 / 5921 전*미 / 1995 안*민 / 8994','공지',sysdate(),0);

INSERT into review VALUES(1,2,1,1,1,0,5,'글래드 강남 코엑스센터 처음 이용후기','처음으로 리뷰쓰는데 정말 이곳 강추드립니다. 아내랑 또 오고싶은곳이네요!!','noImage.jpg','/reviewImg/noImage.jpg','리뷰완료','2024-06-12');
INSERT into review VALUES(2,3,1,2,1,0,4,'시설 대박!','실내내부 엄청 깨끗하네요 다음에 또 와야겠어요!!','02_리뷰.jpg','/reviewImg/02_리뷰.jpg','리뷰완료','2024-06-13');
INSERT into review VALUES(3,3,1,3,2,0,3,'강남에서 항상오는곳인데 강추!','여자친구랑 왔는데 분위가 진짜좋고 밤 풍경도 이쁩니다!!','03_리뷰.jpg','/reviewImg/03_리뷰.jpg','리뷰완료','2024-06-14');
INSERT into review VALUES(4,4,2,5,4,0,4,'에이든 바이 베스트웨스턴 청담후기','와 너무 깨끗하네요ㅎㅎ 다음에 꼭다시와야지','04_리뷰.jpg','/reviewImg/04_리뷰.jpg','리뷰완료','2024-06-15');
INSERT into review VALUES(5,4,2,6,5,0,1,'별점1점 너무하네요 진짜','리뷰를 안쓸수가없네요 진짜 내부는 깨끗한데... 담배냄새가 너무 심해요.. 다신안올듯','05_리뷰.jpg','/reviewImg/05_리뷰.jpg','리뷰완료','2024-06-16');
INSERT into review VALUES(6,5,3,8,6,0,4,'서초 숙소중에 1등인듯','제가 정말 화장실이 중요한데 이곳은 너무 깨끗해서 놀랬음... 사장님대박!!','06_리뷰.jpg','/reviewImg/06_리뷰.jpg','리뷰완료','2024-06-16');
INSERT into review VALUES(7,5,3,9,7,0,5,'또이용한 후기','이곳은 남자친구랑 항상오는곳인데 항상 좋네요 잘 놀다갑니다!!','07_리뷰.jpg','/reviewImg/07_리뷰.jpg','리뷰완료','2024-06-17');
INSERT into review VALUES(8,6,4,11,8,0,5,'파크 하비오호텔후기','또 올게요 담배냄새도 안나고 좋아요','08_리뷰.jpg','/reviewImg/08_리뷰.jpg','리뷰완료','2024-06-17');
INSERT into review VALUES(9,6,4,12,9,0,3,'음식사진 ㅎㅎ 정말맛돌이','리뷰를 안쓸수가없네요 조식도 진짜 꿀맛!!','09_리뷰.jpg','/reviewImg/09_리뷰.jpg','리뷰완료','2024-06-18');
INSERT into review VALUES(10,6,4,13,9,0,1,'진짜 개별루...비추','다시안올거같네요 이곳 더럽고 냄새도 심해요.. 조식도 맛없고.. 비추합니다','noImage.jpg','/reviewImg/noImage.jpg','리뷰완료','2024-06-18');

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




