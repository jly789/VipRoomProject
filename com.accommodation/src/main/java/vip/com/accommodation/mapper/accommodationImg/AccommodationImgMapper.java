package vip.com.accommodation.mapper.accommodationImg;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;

@Mapper
public interface AccommodationImgMapper {

    public int maxNum();

    public void accommodationImgInsert(AccommodationImgInsertDto accommodationImgInsertDto);

}
