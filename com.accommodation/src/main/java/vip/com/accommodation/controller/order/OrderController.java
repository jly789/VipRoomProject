package vip.com.accommodation.controller.order;


import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.order.OrderInsertDto;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.accommodationImg.AccommodationImgService;
import vip.com.accommodation.service.alert.AlertService;
import vip.com.accommodation.service.city.CityService;
import vip.com.accommodation.service.member.MemberService;
import vip.com.accommodation.service.order.OrderService;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.room.RoomService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
@EnableScheduling
@Controller
@RequiredArgsConstructor
public class OrderController {


    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;

    @Resource
    private AccommodationImgService accommodationImgService;

    @Resource
    private CityService cityService;

    @Resource
    private AlertService alertService;

    @Resource
    private RoomService roomService;

    @Resource
    ReservationService reservationService;

    @Resource
    OrderService orderService;



//    @ResponseBody
//    @PostMapping("/payment")
//    public String reservation_ok(OrderInsertDto orderInsertDto) {
//
//        System.out.println("안녕");
//
//        System.out.println(orderInsertDto.getOrderNum());
//        System.out.println(orderInsertDto.getImpUid());
//        //    System.out.println(orderInsertDto.getOrderPrice());
//
//
////             reservationService.reservationInsert(reservationInsertDto);
////
////            int reservationId =  reservationService.maxNum();
////
////            orderInsertDto.setReservationId(reservationId);
////
////            orderService.orderInsert(orderInsertDto);
//
//
//
//
//
//
//
//        return "main";
//
//
//    }
}
