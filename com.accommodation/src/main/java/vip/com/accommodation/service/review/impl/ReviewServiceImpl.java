package vip.com.accommodation.service.review.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.service.district.DistrictService;
import vip.com.accommodation.service.review.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private AccommodationMapper accommodationMapper;




}
