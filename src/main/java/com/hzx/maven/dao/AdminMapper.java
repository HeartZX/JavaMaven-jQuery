package com.hzx.maven.dao;

import com.hzx.maven.entity.Admin;
import com.hzx.maven.entity.AdminKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {
    int deleteByPrimaryKey(Admin record);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectAdmin(Admin key);

    List<Admin> selectAllAdmins(Admin key);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}