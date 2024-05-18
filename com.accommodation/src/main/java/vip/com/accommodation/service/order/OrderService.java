package vip.com.accommodation.service.order;

import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

public interface OrderService {


    public int maxNum();
    public void roomInsert(RoomInsertDto roomInsertDto);

    public int reservationSearch(ReservationFindDto reservationFindDto);

    public void reservationInsert(ReservationInsertDto reservationInsertDto);
}
