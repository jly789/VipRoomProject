package vip.com.accommodation.mapper.reservation;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

import java.util.List;

@Mapper
public interface ReservationMapper {

    public int maxNum();

    public void roomInsert(RoomInsertDto roomInsertDto);

    public int reservationSearch(ReservationFindDto reservationFindDto);

    public void reservationInsert(ReservationInsertDto reservationInsertDto);

    public void reservationDelete(int reservationId);

    public List<ReservationFindDto> reservationFindDto(ReservationFindDto reservationFindDto);


    public List<ReservationListDto> myReservationList(int memberId);




}
