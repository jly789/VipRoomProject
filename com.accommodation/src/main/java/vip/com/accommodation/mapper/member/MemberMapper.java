package vip.com.accommodation.mapper.member;


import org.apache.ibatis.annotations.Mapper;
import vip.com.accommodation.dto.member.*;


import java.util.List;

@Mapper
public interface MemberMapper {

    public int maxNum(); //같은 높은 회원번호구하기

    public void insertData(MemberInsertDto memberInsertDto); //회원등록

    public int idCheck(String userId); //아이디를통한 아이디찾기

    public String idSearch(MemberSearchDto memberSearchDto); //회원정보를 통한 아이디찾기

    public String pwdSearch(MemberSearchDto memberSearchDto); //회원정보를 통한 비밀번호찾기


    public int login(MemberLoginDto memberLoginDto); //회원로그인
    public int loginCheck(MemberLoginDto memberLoginDto); //회원로그인체크

    public int memberIdSearch(MemberLoginDto memberLoginDto); //회원번호찾기

    public  List<MemberFindDto> mypage(String userId); //해당유저의 마이페이지 리스트

    public  void mypageUpdate(MemberFindDto memberFindDto); //마이페이지 수정하기

    public int deleteLoginCheck(MemberDeleteDto memberDeleteDto); //회원삭제를 위한 로그인체크

    public void mypageDelete(MemberDeleteDto memberDeleteDto); //마이페이지삭제


}
