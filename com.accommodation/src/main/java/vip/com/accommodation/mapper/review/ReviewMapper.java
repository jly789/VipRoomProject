package vip.com.accommodation.mapper.review;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.dto.review.ReviewDeleteDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.dto.review.ReviewListDto;
import vip.com.accommodation.dto.review.ReviewUpdateDto;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public int maxNum();

    public void insertReviewData(ReviewInsertDto reviewInsertDto) throws Exception;

    public void insertReviewNotImage(ReviewInsertDto reviewInsertDto) throws Exception;

    public List<ReviewListDto> reviewList();

    public List<ReviewListDto> reviewDetailList(int reviewId);

    public void reviewUpdate(ReviewUpdateDto reviewUpdateDto);
    public void reviewUpdateNoImg(ReviewUpdateDto reviewUpdateDto)throws Exception;
    public void reviewDelete(ReviewDeleteDto reviewDeleteDto);

    public Integer accommodationReviewGrade(int accommodationId);
}
