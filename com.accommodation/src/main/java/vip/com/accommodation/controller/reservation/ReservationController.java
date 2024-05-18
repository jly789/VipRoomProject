package vip.com.accommodation.controller.reservation;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;
import vip.com.accommodation.dto.city.CityDto;
import vip.com.accommodation.dto.order.OrderInsertDto;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.accommodationImg.AccommodationImgService;
import vip.com.accommodation.service.alert.AlertService;
import vip.com.accommodation.service.city.CityService;
import vip.com.accommodation.service.member.MemberService;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.room.RoomService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReservationController {


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



    @GetMapping("/reservation")
    public String reservation(Model model,@RequestParam("roomId")int roomId,@RequestParam("accommodationId")int accommodationId){



        List<AccommodationMainListDto> accommodationDetailList= accommodationService.accommodationDetailList(accommodationId);
        List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(accommodationId);
        List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(roomId,accommodationId);

        model.addAttribute("accommodationDetailList",accommodationDetailList);
        model.addAttribute("roomMainListDto",roomMainListDto);
        model.addAttribute("roomSpecificListDto",roomSpecificListDto);


        return "reservation/register";
    }

    @PostMapping("/reservation")
    public String reservation_ok(Model model, @ModelAttribute("reservationFindDto") ReservationFindDto reservationFindDto,HttpServletResponse response)throws Exception{

            String msg;


           if(reservationService.reservationSearch(reservationFindDto)==0){

               alertService.reservationAlertMessage(response);

               return "reservation/register";
           }





        List<AccommodationMainListDto> accommodationDetailList= accommodationService.accommodationDetailList(reservationFindDto.getAccommodationId());
        List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(reservationFindDto.getAccommodationId());
        List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(reservationFindDto.getRoomId(),reservationFindDto.getAccommodationId());

        model.addAttribute("accommodationDetailList",accommodationDetailList);
        model.addAttribute("roomMainListDto",roomMainListDto);
        model.addAttribute("roomSpecificListDto",roomSpecificListDto);








            return "reservation/reservationPayment";
        }


    @ResponseBody
    @PostMapping("/payment")
    public String reservationOrder(OrderInsertDto orderInsertDto)throws Exception {

        System.out.println("안녕");

        System.out.println(orderInsertDto.getOrderNum());
        System.out.println(orderInsertDto.getImpUid());
        //    System.out.println(orderInsertDto.getOrderPrice());


//             reservationService.reservationInsert(reservationInsertDto);
//
//            int reservationId =  reservationService.maxNum();
//
//            orderInsertDto.setReservationId(reservationId);
//
//            orderService.orderInsert(orderInsertDto);







        return "reservation/reservationPayment";


    }






//    }


}
