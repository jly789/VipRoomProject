package vip.com.accommodation.service.room;

import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.dto.room.RoomMainListDto;

import java.util.List;

public interface RoomService {


    public int maxNum();
    public void roomInsert(RoomInsertDto roomInsertDto);

    public List<RoomMainListDto> roomDetailList(int accommodationId);
}
