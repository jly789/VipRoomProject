package vip.com.accommodation.service.accommodationImg;

import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;
import vip.com.accommodation.dto.city.CityDto;

import java.util.List;

public interface AccommodationImgService {



    public void accommodationImgInsert(AccommodationImgInsertDto accommodationImgInsertDto, List<MultipartFile> file)throws Exception;


}
