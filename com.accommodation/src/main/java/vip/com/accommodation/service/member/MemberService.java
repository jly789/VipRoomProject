package vip.com.accommodation.service.member;

import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.dto.member.MemberLoginDto;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto, HttpServletResponse response)throws Exception;

    public int idCheck(String userId);

    public int login(MemberLoginDto memberLoginDto, HttpServletResponse response)throws Exception ;

}
