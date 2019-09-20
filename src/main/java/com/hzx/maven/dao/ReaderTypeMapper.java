package com.hzx.maven.dao;

import com.hzx.maven.entity.ReaderType;
import com.hzx.maven.entity.ReaderTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReaderTypeMapper {
    int countByExample(ReaderTypeExample example);

    int deleteByExample(ReaderTypeExample example);

    int deleteByPrimaryKey(Integer readerTypeid);

    int insert(ReaderType record);

    int insertSelective(ReaderType record);

    List<ReaderType> selectByExample(ReaderTypeExample example);

    ReaderType selectByPrimaryKey(Integer readerTypeid);

    int updateByExampleSelective(@Param("record") ReaderType record, @Param("example") ReaderTypeExample example);

    int updateByExample(@Param("record") ReaderType record, @Param("example") ReaderTypeExample example);

    int updateByPrimaryKeySelective(ReaderType record);

    int updateByPrimaryKey(ReaderType record);
}