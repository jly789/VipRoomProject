package vip.com.accommodation.service.alert;


import javax.servlet.http.HttpServletResponse;


public interface AlertService {


        public void accommodationImgAlertMessage(HttpServletResponse response)throws Exception; //숙소이미지 경고메세지

        public void roomImgAlertMessage(HttpServletResponse response)throws Exception; //객실이미지 경고메세지

        public void reservationAlertMessage(HttpServletResponse response)throws Exception; //예약경고 메세지





}
