package vip.com.accommodation.service.accommodation;

import vip.com.accommodation.dto.accommodation.AccommodationFindDto;
import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;
import vip.com.accommodation.dto.accommodation.AccommodationMainListDto;

import java.util.List;

public interface AccommodationService {


    public int maxNum();
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto);

    public List<AccommodationFindDto> accommodationFindList();

    public List<AccommodationMainListDto> accommodationMainList();

    public List<AccommodationMainListDto> accommodationMainListSearchCity(AccommodationMainListDto accommodationMainListDto);

    public List<AccommodationMainListDto> accommodationDetailList(int accommodationId);
}
