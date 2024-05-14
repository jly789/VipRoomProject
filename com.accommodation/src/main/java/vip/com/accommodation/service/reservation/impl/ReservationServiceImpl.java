package vip.com.accommodation.service.reservation.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.mapper.room.RoomMapper;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.room.RoomService;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private RoomMapper roomMapper;


    @Override
    public int maxNum() {
        return roomMapper.maxNum();
    }

    @Override
    public void roomInsert(RoomInsertDto roomInsertDto) {
        roomMapper.roomInsert(roomInsertDto);
    }
}
