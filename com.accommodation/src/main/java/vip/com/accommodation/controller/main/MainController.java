package vip.com.accommodation.controller.main;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.member.MemberDto;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@Controller
@RequiredArgsConstructor
public class MainController {

    @GetMapping("/")
    public String main(HttpSession session)throws Exception{



        return "main/main";
    }

    @PostMapping("/distinctSearch")
    public String distinctSearch(AccommodationMainListDto accommodationMainListDto)throws Exception{




        return "accommodation/accommodationMain";
    }






}
