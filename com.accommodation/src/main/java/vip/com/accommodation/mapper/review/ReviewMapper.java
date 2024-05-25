package vip.com.accommodation.mapper.review;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public int maxNum();

    public void insertReviewData(ReviewInsertDto reviewInsertDto) throws Exception;

    public void insertReviewNotImage(ReviewInsertDto reviewInsertDto) throws Exception;

}
