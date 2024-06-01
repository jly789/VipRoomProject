package vip.com.accommodation.mapper.member;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.member.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Mapper
public interface MemberMapper {

    public int maxNum();

    public void insertData(MemberInsertDto memberInsertDto);

    public int idCheck(String userId);

    public String idSearch(MemberSearchDto memberSearchDto);

    public String pwdSearch(MemberSearchDto memberSearchDto);


    public int login(MemberLoginDto memberLoginDto);
    public int loginCheck(MemberLoginDto memberLoginDto);

    public int memberIdSearch(MemberLoginDto memberLoginDto);

    public  List<MemberFindDto> mypage(String userId);

    public  void mypageUpdate(MemberFindDto memberFindDto);

    public int deleteLoginCheck(MemberDeleteDto memberDeleteDto);

    public void mypageDelete(MemberDeleteDto memberDeleteDto);


}
