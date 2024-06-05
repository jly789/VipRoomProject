package vip.com.accommodation.mapper.review;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.review.ReviewDeleteDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.dto.review.ReviewListDto;
import vip.com.accommodation.dto.review.ReviewUpdateDto;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public int maxNum(); //가장높은 리뷰번호

    public void insertReviewData(ReviewInsertDto reviewInsertDto) throws Exception; //이미지있는 리뷰등록

    public void insertReviewNotImage(ReviewInsertDto reviewInsertDto) throws Exception; //이미지없는 리뷰등록

    public List<ReviewListDto> reviewList(); //리뷰리스트

    public List<ReviewListDto> reviewDetailList(int reviewId); //리뷰상세리스트

    public void reviewUpdate(ReviewUpdateDto reviewUpdateDto); //리뷰수정
    public void reviewUpdateNoImg(ReviewUpdateDto reviewUpdateDto)throws Exception; //이미지없는 리뷰수정
    public void reviewDelete(ReviewDeleteDto reviewDeleteDto); //reviewId를 통한 리뷰삭제
    public void reviewDeleteMemberId(int memberId); //회원번호를 통한 리뷰삭제
    public void reservationReviewDelete(int reservationId); //reservationId를 통한 my예약에서 예약취소된 리뷰 삭제



    public Integer accommodationReviewGrade(int accommodationId); //해당 숙소의 숙소리뷰평점


    public Integer accommodationRoomReviewGrade(int accommodationId,int roomId); //해당숙소의 객실 리뷰평점

    public List<ReviewListDto> accommodationReviewImg(int accommodationId); //숙소 리뷰이미지
    public List<ReviewListDto> roomReviewImg(int accommodationId,int roomId); //객실리뷰 이미지

    public Integer accommodationReviewTotal(int accommodationId); //숙소 총리뷰평점

    public Integer roomReviewTotal(int accommodationId,int roomId); //객실리뷰 총평점




}
