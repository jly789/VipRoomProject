package vip.com.accommodation.dto.review;


import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ReviewListDto {


    private int reviewId; //리뷰번호
    private int memberId; //회원번호
    private int accommodationId; //숙소번호
    private int reservationId; //예약번호
    private int views; //조회수
    private int grade; //평점
    private int  avgGrade; //평균평점
    private String reviewSubject; //리뷰제목
    private String reviewContent; //리뷰내용
    private String reviewFileName; //리뷰이미지
    private String reviewFilePath; //리뷰이미지경로
    private String reviewState; //리뷰상태
    private LocalDate reviewDate; //리뷰등록일

    private int roomId; //객실번호

    private String userId; //사용자아이디


    private String accommodationName; //숙소이름

}
