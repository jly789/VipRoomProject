package vip.com.accommodation.mapper.room;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.room.RoomDto;
import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;

import java.util.List;

@Mapper
public interface RoomMapper {

    public int maxNum();

    public void roomInsert(RoomInsertDto roomInsertDto);


    public List<RoomMainListDto> roomDetailList(int accommodationId);

    public List<RoomSpecificListDto> roomSpecificListDto(int roomId, int accommodationId);




}
