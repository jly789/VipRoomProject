package vip.com.accommodation.controller.notice;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class NoticeController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;



    @GetMapping("/notice")
    public String notice(HttpSession session, Model model){

        if(session.getAttribute("memberId")==null){

            return "notice/noticeMain";

        }

        int memberId = (int)session.getAttribute("memberId");

        model.addAttribute("memberId",memberId);

        return "notice/noticeMain";
    }



    @GetMapping("/noticeAdd")
    public String noticeAdd(HttpSession session, Model model){


        int memberId = (int)session.getAttribute("memberId");

        model.addAttribute("memberId",memberId);

        return "notice/noticeMain";
    }







}
