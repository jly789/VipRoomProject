package vip.com.accommodation.controller.review;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.alert.AlertService;
import vip.com.accommodation.service.member.MemberService;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.review.ReviewService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;

    @Resource
    private ReservationService reservationService;

    @Resource
    private ReviewService reviewService;


    @Resource
    private AlertService alertService;




    @GetMapping("/reviewInsert")
    public String reviewInsert(@ModelAttribute("reviewInsertDto") ReviewInsertDto reviewInsertDto, Model model){




        return "review/register";

    }

    @PostMapping("/reviewInsert")
    public String reviewInsert_Ok(HttpSession session, ReviewInsertDto reviewInsertDto, Model model, MultipartFile file)throws Exception{

        if(file.isEmpty()){

            if(reviewInsertDto.getGrade()==0){
                reviewInsertDto.setGrade(3);
            }

            reviewService.insertReviewNotImage(reviewInsertDto,file);



            int memberId = (int)session.getAttribute("memberId");
            String userId = (String) session.getAttribute("userId");

            List<ReservationListDto> myReservationList = reservationService.myReservationList(memberId);

            model.addAttribute("userId",userId);
            model.addAttribute("myReservationList",myReservationList);






            return "reservation/myReservationMain";
        }


        if(reviewInsertDto.getGrade()==0){
            reviewInsertDto.setGrade(3);
        }



        reviewService.insertReviewData(reviewInsertDto,file);

        int memberId = (int)session.getAttribute("memberId");
        String userId = (String) session.getAttribute("userId");

        List<ReservationListDto> myReservationList = reservationService.myReservationList(memberId);

        model.addAttribute("userId",userId);
        model.addAttribute("myReservationList",myReservationList);






        return "reservation/myReservationMain";

    }





}
