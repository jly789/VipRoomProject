package vip.com.accommodation.service.review.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.review.ReviewDeleteDto;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.dto.review.ReviewListDto;
import vip.com.accommodation.dto.review.ReviewUpdateDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.mapper.review.ReviewMapper;
import vip.com.accommodation.service.district.DistrictService;
import vip.com.accommodation.service.review.ReviewService;

import java.io.File;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public int maxNum() {
        return reviewMapper.maxNum();
    }

    @Override
    public void insertReviewData(ReviewInsertDto reviewInsertDto, MultipartFile file) throws Exception {


        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\reviewImg";


        String fileName = file.getOriginalFilename();



        File saveFile = new File(projectPath, fileName);

        file.transferTo(saveFile);

        reviewInsertDto.setReviewFileName(fileName);

        reviewInsertDto.setReviewFilePath("/reviewImg/" + fileName);


        reviewMapper.insertReviewData(reviewInsertDto);

    }

    @Override
    public void insertReviewNotImage(ReviewInsertDto reviewInsertDto, MultipartFile file) throws Exception {


        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\reviewImg\\noImage.jpg";


        String fileName = "noImage.jpg";



        reviewInsertDto.setReviewFileName(fileName);

        reviewInsertDto.setReviewFilePath("/reviewImg/" + fileName);


        reviewMapper.insertReviewNotImage(reviewInsertDto);
    }


    @Override
    public List<ReviewListDto> reviewList() {
        return reviewMapper.reviewList();
    }

    @Override
    public List<ReviewListDto> reviewDetailList(int reviewId) {
        return reviewMapper.reviewDetailList(reviewId);
    }

    @Override
    public void reviewUpdate(ReviewUpdateDto reviewUpdateDto,MultipartFile file)throws Exception {


        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\reviewImg";


        String fileName = file.getOriginalFilename();



        File saveFile = new File(projectPath, fileName);

        file.transferTo(saveFile);

        reviewUpdateDto.setReviewFileName(fileName);

        reviewUpdateDto.setReviewFilePath("/reviewImg/" + fileName);


        reviewMapper.reviewUpdate(reviewUpdateDto);
    }

    @Override
    public void reviewUpdateNoImg(ReviewUpdateDto reviewUpdateDto) throws Exception {


        reviewMapper.reviewUpdateNoImg(reviewUpdateDto);
    }

    @Override
    public void reviewDelete(ReviewDeleteDto reviewDeleteDto) {
        reviewMapper.reviewDelete(reviewDeleteDto);

    }

    @Override
    public void reviewDeleteMemberId(int memberId) {
        reviewMapper.reviewDeleteMemberId(memberId);
    }

    @Override
    public void reservationReviewDelete(int reservationId) {
        reviewMapper.reservationReviewDelete(reservationId);
    }

    @Override
    public Integer accommodationReviewGrade(int accommodationId) {



        return reviewMapper.accommodationReviewGrade(accommodationId);

    }

    @Override
    public Integer accommodationRoomReviewGrade(int accommodationId, int roomId) {
        return reviewMapper.accommodationRoomReviewGrade(accommodationId,roomId);
    }

    @Override
    public List<ReviewListDto> accommodationReviewImg(int accommodationId) {
        return  reviewMapper.accommodationReviewImg(accommodationId);
    }

    @Override
    public List<ReviewListDto> roomReviewImg(int accommodationId,int roomId) {
        return reviewMapper.roomReviewImg(accommodationId,roomId);
    }

    @Override
    public Integer accommodationReviewTotal(int accommodationId) {
        return reviewMapper.accommodationReviewTotal(accommodationId);
    }

    @Override
    public Integer roomReviewTotal(int accommodationId,int roomId) {
        return reviewMapper.roomReviewTotal(accommodationId,roomId);
    }
}
