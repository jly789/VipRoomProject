package vip.com.accommodation.service.room;

import vip.com.accommodation.dto.room.RoomInsertDto;

public interface RoomService {


    public int maxNum();
    public void roomInsert(RoomInsertDto roomInsertDto);
}
