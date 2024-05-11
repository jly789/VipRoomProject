package vip.com.accommodation.service.alert;

import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface AlertService {


        public void accommodationImgAlertMessage(HttpServletResponse response)throws Exception;

        public void roomImgAlertMessage(HttpServletResponse response)throws Exception;



}
