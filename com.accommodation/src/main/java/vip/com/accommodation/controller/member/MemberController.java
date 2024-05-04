package vip.com.accommodation.controller.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import vip.com.accommodation.dto.member.MemberDto;
import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.dto.member.MemberLoginDto;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class MemberController {


    @Resource
    private MemberService memberService;


    @GetMapping("/login")
    public String login(){

        return "member/login";
    }

    @PostMapping("/")
    public String login_ok(MemberLoginDto memberLoginDto,HttpServletResponse response,HttpSession session)throws Exception{


      if(memberService.login(memberLoginDto,response)==1){
          session.setAttribute("userId",memberLoginDto.getUserId());


          return "main/main";

      }
      else


        return "member/login";

    }

    @GetMapping("/logout")
    public String logOut(HttpSession session){

        session.removeAttribute("userId");


        return "main/main";
    }

    @GetMapping("/register")
    public String register(){

        return "member/register";
    }

    @PostMapping("/register_success")
    public String register_ok(@Valid @ModelAttribute("memberInsertDto") MemberInsertDto memberInsertDto,
                              BindingResult bindingResult,Model model,
                              HttpServletResponse response)throws Exception{

        if(bindingResult.hasFieldErrors()){

            model.addAttribute("memberInsertDto",memberInsertDto);


            return "member/register";

        }

        if(memberService.idCheck(memberInsertDto.getUserId())==0){


        }


        if(memberService.idCheck(memberInsertDto.getUserId())==1) {


            int memberId = 0;

            memberId = memberService.maxNum() + 1;

            memberService.insertData(memberInsertDto, response);

            return "member/login";
        }

        return "member/login";
    }





}
