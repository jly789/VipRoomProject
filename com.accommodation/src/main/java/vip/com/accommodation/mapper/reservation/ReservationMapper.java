package vip.com.accommodation.mapper.reservation;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

@Mapper
public interface ReservationMapper {

    public int maxNum();

    public void roomInsert(RoomInsertDto roomInsertDto);

    public int reservationSearch(ReservationFindDto reservationFindDto);

    public void reservationInsert(ReservationInsertDto reservationInsertDto);






}
