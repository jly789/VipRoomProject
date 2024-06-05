package vip.com.accommodation.dto.roomImg;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class RoomImgInsertDto {



    private int roomImgId; //객실이미지번호
    private int roomId; //(외래키)객실번호
    private int accommodationId; //(외래피)숙소번호
    private String roomImage; //객실이미지
    private String roomImagePath; //객실이미지경로


}
