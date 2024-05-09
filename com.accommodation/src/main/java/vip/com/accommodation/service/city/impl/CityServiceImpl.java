package vip.com.accommodation.service.city.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.city.CityDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.mapper.city.CityMapper;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.city.CityService;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private AccommodationMapper accommodationMapper;

    @Autowired
    private CityMapper cityMapper;


    @Override
    public List<CityDto> citySearch(String districtName) {
        return cityMapper.citySearch(districtName);
    }
}
