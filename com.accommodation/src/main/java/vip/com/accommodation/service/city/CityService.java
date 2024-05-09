package vip.com.accommodation.service.city;

import vip.com.accommodation.dto.city.CityDto;

import java.util.List;

public interface CityService {


    public List<CityDto> citySearch(String districtName );
}
