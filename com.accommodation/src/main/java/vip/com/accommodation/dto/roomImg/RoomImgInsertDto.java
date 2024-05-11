package vip.com.accommodation.dto.roomImg;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Getter
@Setter
public class RoomImgInsertDto {



    private int roomImgId; //객실이미지번호
    private int roomId; //객실번호
    private String roomImage;
    private String roomImagePath;


}
