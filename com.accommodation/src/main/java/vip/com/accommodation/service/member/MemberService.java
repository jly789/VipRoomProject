package vip.com.accommodation.service.member;

import vip.com.accommodation.dto.member.MemberInsertDto;

public interface MemberService {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto);

}
