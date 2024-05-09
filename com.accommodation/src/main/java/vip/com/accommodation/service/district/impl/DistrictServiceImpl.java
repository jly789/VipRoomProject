package vip.com.accommodation.service.district.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.service.accommodation.AccommodationService;
import vip.com.accommodation.service.district.DistrictService;

@Service
public class DistrictServiceImpl implements DistrictService {

    @Autowired
    private AccommodationMapper accommodationMapper;




}
