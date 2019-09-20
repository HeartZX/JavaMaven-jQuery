package com.hzx.maven.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzx.maven.entity.Admin;
import com.hzx.maven.entity.Picture;
import com.hzx.maven.service.PictureService;
import com.hzx.maven.until.Msg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/picture")
public class PictureHandler {

    @Autowired
    private PictureService pictureService;

    @ResponseBody
    @RequestMapping("/savePicture")
    public Msg savePicture(@RequestParam(value = "fileImg") MultipartFile fileImg, @RequestParam(value = "picName") String picName, HttpServletRequest request) throws IOException {
        if (fileImg.getSize() == 0) {
            return Msg.error("请选择图片");
        }
        if (picName == null || picName.equals("")) {
            return Msg.error("请输入图片名称");
        }
        String uploadFileName = fileImg.getOriginalFilename();
        //上传文件
        String pattern = "";
        if (uploadFileName.contains(".")) {
            pattern = uploadFileName.substring(uploadFileName.lastIndexOf("."));
        }
        String fileName = UUID.randomUUID() + pattern;
        String projectPath = "F:/project/maven/src/main/webapp/static/index/images/banner/";
        String tmpFilePath = projectPath + fileName;
        File tmpFile = new File(tmpFilePath);
        // 写入临时文件
        if (!tmpFile.getParentFile().exists()) {
            tmpFile.getParentFile().mkdirs();
        }
        try {
            fileImg.transferTo(tmpFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Picture picture = new Picture();

        picture.setPicFilePath("/static/index/images/banner/" + fileName);
        picture.setPicName(picName);
        picture.setPicUpdateTime(new Date());

        boolean b = pictureService.savePicture(picture);
        if (b) {
            //动态复制到已启动的项目中
            String contextPath = request.getSession().getServletContext().getRealPath("/");
            File tmpFile2 = new File(contextPath + "/static/index/images/banner/" + fileName);
            FileInputStream fis = new FileInputStream(tmpFile);//建立一个输入流对象
            FileOutputStream fos = new FileOutputStream(tmpFile2);//建立一个输出流
            byte[] buffer = new byte[1444];
            int byteread = 0;
            while ( (byteread = fis.read(buffer)) != -1) {
                fos.write(buffer, 0, byteread);
            }
            fos.close();
            fis.close();
            return Msg.success();
        } else {
            return Msg.error("添加失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/showBanner")
    public Msg showBanner() {
        List<Picture> allPicture = pictureService.getAllPicture();
        return Msg.success().add("allPicture", allPicture);
    }

    @ResponseBody
    @RequestMapping("/showBannerByPage")
    public Msg showBannerByPage(@RequestParam(value="pn",defaultValue="1") Integer pageNum) {

        PageHelper.startPage(pageNum,10);
        List<Picture> allPicture = pictureService.getAllPicture();
        PageInfo<Picture> pageInfo=new PageInfo<Picture>(allPicture,10);

        return Msg.success().add("page", pageInfo);
    }

    @ResponseBody
    @RequestMapping("/removeBanner")
    public Msg removeBanner(Integer[] ids) {
        for (int i:ids) {
            pictureService.removePicture(i);
        }
        return Msg.success();
    }
}
