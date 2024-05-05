package vip.com.accommodation.service.member;

import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.dto.member.MemberLoginDto;
import vip.com.accommodation.dto.member.MemberSearchDto;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto)throws Exception;

    public int idCheck(String userId);

    public String idSearch(MemberSearchDto memberSearchDto);
    public String pwdSearch(MemberSearchDto memberSearchDto);

    public int login(MemberLoginDto memberLoginDto, HttpServletResponse response)throws Exception ;

}
