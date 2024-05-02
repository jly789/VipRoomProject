package vip.com.accommodation.service.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.mapper.member.MemberMapper;
import vip.com.accommodation.service.member.MemberService;

@Service
public class MemberServiceImpl implements MemberService {


    @Autowired
    private MemberMapper memberMapper;

}
