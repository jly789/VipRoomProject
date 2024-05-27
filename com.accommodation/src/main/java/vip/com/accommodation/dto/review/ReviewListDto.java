package vip.com.accommodation.dto.review;


import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ReviewListDto {


    private int reviewId;
    private int memberId;
    private int accommodationId;
    private int reservationId;
    private int views;
    private int grade;
    private int  avgGrade;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String reviewFilePath;
    private String reviewState;
    private LocalDate reviewDate;

    private int roomId;

    private String userId;


    private String accommodationName; //숙소이름

}
