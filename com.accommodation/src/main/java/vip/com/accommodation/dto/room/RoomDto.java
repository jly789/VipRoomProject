package vip.com.accommodation.dto.room;


import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
public class RoomDto {

    private int roomId; //객실번호


    private int accommodationId; //(와래키)숙소번호


    private int roomPrice; //객실 1박당 가격

    private int maximumCapacity; //최대 숙박인원


    private int roomNumbers;//객실수

    @NotBlank(message = "필수 정보입니다.")
    private String roomName; //객실이름

    @NotBlank(message = "필수 정보입니다.")
    private String roomDescription; //객실소개

}
