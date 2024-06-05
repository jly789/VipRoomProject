package vip.com.accommodation.mapper.accommodation;

import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.accommodation.*;

import java.util.List;

@Mapper
public interface AccommodationMapper {

    public int maxNum(); //가장높은 번호구하기
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto); //숙소등록

    public List<AccommodationFindDto> accommodationFindList(); //숙소찾기리스트

    public List<AccommodationMainListDto> accommodationMainList(Pagination pagination); //숙소메인리스트(페이징처리)

    public int testTableCount() throws Exception; //숙소전체리스트 갯수구하기
    public int accommodationMainListSearchCityTableCount(String accommodationDistrict,String accommodationCity) throws Exception; //숙소 검색된 도시에 해당되는 숙소리스트 갯수구하기

    public int categorySearchTableCount(String category) throws Exception; //숙소유형에 해당되는 숙소리스트 갯수구하기

    public List<AccommodationMainListDto> distinctSearchList(AccommodationMainListDto accommodationMainListDto); //main리스트에서 원하는 지역구,숙소유형의 검색 숙소리스트
    public List<AccommodationMainListDto> accommodationCategorySearchList(AccommodationMainListDto accommodationMainListDto); //main리스트에서 숙소유형의  숙소리스트



    public List<AccommodationMainListDto> accommodationMainListSearchCity(Pagination pagination); //원하는 (지역구/도시) 검색 숙소리스트




    public List<AccommodationMainListDto> accommodationDetailList(int accommodationId); //숙소상세리스트

    public String relatedHotelsDistrict(int accommodationId); //특정 숙소번호의 같은 지역구 호텔리스트
    public List<AccommodationMainListDto> relatedHotels(String district); //특정 지역구의 관련된 호텔리스트


}
