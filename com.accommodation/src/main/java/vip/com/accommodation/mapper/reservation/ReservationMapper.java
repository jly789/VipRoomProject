package vip.com.accommodation.mapper.reservation;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.room.RoomInsertDto;

@Mapper
public interface ReservationMapper {

    public int maxNum();

    public void roomInsert(RoomInsertDto roomInsertDto);






}