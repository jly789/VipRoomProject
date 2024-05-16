package vip.com.accommodation.dto.reservation;


import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.PastOrPresent;
import java.time.LocalDate;

@Getter
@Setter
public class ReservationFindDto {





    private int roomId; // (외래키)객실번호
    private int accommodationId;// (외래키)숙소번호
    private String reservationCheckIn; //체크인
    private String reservationCheckOut; //체크아웃
}
