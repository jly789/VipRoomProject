package vip.com.accommodation.service.review.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.review.ReviewInsertDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.mapper.review.ReviewMapper;
import vip.com.accommodation.service.district.DistrictService;
import vip.com.accommodation.service.review.ReviewService;

import java.io.File;

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
}
