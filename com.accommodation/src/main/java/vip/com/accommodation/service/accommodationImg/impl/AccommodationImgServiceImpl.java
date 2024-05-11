package vip.com.accommodation.service.accommodationImg.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vip.com.accommodation.dto.accommodationImg.AccommodationImgInsertDto;
import vip.com.accommodation.dto.city.CityDto;
import vip.com.accommodation.mapper.accommodation.AccommodationMapper;
import vip.com.accommodation.mapper.accommodationImg.AccommodationImgMapper;
import vip.com.accommodation.mapper.city.CityMapper;
import vip.com.accommodation.service.accommodationImg.AccommodationImgService;
import vip.com.accommodation.service.city.CityService;

import java.io.File;
import java.util.List;

@Service
public class AccommodationImgServiceImpl implements AccommodationImgService {

    @Autowired
    private AccommodationImgMapper accommodationImgMapper;




    @Override
    public void accommodationImgInsert(AccommodationImgInsertDto accommodationImgInsertDto, List<MultipartFile> file)throws Exception {



        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\accommodationImg";

      //  int id = accommodationImgInsertDto.getAccommodationId(); //1

        for (int i = 0; i < file.size(); i++) {



            int imgId =0;

            String fileName = file.get(i).getOriginalFilename();


            File saveFile = new File(projectPath, fileName);
            file.get(i).transferTo(saveFile);
            accommodationImgInsertDto.setAccommodationImage(fileName);
            accommodationImgInsertDto.setAccommodationImagePath("/accommodationImg/" + fileName);

             imgId =accommodationImgMapper.maxNum()+1;

            accommodationImgInsertDto.setAccommodationImgId(imgId);

            accommodationImgMapper.accommodationImgInsert(accommodationImgInsertDto);




        }

        return;
    }

    }


