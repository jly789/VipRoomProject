package vip.com.accommodation.dto.roomImg;


import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class RoomImgDto {


    private int accommodationImgId; //숙소번호
    private int accommodationId;
    private String accommodationImage;
    private String accommodationImagePath;


}
