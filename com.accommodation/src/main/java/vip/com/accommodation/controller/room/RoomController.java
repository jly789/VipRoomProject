package vip.com.accommodation.controller.room;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.dto.roomImg.RoomImgInsertDto;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.alert.AlertService;
import vip.com.accommodation.service.member.MemberService;
import vip.com.accommodation.service.room.RoomService;
import vip.com.accommodation.service.roomImg.RoomImgService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class RoomController {



    @Resource
    private MemberService memberService;

    @Resource
    private AccommodationService accommodationService;

    @Resource
    private RoomService roomService;

    @Resource
    private RoomImgService roomImgService;

    @Resource
    private AlertService alertService;


    @GetMapping("/room")
    public String room(Model model){

       List<AccommodationFindDto> accommodationFindList= accommodationService.accommodationFindList();

        model.addAttribute("accommodationFindList",accommodationFindList);


        return "room/register";
    }


    @PostMapping("/roomInsert")
    public String roomInsert(@Valid @ModelAttribute("roomInsertDto") RoomInsertDto roomInsertDto, RoomImgInsertDto roomImgInsertDto,
                             BindingResult bindingResult, Model model,
                             List<MultipartFile>file,
                             @RequestParam("accommodationId")int accommodationId, HttpServletResponse response)throws Exception{


        for (int i = 0; i < file.size(); i++) { //이미지 파일에 null값있을시 다시입력
            if (file.get(i).getOriginalFilename().isEmpty()) {

                alertService.roomImgAlertMessage(response);

                model.addAttribute("roomInsertDto",roomInsertDto);
                return "room/register";

            }
        }

        int roodId = 0;
        roodId = roomService.maxNum()+1; //객실등록하고 그 등록한 roomId 검색
        roomImgInsertDto.setRoomId(roodId); //검색한 roomId를 객실이미지의 roomId 값에넣음


        if(bindingResult.hasFieldErrors()){

            List<AccommodationFindDto> accommodationFindList= accommodationService.accommodationFindList();

            model.addAttribute("accommodationFindList",accommodationFindList);

            model.addAttribute("roomInsertDto",roomInsertDto);


            return "room/register";

        }

        //등록서비스
        roomService.roomInsert(roomInsertDto); //객실 등록
        roomImgService.roomImgInsert(roomImgInsertDto,file); //객실이미지 등록


        return "redirect:/";
    }





}
