package vip.com.accommodation.service.review;

import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.review.ReviewInsertDto;

public interface ReviewService {

    public int maxNum();
    public void insertReviewData(ReviewInsertDto reviewInsertDto, MultipartFile file) throws Exception;

    public void insertReviewNotImage(ReviewInsertDto reviewInsertDto,MultipartFile file) throws Exception;
}
