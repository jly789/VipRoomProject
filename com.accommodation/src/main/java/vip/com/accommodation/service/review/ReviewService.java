package vip.com.accommodation.service.review;

import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.review.ReviewDeleteDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.dto.review.ReviewListDto;
import vip.com.accommodation.dto.review.ReviewUpdateDto;

import java.util.List;

public interface ReviewService {

    public int maxNum();
    public void insertReviewData(ReviewInsertDto reviewInsertDto, MultipartFile file) throws Exception;

    public void insertReviewNotImage(ReviewInsertDto reviewInsertDto,MultipartFile file) throws Exception;

    public List<ReviewListDto> reviewList();

    public List<ReviewListDto> reviewDetailList(int reviewId);


    public void reviewUpdate(ReviewUpdateDto reviewUpdateDto,MultipartFile file)throws Exception;
    public void reviewUpdateNoImg(ReviewUpdateDto reviewUpdateDto)throws Exception;

    public void reviewDelete(ReviewDeleteDto reviewDeleteDto);

    public Integer accommodationReviewGrade(int accommodationId); //숙소별 평균 리뷰점수
}


