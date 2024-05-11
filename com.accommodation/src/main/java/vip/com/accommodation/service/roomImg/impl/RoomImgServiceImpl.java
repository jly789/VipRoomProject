package vip.com.accommodation.service.roomImg.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.roomImg.RoomImgInsertDto;
import vip.com.accommodation.mapper.roomImg.RoomImgMapper;
import vip.com.accommodation.service.roomImg.RoomImgService;

import java.io.File;
import java.util.List;

@Service
public class RoomImgServiceImpl implements RoomImgService {

    @Autowired
    private RoomImgMapper roomImgMapper;


    @Override

    public void roomImgInsert(RoomImgInsertDto roomImgInsertDto, List<MultipartFile> file)throws Exception {



        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\roomImg";


        for (int i = 0; i < file.size(); i++) {



            int imgId =0;

            String fileName = file.get(i).getOriginalFilename();


            File saveFile = new File(projectPath, fileName);
            file.get(i).transferTo(saveFile);
            roomImgInsertDto.setRoomImage(fileName);
            roomImgInsertDto.setRoomImagePath("/roomImg/" + fileName);

            imgId =roomImgMapper.maxNum()+1;



            roomImgInsertDto.setRoomImgId(imgId);
            roomImgMapper.roomImgInsert(roomImgInsertDto);




        }

        return;
    }
}
