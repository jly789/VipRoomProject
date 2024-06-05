package vip.com.accommodation.dto.city;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CityDto {

   private int city; //도시번호
    private int districtId; //지역구번호
    private  String cityName; //도시이름

}
