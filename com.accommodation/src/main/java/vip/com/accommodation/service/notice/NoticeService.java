package vip.com.accommodation.service.notice;

import vip.com.accommodation.dto.notice.NoticeDeleteDto;
import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;
import vip.com.accommodation.dto.notice.NoticeUpdateDto;

import java.util.List;

public interface NoticeService {


    public void noticeInsert(NoticeInsertDto noticeInsertDto); //공지등록

    public void noticeUpdate(NoticeUpdateDto noticeUpdateDto); //공지수정

    public void noticeViewsUpdate(int noticeId); //공지조회시 조회수증가

    public void noticeDelete(NoticeDeleteDto noticeDeleteDto); //공지삭제

    public List<NoticeListDto> noticeList(); //공지리스트

    public List<NoticeListDto> noticeDetailList(int noticeId); //공지번호를통한 공지상세리스트
}
