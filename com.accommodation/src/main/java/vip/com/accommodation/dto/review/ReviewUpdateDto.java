package vip.com.accommodation.dto.review;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewUpdateDto {

    private int reviewId; //리뷰아이디
    private String reviewSubject; //리뷰제목
    private String reviewContent; //리뷰내용
    private String reviewFileName; //리뷰이미지
    private String reviewFilePath; //리뷰이미지경로

}
