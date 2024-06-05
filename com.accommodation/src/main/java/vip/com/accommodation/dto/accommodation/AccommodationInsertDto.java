package vip.com.accommodation.dto.accommodation;

import lombok.Getter;
import lombok.Setter;
import javax.validation.constraints.*;
import java.time.LocalDate;

@Getter
@Setter
public class AccommodationInsertDto {



    private int accommodationId; //숙소번호

    @NotBlank(message = "필수 정보입니다.")
    private String accommodationName; //숙소이름

    @NotBlank(message = "필수 정보입니다.")
    private String accommodationDistrict; //숙소지역구

    @NotBlank(message = "필수 정보입니다.")
    private String accommodationCity; //숙소시

    @NotBlank(message = "필수 정보입니다.")
    private String accommodationAddress; //숙소주소

    @NotBlank(message = "필수 정보입니다.")
    private String accommodationCategory; //숙소유형

    @NotBlank(message = "필수 정보입니다.")
    private String accommodationInformation; //숙소정보

    private LocalDate accommodationCreateDate; //숙소등록일


}
