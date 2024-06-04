package vip.com.accommodation.service.accommodation;

import vip.com.accommodation.dto.accommodation.*;

import java.util.List;

public interface AccommodationService {


    public int maxNum();
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto);

    public List<AccommodationFindDto> accommodationFindList();

    public List<AccommodationMainListDto> accommodationMainList(Pagination pagination);

    public int testTableCount() throws Exception;
    public int accommodationMainListSearchCityTableCount(String accommodationDistrict,String accommodationCity) throws Exception;

    public int categorySearchTableCount(String category) throws Exception; //숙소유형에 해당되는 숙소리스트 갯수구하기

    public List<AccommodationMainListDto> distinctSearchList(AccommodationMainListDto accommodationMainListDto); //main리스트에서 원하는 지역구,숙소유형의 검색 숙소리스트

    public List<AccommodationMainListDto> accommodationCategorySearchList(AccommodationMainListDto accommodationMainListDto); //main리스트에서 숙소유형의  숙소리스트

    public List<AccommodationMainListDto> accommodationMainListSearchCity(Pagination pagination);

    public List<AccommodationMainListDto> accommodationDetailList(int accommodationId);


    public String relatedHotelsDistrict(int accommodationId); //특정 숙소번호의 같은 지역구 호텔리스트
    public List<AccommodationMainListDto> relatedHotels(String district); //특정 지역구의 관련된 호텔리스트
}
