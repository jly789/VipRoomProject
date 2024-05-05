package vip.com.accommodation.mapper.member;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.dto.member.MemberLoginDto;
import vip.com.accommodation.dto.member.MemberSearchDto;

import javax.servlet.http.HttpServletResponse;

@Mapper
public interface MemberMapper {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto);

    public int idCheck(String userId);

    public String idSearch(MemberSearchDto memberSearchDto);

    public String pwdSearch(MemberSearchDto memberSearchDto);


    public int login(MemberLoginDto memberLoginDto);
}
