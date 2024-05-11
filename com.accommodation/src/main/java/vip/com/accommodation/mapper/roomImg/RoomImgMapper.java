package vip.com.accommodation.mapper.roomImg;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;
import vip.com.accommodation.dto.roomImg.RoomImgInsertDto;

@Mapper
public interface RoomImgMapper {

    public int maxNum();

    public void roomImgInsert(RoomImgInsertDto roomImgInsertDto);


}
