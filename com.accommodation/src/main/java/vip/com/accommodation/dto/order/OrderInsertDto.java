package vip.com.accommodation.dto.order;


import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.PastOrPresent;
import java.time.LocalDate;

@Getter
@Setter
public class OrderInsertDto {


    private int orderId; // 주문번호
    private int reservationId; //(외래키)예약번호
    private int orderPrice; // 주문가격
    private int orderNum;//
    private int impUid; //
    private String orderStatus;  //주문상태 ex)결제완료
    private LocalDate orderDate; //주문날짜






}
