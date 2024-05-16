package vip.com.accommodation.service.reservation.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.mapper.reservation.ReservationMapper;
import vip.com.accommodation.mapper.room.RoomMapper;
import vip.com.accommodation.service.reservation.ReservationService;
import vip.com.accommodation.service.room.RoomService;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private RoomMapper roomMapper;

    @Autowired
    private ReservationMapper reservationMapper;


    @Override
    public int maxNum() {
        return roomMapper.maxNum();
    }

    @Override
    public void roomInsert(RoomInsertDto roomInsertDto) {
        roomMapper.roomInsert(roomInsertDto);
    }

    @Override
    public int reservationSearch(ReservationFindDto reservationFindDto) {


        if (reservationMapper.reservationSearch(reservationFindDto) ==1) {

            return 0;
        }

        if (reservationMapper.reservationSearch(reservationFindDto)==0) {

            return 1;
        }

            return 1;


    }



    @Override
    public void reservationInsert(ReservationInsertDto reservationInsertDto) {
        reservationMapper.reservationInsert(reservationInsertDto);
    }
}
