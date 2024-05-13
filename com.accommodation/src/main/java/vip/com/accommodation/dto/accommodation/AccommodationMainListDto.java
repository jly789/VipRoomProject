package vip.com.accommodation.dto.accommodation;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Getter
@Setter
public class AccommodationMainListDto {

    //숙조+숙소이미지+객실 3중조인

    //숙소
    private int accommodationId; //숙소번호
    private String accommodationName; //숙소이름
    private String accommodationDistrict; //숙소지역구
    private String accommodationCity; //숙소시
    private String accommodationAddress; //숙소주소
    private String accommodationCategory; //숙소유형
    private String accommodationInformation; //숙소정보
    private LocalDate accommodationCreateDate; //숙소등록일


    //숙소이미지
    private int accommodationImgId; //숙소번호
    private String accommodationImage;
    private String accommodationImagePath;


    //객실
    private int roomId; //객실번호
    private int roomPrice; //객실 1박당 가격
    private int  standardNumbers; //기준인원
    private int maximumCapacity; //최대 숙박인원
    private int roomNumbers;//객실수
    private String roomName; //객실이름
    private String roomDescription; //객실소개



}
