package vip.com.accommodation.service.notice;

import vip.com.accommodation.dto.notice.NoticeDeleteDto;
import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;
import vip.com.accommodation.dto.notice.NoticeUpdateDto;

import java.util.List;

public interface NoticeService {

    public void noticeInsert(NoticeInsertDto noticeInsertDto);

    public void noticeUpdate(NoticeUpdateDto noticeUpdateDto);

    public void noticeDelete(NoticeDeleteDto noticeDeleteDto);

    public List<NoticeListDto> noticeList();

    public List<NoticeListDto> noticeDetailList(int noticeId);
}
