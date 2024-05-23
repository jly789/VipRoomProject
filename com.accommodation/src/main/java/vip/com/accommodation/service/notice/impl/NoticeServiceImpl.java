package vip.com.accommodation.service.notice.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.service.district.DistrictService;
import vip.com.accommodation.service.notice.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private AccommodationMapper accommodationMapper;




}
