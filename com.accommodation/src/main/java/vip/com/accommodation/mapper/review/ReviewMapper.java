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
    public void reviewDelete(ReviewDeleteDto reviewDeleteDto); //reviewId를 통한 리뷰삭제
    public void reservationReviewDelete(int reservationId); //reservationId를 통한 my예약에서 예약취소된 리뷰 삭제



    public Integer accommodationReviewGrade(int accommodationId);


    public Integer accommodationRoomReviewGrade(int accommodationId,int roomId);

    public List<ReviewListDto> accommodationReviewImg(int accommodationId); //숙소 리뷰이미지
    public List<ReviewListDto> roomReviewImg(int accommodationId,int roomId);

    public Integer accommodationReviewTotal(int accommodationId);

    public Integer roomReviewTotal(int accommodationId,int roomId);




}
