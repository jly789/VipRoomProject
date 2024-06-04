package vip.com.accommodation.controller.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.accommodation.Pagination;
import vip.com.accommodation.dto.member.*;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.member.MemberService;
import vip.com.accommodation.service.order.OrderService;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.review.ReviewService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MemberController {


    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;

    @Resource
    private ReservationService reservationService;

    @Resource
    private OrderService orderService;

    @Resource
    private ReviewService reviewService;

    @GetMapping("/login")
    public String login(){

        return "member/login";
    }

    @PostMapping("/")
    public String login_ok(MemberLoginDto memberLoginDto,HttpServletResponse response,HttpSession session,Model model,
                           @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                           @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                           @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception{

        int listCnt = accommodationService.testTableCount();
        Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
        pagination.setTotalRecordCount(listCnt);


      if(memberService.login(memberLoginDto,response)==1){
          session.setAttribute("userId",memberLoginDto.getUserId());
          int memberId = memberService.memberIdSearch(memberLoginDto);
          session.setAttribute("memberId",memberId);


          List<AccommodationMainListDto> accommodationMainList = accommodationService.accommodationMainList(pagination);
          model.addAttribute("accommodationMainList",accommodationMainList);
          model.addAttribute("paginationNotice",pagination);


          return "main/main";

      }
      else


        return "member/login";

    }

    @GetMapping("/logOut")
    public String logOut(HttpSession session){

        session.removeAttribute("userId");
        session.removeAttribute("memberId");


        return "redirect:/";
    }

    @GetMapping("/register")
    public String register(){

        return "member/register";
    }


    @ResponseBody
    @PostMapping("/idCheck")
    public int idCheck(String userId){

        int result = memberService.idCheck(userId);

        return result;
    }

    @PostMapping("/register_success")
    public String register_ok(@Valid @ModelAttribute("memberInsertDto") MemberInsertDto memberInsertDto,
                              BindingResult bindingResult,Model model
                             )throws Exception{


        if(bindingResult.hasFieldErrors()){



            model.addAttribute("memberInsertDto",memberInsertDto);

            return "member/register";

        }



        if(memberService.idCheck(memberInsertDto.getUserId())==1) {


            int memberId = 0;

            memberId = memberService.maxNum() + 1;

            memberService.insertData(memberInsertDto);


            return "redirect:/login";
        }

        return "redirect:/login";
    }


    @GetMapping("/idSearch")
    public String idSearch(){


        return "/member/idSearch";
    }

    @PostMapping("/idSearch")
    public String idSearch_ok(@Valid @ModelAttribute("memberSearchDto")MemberSearchDto memberSearchDto
                              ,BindingResult bindingResult,Model model){



        String idSearch = memberService.idSearch(memberSearchDto);

        if(idSearch==null){
            String exists = "해당정보는 없습니다";
            model.addAttribute("exists", exists);
        }

        model.addAttribute("idSearch", idSearch);


        if(bindingResult.hasFieldErrors()){

            model.addAttribute("memberSearchDto",memberSearchDto);


            return "/member/idSearch";
        }


        return "/member/idSearch";



    }


    @GetMapping("/pwdSearch")
    public String pwdSearch(){


        return "/member/pwdSearch";
    }

    @PostMapping("/pwdSearch")
    public String pwdSearch_ok(@Valid @ModelAttribute("memberSearchDto")MemberSearchDto memberSearchDto
            ,BindingResult bindingResult,Model model){




        String pwdSearch = memberService.pwdSearch(memberSearchDto);
        if(pwdSearch==null){
            String exists = "해당정보는 없습니다";
            model.addAttribute("exists", exists);
        }



        model.addAttribute("pwdSearch", pwdSearch);


        if(bindingResult.hasFieldErrors()){

            model.addAttribute("memberSearchDto",memberSearchDto);


            return "/member/pwdSearch";
        }


        return "/member/pwdSearch";



    }

    @GetMapping("/mypage")
    public String mypage(HttpSession session,Model model){

        String userId = (String) session.getAttribute("userId");



       List<MemberFindDto> memberFindDto = memberService.mypage(userId);

       model.addAttribute("memberFindDto",memberFindDto);





        return "/member/mypage";
    }

    @PostMapping("/mypage")
    public String mypage_update(@Valid  @ModelAttribute("memberFindDto")MemberFindDto memberFindDto,

                               BindingResult bindingResult,HttpSession session,Model model)throws Exception {




        if(bindingResult.hasFieldErrors()){


            return "/member/mypageUpdate";

        }



              memberService.mypageUpdate(memberFindDto);


        return "redirect:/mypage";
        }








    @PostMapping("/mypageUpdate")
    public String mypageUpdate(MemberFindDto memberFindDto,HttpSession session,Model model){

        String userId = (String) session.getAttribute("userId");



//        List<MemberFindDto> memberFindDto = memberService.mypage(userId);
//
        model.addAttribute("memberFindDto",memberFindDto);





        return "/member/mypageUpdate";
    }

    @GetMapping("/mypageDelete")
    public String mypageDelete(HttpSession session,Model model){


        return "member/mypageDelete";
    }




    @PostMapping("/mypageDelete")
    public String mypageDelete_ok(MemberDeleteDto memberDeleteDto,MemberLoginDto memberLoginDto,Model model){



        int memberId = memberService.memberIdSearch(memberLoginDto);
        List<ReservationListDto> reservationMemberIdSearch =  reservationService.reservationMemberIdSearch(memberId);

       if( memberService.deleteLoginCheck(memberDeleteDto) ==1){

           String message = "아이디 또는 비밀번호 다시 체크";
           model.addAttribute("message",message);
           return "member/mypageDelete";
           //삭제x
       }

       else

           reviewService.reviewDeleteMemberId(memberId);


            for(int i =0; i<reservationMemberIdSearch.size();i++){

                orderService.orderDelete(reservationMemberIdSearch.get(i).getReservationId());
                reservationService.reservationDeleteReservation(reservationMemberIdSearch.get(i).getReservationId());
            }

        memberService.mypageDelete(memberDeleteDto);



           //orders







           //삭제



        return "redirect:/login";
    }

    @GetMapping("/loginCheck/{reservationId}")
    public String loginCheck(@PathVariable("reservationId")int reservationId,Model model){

        model.addAttribute("reservationId",reservationId);

        return "member/loginCheck";
    }


    @ResponseBody
    @PostMapping("/loginCheck")

    public int loginCheckOk(MemberLoginDto memberLoginDto,@RequestParam("reservationId")int reservationId){

        int loginCheck = memberService.loginCheck(memberLoginDto);


        if(loginCheck==1){

            orderService.orderDelete(reservationId);

            reviewService.reservationReviewDelete(reservationId);

            reservationService.reservationDelete(reservationId);


            return  loginCheck;
        }

        if(loginCheck!=1){
            return  loginCheck;
        }



        return  loginCheck;

    }



}
