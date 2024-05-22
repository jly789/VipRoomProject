package vip.com.accommodation.mapper.accommodation;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;

import java.util.List;

@Mapper
public interface AccommodationMapper {

    public int maxNum();
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto);

    public List<AccommodationFindDto> accommodationFindList();

    public List<AccommodationMainListDto> accommodationMainList();

    public List<AccommodationMainListDto> accommodationMainListSearchCity(AccommodationMainListDto accommodationMainListDto);

    public List<AccommodationMainListDto> accommodationDetailList(int accommodationId);


}
