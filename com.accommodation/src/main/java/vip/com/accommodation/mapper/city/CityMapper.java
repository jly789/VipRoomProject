package vip.com.accommodation.mapper.city;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.city.CityDto;

import java.util.List;

@Mapper
public interface CityMapper {


    public List<CityDto> citySearch(String districtName ); //지역구이름을통한 도시검색리스트



}
