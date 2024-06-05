package vip.com.accommodation.service.room;

import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;

import java.util.List;

public interface RoomService {


    public int maxNum(); //가장높은 객실번호

    public void roomInsert(RoomInsertDto roomInsertDto); //객실등록


    public List<RoomMainListDto> roomDetailList(int accommodationId); //객실 상세리스트

    public List<RoomSpecificListDto> roomSpecificListDto(int roomId, int accommodationId); //특정객실리스트


}
