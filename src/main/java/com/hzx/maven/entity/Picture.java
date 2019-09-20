package com.hzx.maven.entity;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;

@Data
public class Picture {
    private Integer id;

    /**
     * 图片名称
     */
    private String picName;

    /**
     * 图片路径
     */
    private String picFilePath;

    /**
     * 更新时间
     */
    private Date picUpdateTime;

    private MultipartFile fileImg;


}