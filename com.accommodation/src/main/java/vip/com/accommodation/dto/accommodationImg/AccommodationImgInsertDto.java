package vip.com.accommodation.dto.accommodationImg;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccommodationImgInsertDto {



    private int accommodationImgId; //숙소이미지번호
    private int accommodationId; //숙소번호
    private String accommodationImage; //숙소이미지
    private String accommodationImagePath; //숙소이미지경로



}
