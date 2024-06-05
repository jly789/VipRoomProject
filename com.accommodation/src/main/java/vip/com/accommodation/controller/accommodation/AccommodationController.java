package vip.com.accommodation.controller.accommodation;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.accommodation.Pagination;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;
import vip.com.accommodation.dto.city.CityDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.accommodationImg.AccommodationImgService;
import vip.com.accommodation.service.alert.AlertService;
import vip.com.accommodation.service.city.CityService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AccommodationController {



    @Resource
    private AccommodationService accommodationService;

    @Resource
    private AccommodationImgService accommodationImgService;

    @Resource
    private CityService cityService;

    @Resource
    private AlertService alertService;



    @GetMapping("/accommodationMain") //숙소메인 리스트

    public String accommodationMain(Model model,  @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                                    @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                                    @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception{


        int listCnt = accommodationService.testTableCount();



        Pagination pagination = new Pagination(currentPage, 6, pageSize);
        pagination.setTotalRecordCount(listCnt);


        List<AccommodationMainListDto> accommodationMainList= accommodationService.accommodationMainList(pagination);




        model.addAttribute("pagination",pagination);
        model.addAttribute("accommodationMainList",accommodationMainList);


        return "accommodation/accommodationMain";
    }


    @PostMapping("/accommodationMainSearchCity") //숙소 지역구,도시에 해당되는 숙소찾기

    public String accommodationMainSearchCity(@ModelAttribute("accommodationMainListDto")AccommodationMainListDto accommodationMainListDto,Model model,
                                              @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                                              @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                                              @RequestParam(value = "pageSize", required = false, defaultValue = "200") int pageSize)throws Exception{


        System.out.println(accommodationMainListDto.getAccommodationDistrict());



        if(accommodationMainListDto.getAccommodationDistrict().equals("전체")){

            int listCnt = accommodationService.testTableCount();
            Pagination pagination = new Pagination(currentPage, 6, pageSize);
            pagination.setTotalRecordCount(listCnt);

            pagination.setCntPerPage(listCnt);


            List<AccommodationMainListDto> accommodationMainList= accommodationService.accommodationMainList(pagination);

            model.addAttribute("accommodationMainList",accommodationMainList);

            model.addAttribute("pagination",pagination);
            return "accommodation/accommodationMain";
        }




        int listCnt = accommodationService.accommodationMainListSearchCityTableCount(accommodationMainListDto.getAccommodationDistrict(),accommodationMainListDto.getAccommodationCity());
        Pagination pagination = new Pagination(currentPage, 100, pageSize);
        pagination.setTotalRecordCount(listCnt);

        pagination.setAccommodationDistrict(accommodationMainListDto.getAccommodationDistrict());
        pagination.setAccommodationCity(accommodationMainListDto.getAccommodationCity());

        List<AccommodationMainListDto> accommodationMainList= accommodationService.accommodationMainListSearchCity(pagination);

        model.addAttribute("pagination",pagination);
        model.addAttribute("accommodationMainList",accommodationMainList);


        return "accommodation/accommodationMain";
    }



    @GetMapping("/accommodation") //숙소등록
    public String accommodation() {


        return "accommodation/register";
    }


    @PostMapping("/accommodation") //숙소등록
    public String accommodation(@Valid @ModelAttribute("accommodationInsertDto") AccommodationInsertDto accommodationInsertDto,
                                AccommodationImgInsertDto accommodationImgInsertDto
            , BindingResult bindingResult, Model model, List<MultipartFile> file, HttpServletResponse response) throws Exception {


        for (int i = 0; i < file.size(); i++) { //이미지 파일에 null값있을시 다시입력
            if (file.get(i).getOriginalFilename().isEmpty()) {

               alertService.accommodationImgAlertMessage(response);

                model.addAttribute("accommodationInsertDto", accommodationInsertDto);
                return "accommodation/register";

            }
        }


        int accommodationId = 0;

        accommodationId = accommodationService.maxNum() + 1;


        accommodationImgInsertDto.setAccommodationId(accommodationId);


        if (bindingResult.hasFieldErrors()) {

            model.addAttribute("accommodationInsertDto", accommodationInsertDto);
            return "accommodation/register";

        }


        accommodationService.accommodationInsert(accommodationInsertDto);

        accommodationImgService.accommodationImgInsert(accommodationImgInsertDto, file);


        return "redirect:/";
    }


    @ResponseBody
    @PostMapping("/accommodationDistrict") // 해당 지역구의 도시찾기
    public List<CityDto> idCheck(@RequestParam("accommodationDistrict") String accommodationDistrict) {

        List<CityDto> cityDtoList = cityService.citySearch(accommodationDistrict);

        return cityDtoList;
    }





}
