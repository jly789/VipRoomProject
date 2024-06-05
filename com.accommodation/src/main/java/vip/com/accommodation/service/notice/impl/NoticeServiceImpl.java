package vip.com.accommodation.service.notice.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.notice.NoticeDeleteDto;
import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;
import vip.com.accommodation.dto.notice.NoticeUpdateDto;
import vip.com.accommodation.mapper.notice.NoticeMapper;
import vip.com.accommodation.service.notice.NoticeService;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public void noticeInsert(NoticeInsertDto noticeInsertDto) {
        noticeMapper.noticeInsert(noticeInsertDto);
    }

    @Override
    public void noticeUpdate(NoticeUpdateDto noticeUpdateDto) {
        noticeMapper.noticeUpdate(noticeUpdateDto);
    }

    @Override
    public void noticeViewsUpdate(int noticeId) {
        noticeMapper.noticeViewsUpdate(noticeId);
    }

    @Override
    public void noticeDelete(NoticeDeleteDto noticeDeleteDto) {
        noticeMapper.noticeDelete(noticeDeleteDto);
    }

    @Override
    public List<NoticeListDto> noticeList() {
        return noticeMapper.noticeList();
    }

    @Override
    public List<NoticeListDto> noticeDetailList(int noticeId) {
        return noticeMapper.noticeDetailList(noticeId);
    }
}
