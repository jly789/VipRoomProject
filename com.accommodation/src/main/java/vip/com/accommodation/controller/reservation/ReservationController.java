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

        System.out.println(roomId);
        System.out.println(accommodationId);


        List<AccommodationMainListDto> accommodationDetailList= accommodationService.accommodationDetailList(accommodationId);
        List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(accommodationId);
        List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(roomId,accommodationId);

        model.addAttribute("accommodationDetailList",accommodationDetailList);
        model.addAttribute("roomMainListDto",roomMainListDto);
        model.addAttribute("roomSpecificListDto",roomSpecificListDto);


        return "reservation/register";
    }

    @PostMapping("/reservation")
    public String reservation_ok(Model model, ReservationInsertDto reservationInsertDto){

        // reservationService.reservationInsert(reservationInsertDto);



        return "reservation/reservationPayment";
    }


//    @PostMapping("/reservationPayment")
//    public String reservation_ok(Model model, ReservationInsertDto reservationInsertDto){
//
//       // reservationService.reservationInsert(reservationInsertDto);
//
//
//
//        return "reservation/reservationPayment";
//    }


}
