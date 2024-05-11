package vip.com.accommodation.mapper.alert;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;

@Mapper
public interface AlertMapper {

    public int maxNum();

    public void accommodationImgInsert(AccommodationImgInsertDto accommodationImgInsertDto);

}
