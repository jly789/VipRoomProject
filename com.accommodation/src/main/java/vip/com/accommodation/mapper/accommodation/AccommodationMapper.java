package vip.com.accommodation.mapper.accommodation;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;

@Mapper
public interface AccommodationMapper {

    public int maxNum();
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto);


}
