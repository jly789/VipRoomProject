package vip.com.accommodation.service.order;

import vip.com.accommodation.dto.order.OrderInsertDto;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

public interface OrderService {


    public int maxNum();
    public void orderInsert(OrderInsertDto orderInsertDto);

    public void orderDelete(int reservationId);//예약번호를 통한 주문삭제


}
