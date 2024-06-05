package vip.com.accommodation.controller.notice;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vip.com.accommodation.dto.notice.NoticeDeleteDto;
import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;
import vip.com.accommodation.dto.notice.NoticeUpdateDto;
import vip.com.accommodation.service.notice.NoticeService;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class NoticeController {



    @Resource
    private NoticeService noticeService;


    @GetMapping("/notice") //공지리스트
    public String notice(HttpSession session, Model model) {

        if (session.getAttribute("memberId") == null) {
            List<NoticeListDto> noticeList = noticeService.noticeList();
            model.addAttribute("noticeList", noticeList);

            return "notice/noticeMain";

        }

        int memberId = (int) session.getAttribute("memberId");
        String userId = (String)session.getAttribute("userId");
        List<NoticeListDto> noticeList = noticeService.noticeList();


        model.addAttribute("memberId", memberId);
        model.addAttribute("userId", userId);
        model.addAttribute("noticeList", noticeList);


        return "notice/noticeMain";
    }

    @GetMapping("/notice/{noticeId}") //공지사항 상세리스트
    public String noticeDetail(@PathVariable("noticeId")int noticeId,Model model,HttpSession session) {


        noticeService.noticeViewsUpdate(noticeId);


        String userId = (String)session.getAttribute("userId");


        if(userId==null){

            List<NoticeListDto> noticeDetailList =noticeService.noticeDetailList(noticeId);

            model.addAttribute("noticeDetailList",noticeDetailList);


            return "notice/noticeDetail";

        }

        int memberId = (int)session.getAttribute("memberId");
        if(memberId==1){
            List<NoticeListDto> noticeDetailList =noticeService.noticeDetailList(noticeId);

            model.addAttribute("noticeDetailList",noticeDetailList);


            return "notice/noticeDetailAdmin";

        }


     List<NoticeListDto> noticeDetailList =noticeService.noticeDetailList(noticeId);

     model.addAttribute("noticeDetailList",noticeDetailList);


        return "notice/noticeDetail";
    }


    @GetMapping("/noticeInsert") //공지등록
    public String noticeInsert(HttpSession session, Model model) {


        int memberId = (int) session.getAttribute("memberId");

        model.addAttribute("memberId", memberId);

        return "notice/register";
    }


    @PostMapping("/noticeInsert") //공지등록성공
    public String noticeInsertOk(NoticeInsertDto noticeInsertDto) {

        noticeService.noticeInsert(noticeInsertDto);


        return "redirect:/notice";
    }

    @PostMapping("/noticeUpdate") //공지수정완료
    public String noticeUpdate(NoticeUpdateDto noticeUpdateDto) {

        noticeService.noticeUpdate(noticeUpdateDto);


        return "redirect:/notice";
    }

    @PostMapping("/noticeDelete") //공지삭제
    public String noticeDelete(NoticeDeleteDto noticeDeleteDto) {

        noticeService.noticeDelete(noticeDeleteDto);


        return "redirect:/notice";
    }




}
