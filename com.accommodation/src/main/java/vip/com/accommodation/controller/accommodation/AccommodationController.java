package vip.com.accommodation.controller.accommodation;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.city.CityDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.city.CityService;
import vip.com.accommodation.service.member.MemberService;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AccommodationController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;

    @Resource
    private CityService cityService;



    @GetMapping("/accommodation") //숙박등록
    public String accommodation(){




        return "accommodation/register";
    }



    @PostMapping("/accommodation") //숙박등록
    public String accommodation(@Valid @ModelAttribute("accommodationInsertDto")AccommodationInsertDto accommodationInsertDto
    , BindingResult bindingResult, Model model){




        if(bindingResult.hasFieldErrors()){

            System.out.println(accommodationInsertDto.getAccommodationDistrict());

            model.addAttribute("accommodationInsertDto",accommodationInsertDto);
            return "accommodation/register";

        }

        return "redirect:/";
    }


    @ResponseBody
    @PostMapping("/accommodationDistrict")
    public List<CityDto> idCheck(@RequestParam("accommodationDistrict") String accommodationDistrict){

      List<CityDto> cityDtoList =  cityService.citySearch(accommodationDistrict);

        return cityDtoList;
    }





}
