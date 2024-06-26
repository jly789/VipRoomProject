package vip.com.accommodation.controller.reservation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.order.OrderInsertDto;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.review.ReviewListDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.alert.AlertService;
import vip.com.accommodation.service.order.OrderService;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.review.ReviewService;
import vip.com.accommodation.service.room.RoomService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReservationController {




    @Resource
    private AccommodationService accommodationService;

    @Resource
    private AlertService alertService;

    @Resource
    private RoomService roomService;

    @Resource
    ReservationService reservationService;

    @Resource
    OrderService orderService;

    @Resource
    ReviewService reviewService;


    @GetMapping("/myReservation") //나의예약리스트페이지
    public String myReservation(HttpSession session,Model model){

        int memberId = (int)session.getAttribute("memberId");
        String userId = (String) session.getAttribute("userId");

        List<ReservationListDto> myReservationList = reservationService.myReservationList(memberId);

        model.addAttribute("userId",userId);
        model.addAttribute("myReservationList",myReservationList);



        return "reservation/myReservationMain";

    }



    @GetMapping("/reservation") //예약페이지
    public String reservation(HttpSession session,Model model,@RequestParam("roomId")int roomId,@RequestParam("accommodationId")int accommodationId){

        String userId = (String) session.getAttribute("userId");

        Integer accommodationRoomReviewGrade = reviewService.accommodationRoomReviewGrade(accommodationId,roomId);
        List<ReviewListDto> roomReviewImg = reviewService.roomReviewImg(accommodationId,roomId);

        Integer roomReviewTotal = reviewService.roomReviewTotal(accommodationId,roomId);


        if(accommodationRoomReviewGrade==null && roomReviewImg==null &&roomReviewTotal==null){

            List<AccommodationMainListDto> accommodationDetailList = accommodationService.accommodationDetailList(accommodationId);
            List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(accommodationId);
            List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(roomId, accommodationId);

            model.addAttribute("userId", userId);
            model.addAttribute("accommodationDetailList", accommodationDetailList);
            model.addAttribute("roomMainListDto", roomMainListDto);
            model.addAttribute("roomSpecificListDto", roomSpecificListDto);
            return "reservation/register";
        }

        if(accommodationRoomReviewGrade!=null || roomReviewImg!=null || roomReviewTotal!=null) {

            List<AccommodationMainListDto> accommodationDetailList = accommodationService.accommodationDetailList(accommodationId);
            List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(accommodationId);
            List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(roomId, accommodationId);

            model.addAttribute("userId", userId);
            model.addAttribute("accommodationDetailList", accommodationDetailList);
            model.addAttribute("roomMainListDto", roomMainListDto);
            model.addAttribute("roomSpecificListDto", roomSpecificListDto);
            model.addAttribute("accommodationRoomReviewGrade", accommodationRoomReviewGrade);
            model.addAttribute("roomReviewImg", roomReviewImg);
            model.addAttribute("roomReviewTotal", roomReviewTotal);


            return "reservation/register";

        }
        return "reservation/register";
    }

    @PostMapping("/reservation") //예약성공
    public String reservation_ok(Model model, ReservationFindDto reservationFindDto, HttpSession session, HttpServletResponse response)throws Exception{

            String msg;
            int memberId = (int)session.getAttribute("memberId");

        Integer accommodationRoomReviewGrade = reviewService.accommodationRoomReviewGrade(reservationFindDto.getAccommodationId(),reservationFindDto.getRoomId());
        List<ReviewListDto> roomReviewImg = reviewService.roomReviewImg(reservationFindDto.getAccommodationId(),reservationFindDto.getRoomId());

        Integer roomReviewTotal = reviewService.roomReviewTotal(reservationFindDto.getAccommodationId(),reservationFindDto.getRoomId());



           if(reservationService.reservationSearch(reservationFindDto)==0){

               alertService.reservationAlertMessage(response);

               return "reservation/register";
           }


        if(accommodationRoomReviewGrade==null && roomReviewImg==null &&roomReviewTotal==null) {

            List<AccommodationMainListDto> accommodationDetailList= accommodationService.accommodationDetailList(reservationFindDto.getAccommodationId());
            List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(reservationFindDto.getAccommodationId());
            List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(reservationFindDto.getRoomId(),reservationFindDto.getAccommodationId());

            model.addAttribute("memberId",memberId);
            model.addAttribute("accommodationDetailList",accommodationDetailList);
            model.addAttribute("roomMainListDto",roomMainListDto);
            model.addAttribute("roomSpecificListDto",roomSpecificListDto);
            model.addAttribute("reservationFindDto",reservationFindDto);

            return "reservation/reservationPayment";
        }

        if(accommodationRoomReviewGrade!=null || roomReviewImg!=null || roomReviewTotal!=null) {
            List<AccommodationMainListDto> accommodationDetailList= accommodationService.accommodationDetailList(reservationFindDto.getAccommodationId());
            List<RoomMainListDto> roomMainListDto = roomService.roomDetailList(reservationFindDto.getAccommodationId());
            List<RoomSpecificListDto> roomSpecificListDto = roomService.roomSpecificListDto(reservationFindDto.getRoomId(),reservationFindDto.getAccommodationId());

            model.addAttribute("memberId",memberId);
            model.addAttribute("accommodationDetailList",accommodationDetailList);
            model.addAttribute("roomMainListDto",roomMainListDto);
            model.addAttribute("roomSpecificListDto",roomSpecificListDto);
            model.addAttribute("reservationFindDto",reservationFindDto);
            model.addAttribute("accommodationRoomReviewGrade", accommodationRoomReviewGrade);
            model.addAttribute("roomReviewImg", roomReviewImg);
            model.addAttribute("roomReviewTotal", roomReviewTotal);

            return "reservation/reservationPayment";
        }
        return "reservation/reservationPayment";
        }


    @ResponseBody
    @PostMapping("/payment") //결제성공시 예약등록및 주문등록
    public String reservationOrder(OrderInsertDto orderInsertDto,ReservationInsertDto reservationInsertDto)throws Exception {





             reservationService.reservationInsert(reservationInsertDto);

            int reservationId =  reservationService.maxNum();

            orderInsertDto.setReservationId(reservationId);

            orderService.orderInsert(orderInsertDto);







        return "reservation/reservationPayment";


    }






//    }


}
