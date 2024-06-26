package vip.com.accommodation.dto.reservation;


import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.PastOrPresent;
import java.time.LocalDate;

@Getter
@Setter
public class ReservationInsertDto {


    private int reservationId; // 예약번호
    private int memberId; // (외래키)회원번호
    private int accommodationId;// (외래키)숙소번호
    private int roomId; // (외래키)객실번호
    private String reservationStatus;  // 객실상태 ex)예약가능, 예약불가
    private String reservationDetails;  //예약내용
    private String reservationCheckIn; //체크인
    private String reservationCheckOut; //체크아웃
}
