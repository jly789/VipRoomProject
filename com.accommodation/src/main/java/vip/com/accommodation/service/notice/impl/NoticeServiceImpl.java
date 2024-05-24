package vip.com.accommodation.service.notice.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.mapper.notice.NoticeMapper;
import vip.com.accommodation.service.district.DistrictService;
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
    public List<NoticeListDto> noticeList() {
        return noticeMapper.noticeList();
    }

    @Override
    public List<NoticeListDto> noticeDetailList(int noticeId) {
        return noticeMapper.noticeDetailList(noticeId);
    }
}
