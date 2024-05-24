package vip.com.accommodation.service.notice;

import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;

import java.util.List;

public interface NoticeService {

    public void noticeInsert(NoticeInsertDto noticeInsertDto);
    public List<NoticeListDto> noticeList();

    public List<NoticeListDto> noticeDetailList(int noticeId);
}
