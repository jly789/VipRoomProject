package vip.com.accommodation.service.alert.impl;


import org.springframework.stereotype.Service;
import vip.com.accommodation.service.alert.AlertService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Service
public class AlertImpl implements AlertService {


    @Override
    public void accommodationImgAlertMessage(HttpServletResponse response) throws Exception {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script> alert('이미지를 선택한 만큼 제대로선택하세요.');");
        out.println("history.go(-1);</script>");
        out.flush();
    }

    @Override
    public void roomImgAlertMessage(HttpServletResponse response) throws Exception {


        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script> alert('이미지를 선택한 만큼 제대로선택하세요.');");
        out.println("history.go(-1);</script>");
        out.flush();
    }
}


