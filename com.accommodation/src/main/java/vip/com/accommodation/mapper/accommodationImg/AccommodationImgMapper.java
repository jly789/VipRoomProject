package vip.com.accommodation.mapper.accommodationImg;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;

@Mapper
public interface AccommodationImgMapper {

    public int maxNum(); //가장높은 번호구하기

    public void accommodationImgInsert(AccommodationImgInsertDto accommodationImgInsertDto); //숙소이미지등록

}
