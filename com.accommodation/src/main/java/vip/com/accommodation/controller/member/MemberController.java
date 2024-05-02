package vip.com.accommodation.controller.member;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class MemberController {


    @Resource
    private MemberService memberService;


    @GetMapping("/login")
    public String login(){

        return "member/login";
    }

    @GetMapping("/register")
    public String register(){

        return "member/register";
    }

    @PostMapping("/register_success")
    public String register_ok(MemberInsertDto memberInsertDto){

        int memberId =0;

        memberId = memberService.maxNum()+1;

        memberService.insertData(memberInsertDto);




        return "redirect:/";
    }





}
