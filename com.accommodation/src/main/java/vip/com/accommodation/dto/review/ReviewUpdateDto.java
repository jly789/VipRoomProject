package vip.com.accommodation.dto.review;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewUpdateDto {

    private int reviewId;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String reviewFilePath;

}
