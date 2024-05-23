package vip.com.accommodation.mapper.notice;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;

import java.util.List;

@Mapper
public interface NoticeMapper {

    public int maxNum();
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto);




}
