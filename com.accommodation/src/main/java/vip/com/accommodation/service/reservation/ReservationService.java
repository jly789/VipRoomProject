package vip.com.accommodation.service.reservation;

import vip.com.accommodation.dto.room.RoomInsertDto;

public interface ReservationService {


    public int maxNum();
    public void roomInsert(RoomInsertDto roomInsertDto);
}
