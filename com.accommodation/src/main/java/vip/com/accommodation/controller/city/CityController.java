package vip.com.accommodation.controller.city;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;

@Controller
@RequiredArgsConstructor
public class CityController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;









}
