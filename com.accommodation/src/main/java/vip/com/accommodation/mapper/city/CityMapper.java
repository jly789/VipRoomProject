package vip.com.accommodation.mapper.city;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.city.CityDto;
import vip.com.accommodation.dto.member.*;

import java.util.List;

@Mapper
public interface CityMapper {


    public List<CityDto> citySearch(String districtName );



}
