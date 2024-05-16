package vip.com.accommodation.service.room.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.room.RoomInsertDto;
import vip.com.accommodation.dto.room.RoomMainListDto;
import vip.com.accommodation.dto.room.RoomSpecificListDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.mapper.room.RoomMapper;
import vip.com.accommodation.service.district.DistrictService;
import vip.com.accommodation.service.room.RoomService;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

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


    @Override
    public List<RoomMainListDto> roomDetailList(int accommodationId) {
      return   roomMapper.roomDetailList(accommodationId);
    }

    @Override
    public List<RoomSpecificListDto> roomSpecificListDto(int roomId, int accommodationId) {
        return roomMapper.roomSpecificListDto(roomId,accommodationId);
    }
}
