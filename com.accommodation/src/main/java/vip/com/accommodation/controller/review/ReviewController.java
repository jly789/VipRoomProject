package vip.com.accommodation.controller.review;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.review.ReviewDeleteDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.dto.review.ReviewListDto;
import vip.com.accommodation.dto.review.ReviewUpdateDto;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.review.ReviewService;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewController {




    @Resource
    private ReservationService reservationService;

    @Resource
    private ReviewService reviewService;


    @GetMapping("/review") //리뷰페이지
    public String review(ReviewListDto reviewListDto,Model model,HttpSession session){

        String userId = (String)session.getAttribute("userId");

        List<ReviewListDto> reviewList = reviewService.reviewList();

        model.addAttribute("reviewList",reviewList);


        return "review/reviewMain";

    }

    @GetMapping("/review/{reviewId}") //해당리뷰의 상세리스트
    public String review(@PathVariable("reviewId")int reviewId, ReviewListDto reviewListDto, Model model, HttpSession session){



        String userId = (String)session.getAttribute("userId");


        if(userId==null){

            List<ReviewListDto> reviewDetailList = reviewService.reviewDetailList(reviewId);
            model.addAttribute("reviewDetailList",reviewDetailList);





            return "review/reviewDetail";

        }
        int memberId = (int)session.getAttribute("memberId");

        List<ReviewListDto> reviewDetailList = reviewService.reviewDetailList(reviewId);

        for(int i =0; i<reviewDetailList.size();i++){
            if(reviewDetailList.get(i).getMemberId()==memberId){
                model.addAttribute("reviewDetailList",reviewDetailList);
                model.addAttribute("userId",userId);

                return "review/reviewDetailUpdate";

            }
        }


        model.addAttribute("reviewDetailList",reviewDetailList);


        return "review/reviewDetail";

    }



    @GetMapping("/reviewInsert") //리뷰등록
    public String reviewInsert(@ModelAttribute("reviewInsertDto") ReviewInsertDto reviewInsertDto, Model model){




        return "review/register";

    }

    @PostMapping("/reviewInsert") //리뷰등록성공
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




    @PostMapping("/reviewUpdate") //리뷰수정
    public String reviewUpdate(MultipartFile file, ReviewUpdateDto reviewUpdateDto, Model model, HttpSession session)throws Exception{


        if(file.isEmpty()){

            reviewService.reviewUpdateNoImg(reviewUpdateDto);
            return "redirect:/review";
        }


        reviewService.reviewUpdate(reviewUpdateDto,file);

        return "redirect:/review";

    }

    @PostMapping("/reviewDelete") //리뷰삭제
    public String reviewDelete(ReviewDeleteDto reviewDeleteDto, Model model, HttpSession session){


        reviewService.reviewDelete(reviewDeleteDto);

        return "redirect:/review";

    }

}
