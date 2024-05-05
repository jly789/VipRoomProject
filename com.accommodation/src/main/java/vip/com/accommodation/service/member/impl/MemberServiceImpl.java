package vip.com.accommodation.service.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.member.MemberInsertDto;
import vip.com.accommodation.dto.member.MemberLoginDto;
import vip.com.accommodation.mapper.member.MemberMapper;
import vip.com.accommodation.service.member.MemberService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

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

}
