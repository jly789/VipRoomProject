package vip.com.accommodation.service.room;

import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;

import java.util.List;

public interface RoomService {


    public int maxNum();
    public void roomInsert(RoomInsertDto roomInsertDto);

    public List<RoomMainListDto> roomDetailList(int accommodationId);

    public List<RoomSpecificListDto> roomSpecificListDto(int roomId,int accommodationId);


}
