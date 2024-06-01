package vip.com.accommodation.service.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.member.*;
import vip.com.accommodation.mapper.member.MemberMapper;
import vip.com.accommodation.service.member.MemberService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {


    @Autowired
    private MemberMapper memberMapper;

    @Override
    public int maxNum() {
        return memberMapper.maxNum();
    }

    @Override
    public void insertData(MemberInsertDto memberInsertDto)throws Exception {

//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();




            memberMapper.insertData(memberInsertDto);
//            out.println("<script> alert('회원가입완료.');");
//            out.println("history.go(-1);</script>");
//            out.flush(); //flush해야 됨



    }

    @Override
    public int idCheck(String userId){





        if (memberMapper.idCheck(userId)==1){

            return 0;

        }

        return 1;
    }


    @Override
    public String idSearch(MemberSearchDto memberSearchDto) {
       return memberMapper.idSearch(memberSearchDto);
    }

    @Override
    public String pwdSearch(MemberSearchDto memberSearchDto) {
        return memberMapper.pwdSearch(memberSearchDto);
    }

    @Override
    public int login(MemberLoginDto memberLoginDto, HttpServletResponse response) throws Exception {



        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        if (memberMapper.login(memberLoginDto) == 0) {


            out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
            out.println("history.go(-1); </script>");
            out.close();

            return 0;
        }

        if (memberMapper.login(memberLoginDto) == 1) {
            out.println("<script>alert('로그인성공'); </script>");
            return 1;
        }


       return 1;
    }

    @Override
    public int loginCheck(MemberLoginDto memberLoginDto) {
        return memberMapper.loginCheck(memberLoginDto);
    }

    @Override
    public int memberIdSearch(MemberLoginDto memberLoginDto) {
       return memberMapper.memberIdSearch(memberLoginDto);
    }

    @Override
    public List<MemberFindDto> mypage(String userId) {
       return memberMapper.mypage(userId);
    }

    @Override
    public void mypageUpdate(MemberFindDto memberFindDto) {

        memberMapper.mypageUpdate(memberFindDto);
    }

    @Override
    public int deleteLoginCheck(MemberDeleteDto memberDeleteDto) {

        if(memberMapper.deleteLoginCheck(memberDeleteDto)==1){
            return 0; //아이디 확인완료
        }
        else {
            return 1; //아이디 없음
        }
    }


    @Override
    public void mypageDelete(MemberDeleteDto memberDeleteDto) {



        memberMapper.mypageDelete(memberDeleteDto);

    }
}
