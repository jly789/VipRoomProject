package vip.com.accommodation.mapper.notice;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.notice.NoticeDeleteDto;
import vip.com.accommodation.dto.notice.NoticeInsertDto;
import vip.com.accommodation.dto.notice.NoticeListDto;
import vip.com.accommodation.dto.notice.NoticeUpdateDto;

import java.util.List;

@Mapper
public interface NoticeMapper {

    public int maxNum();
    public void noticeInsert(NoticeInsertDto noticeInsertDto);

    public void noticeUpdate(NoticeUpdateDto noticeUpdateDto);

    public void noticeDelete(NoticeDeleteDto noticeDeleteDto);

    public List<NoticeListDto> noticeList();

    public List<NoticeListDto> noticeDetailList(int noticeId);




}
