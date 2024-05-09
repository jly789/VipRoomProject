package vip.com.accommodation.controller.district;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class DistrictController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;









}
