package vip.com.accommodation.mapper.member;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.dto.member.MemberLoginDto;

import javax.servlet.http.HttpServletResponse;

@Mapper
public interface MemberMapper {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto);

    public int idCheck(String userId);


    public int login(MemberLoginDto memberLoginDto);
}
