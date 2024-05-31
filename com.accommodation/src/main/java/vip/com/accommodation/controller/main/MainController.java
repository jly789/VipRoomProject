package vip.com.accommodation.controller.main;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.member.MemberDto;
import vip.com.accommodation.service.accommodation.AccommodationService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    @Resource
    private AccommodationService accommodationService;

    @GetMapping("/")
    public String main(Model model)throws Exception{

        List<AccommodationMainListDto> accommodationMainList = accommodationService.accommodationMainList();
        model.addAttribute("accommodationMainList",accommodationMainList);

        return "main/main";
    }

    @PostMapping("/distinctSearch")
    public String distinctSearch(AccommodationMainListDto accommodationMainListDto, Model model)throws Exception{



        if(accommodationMainListDto.getAccommodationDistrict().equals("지역선택")|| accommodationMainListDto.getAccommodationCategory().equals("숙소선택")){


            List<AccommodationMainListDto> accommodationMainList= accommodationService.accommodationMainList();

            model.addAttribute("accommodationMainList",accommodationMainList);


            return "accommodation/accommodationMain";

        }

        List<AccommodationMainListDto> distinctSearchList= accommodationService.distinctSearchList(accommodationMainListDto);

        model.addAttribute("accommodationMainList",distinctSearchList);


        return "accommodation/accommodationMain";
    }



    @GetMapping("/CategorySearch")
    public String CategorySearch(AccommodationMainListDto accommodationMainListDto, Model model)throws Exception{

        List<AccommodationMainListDto> categorySearchList= accommodationService.accommodationCategorySearchList(accommodationMainListDto);

        model.addAttribute("accommodationMainList",categorySearchList);


        return "accommodation/accommodationMain";
    }


}
