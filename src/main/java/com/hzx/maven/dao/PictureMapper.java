package com.hzx.maven.dao;

import com.hzx.maven.entity.Picture;

import java.util.List;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer id);

    List<Picture> selectAllPicture();

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);
}