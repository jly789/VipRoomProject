package vip.com.accommodation.service.accommodation;

import vip.com.accommodation.dto.accommodation.AccommodationInsertDto;

public interface AccommodationService {


    public int maxNum();
    public void accommodationInsert(AccommodationInsertDto accommodationInsertDto);
}
