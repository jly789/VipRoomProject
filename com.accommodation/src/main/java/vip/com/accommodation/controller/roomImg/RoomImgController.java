package vip.com.accommodation.controller.roomImg;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;

@Controller
@RequiredArgsConstructor
public class RoomImgController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;









}
