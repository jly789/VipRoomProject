package vip.com.accommodation.mapper.order;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.order.OrderInsertDto;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

@Mapper
public interface OrderMapper {

    public int maxNum();


    public void orderInsert(OrderInsertDto orderInsertDto);






}
