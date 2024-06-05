package vip.com.accommodation.mapper.roomImg;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.roomImg.RoomImgInsertDto;

@Mapper
public interface RoomImgMapper {

    public int maxNum(); //가장높은 객실이미지번호

    public void roomImgInsert(RoomImgInsertDto roomImgInsertDto); //객실이미지등록


}
