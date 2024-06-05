package vip.com.accommodation.dto.reservation;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;


@Getter
@Setter
public class ReservationListDto {

    private int reservationId; // 예약번호
    private int memberId; // (외래키)회원번호
    private int accommodationId;// (외래키)숙소번호
    private int roomId; // (외래키)객실번호
    private int reservationHeadCount; //예약인원수
    private String reservationStatus;  // 객실상태 ex)예약가능, 예약불가
    private String reservationDetails;  //예약내용
    private String reservationCheckIn; //체크인
    private String reservationCheckOut; //체크아웃

    //숙소
    private String accommodationName; //숙소이름


    //객실
    private int roomPrice; //객실 1박당 가격
    private int  standardNumbers; //기준인원
    private int maximumCapacity; //최대 숙박인원
    private int roomNumbers;//객실수
    private String roomName; //객실이름
    private String roomDescription; //객실소개

    //ReviewListDto

    private int reviewId; //리뷰번호
    private int views; //리뷰조회수
    private int grade; //평점
    private String reviewSubject; //리뷰제목
    private String reviewContent; //리뷰내용
    private String reviewFileName; //리뷰이미지
    private String reviewFilePath; //리뷰이미지경로
    private String reviewState; //리뷰상태
    private LocalDate reviewDate; //리뷰등록일

}
