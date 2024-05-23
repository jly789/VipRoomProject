package vip.com.accommodation.service.accommodation.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.service.accommodation.AccommodationService;

import java.util.List;

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


    @Override
    public List<AccommodationFindDto> accommodationFindList() {
        return accommodationMapper.accommodationFindList();
    }


    @Override
    public List<AccommodationMainListDto> accommodationMainList() {
       return   accommodationMapper.accommodationMainList();
    }

    @Override
    public List<AccommodationMainListDto> accommodationMainListSearchCity(AccommodationMainListDto accommodationMainListDto) {
        return accommodationMapper.accommodationMainListSearchCity(accommodationMainListDto);
    }

    @Override
    public List<AccommodationMainListDto> accommodationDetailList(int accommodationId) {
        return accommodationMapper.accommodationDetailList(accommodationId);
    }

    @Override
    public String relatedHotelsDistrict(int accommodationId) {
        return accommodationMapper.relatedHotelsDistrict(accommodationId);
    }

    @Override
    public List<AccommodationMainListDto> relatedHotels(String district) {
        return accommodationMapper.relatedHotels(district);
    }
}
