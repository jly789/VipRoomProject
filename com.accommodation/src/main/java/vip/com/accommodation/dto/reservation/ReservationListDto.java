package vip.com.accommodation.dto.reservation;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;

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
    private LocalDate reservationCheckIn; //체크인
    private LocalDate reservationCheckOut; //체크아웃

}
