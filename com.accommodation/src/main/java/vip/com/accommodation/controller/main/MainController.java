package vip.com.accommodation.controller.main;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import vip.com.accommodation.dto.member.MemberDto;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@Controller
@RequiredArgsConstructor
public class MainController {

    @GetMapping("/")
    public String main(HttpSession session)throws Exception{

        session.removeAttribute("userId");

        return "main/main";
    }

    @PostMapping("/")
    public String login_ok(HttpSession session, MemberDto memberDto)throws Exception{

        session.setAttribute("userId",memberDto.getUserId());



        System.out.println(memberDto.getUserId());
        System.out.println(memberDto.getPwd());





        return "main/main";
    }

}
