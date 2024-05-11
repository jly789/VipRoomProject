package vip.com.accommodation.dto.accommodationImg;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Getter
@Setter
public class AccommodationImgInsertDto {



    private int accommodationImgId; //숙소번호
    private int accommodationId;
    private String accommodationImage;
    private String accommodationImagePath;



}
