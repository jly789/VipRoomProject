package vip.com.accommodation.dto.room;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomSpecificListDto {



    //객실
    private int roomId; //객실번호
    private int accommodationId; // (외래키)숙소번호
    private int roomPrice; //객실 1박당 가격
    private int  standardNumbers; //기준인원
    private int maximumCapacity; //최대 숙박인원
    private int roomNumbers;//객실수
    private String roomName; //객실이름
    private String roomDescription; //객실소개



    //객실이미지
    private int roomImgId; //객실이미지번호
    private String roomImage;
    private String roomImagePath;


}
