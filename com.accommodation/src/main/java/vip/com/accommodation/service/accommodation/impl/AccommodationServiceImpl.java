package vip.com.accommodation.service.accommodation.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.accommodation.*;
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
    public List<AccommodationMainListDto> accommodationMainList(Pagination pagination) {
       return   accommodationMapper.accommodationMainList(pagination);
    }

    @Override
    public int testTableCount() throws Exception {
        return accommodationMapper.testTableCount();
    }

    @Override
    public int accommodationMainListSearchCityTableCount(String accommodationDistrict,String accommodationCity) throws Exception {
        return accommodationMapper.accommodationMainListSearchCityTableCount(accommodationDistrict,accommodationCity);
    }

    @Override
    public List<AccommodationMainListDto> distinctSearchList(AccommodationMainListDto accommodationMainListDto) {
        return accommodationMapper.distinctSearchList(accommodationMainListDto);
    }

    @Override
    public List<AccommodationMainListDto> accommodationCategorySearchList(AccommodationMainListDto accommodationMainListDto) {
        return accommodationMapper.accommodationCategorySearchList(accommodationMainListDto);
    }

    @Override
    public List<AccommodationMainListDto> accommodationMainListSearchCity(Pagination pagination) {
        return accommodationMapper.accommodationMainListSearchCity(pagination);
    }

    @Override
    public int categorySearchTableCount(String category) throws Exception {
        return accommodationMapper.categorySearchTableCount(category);
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
