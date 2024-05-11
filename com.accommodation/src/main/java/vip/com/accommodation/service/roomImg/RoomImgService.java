package vip.com.accommodation.service.roomImg;

import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.roomImg.RoomImgInsertDto;

import java.util.List;

public interface RoomImgService {

    public void roomImgInsert(RoomImgInsertDto roomImgInsertDto, List<MultipartFile> file)throws Exception;
}
