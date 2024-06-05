package vip.com.accommodation.dto.accommodation;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

@Getter
@Setter
public class AccommodationFindDto {

    private int accommodationId; //숙소번호


    private String accommodationName; //숙소이름


    private String accommodationDistrict; //숙소지역구


    private String accommodationCity; //숙소시


    private String accommodationAddress; //숙소주소


    private String accommodationCategory; //숙소유형


    private String accommodationInformation; //숙소정보

    private LocalDate accommodationCreateDate; //숙소등록일
}
