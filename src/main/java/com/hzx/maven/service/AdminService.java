package com.hzx.maven.service;

import com.hzx.maven.dao.AdminMapper;
import com.hzx.maven.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    //管理员登录方法
    public Admin getAdmin(Admin admin){
        Admin admin1 = adminMapper.selectAdmin(admin);
        return admin1;
    }

    //查询所有管理员列表（可带条件可不带）
    public List<Admin> getAllAdmins(Admin admin){
        List<Admin> admins = adminMapper.selectAllAdmins(admin);
        return admins;
    }

    //新增管理员
    public boolean AddAdmin(Admin admin){
        int i = adminMapper.insertSelective(admin);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }

    //修改管理员信息
    public boolean modifyAdmin(Admin admin){
        int i = adminMapper.updateByPrimaryKeySelective(admin);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }

    //删除管理员信息
    public boolean removeAdmin(Admin admin){
        int i = adminMapper.deleteByPrimaryKey(admin);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }
}
