package com.hzx.maven.service;

import com.hzx.maven.dao.PictureMapper;
import com.hzx.maven.entity.Picture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PictureService {

    @Autowired
    private PictureMapper pictureMapper;

    public boolean savePicture(Picture picture){
        int i = pictureMapper.insertSelective(picture);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }

    public List<Picture> getAllPicture(){
        List<Picture> pictures = pictureMapper.selectAllPicture();
        return pictures;
    }

    public boolean removePicture(Integer id){
        int i = pictureMapper.deleteByPrimaryKey(id);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }
}
