package vip.com.accommodation.service.accommodation.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.service.accommodation.AccommodationService;

@Service
public class AccommodationServiceImpl implements AccommodationService {

    @Autowired
    private AccommodationMapper accommodationMapper;


    @Override
    public int maxNum() {
        return accommodationMapper.maxNum();
    }

    @Override
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto) {
        accommodationMapper.accommodationInsert(accommodationInsertDto);
    }
}