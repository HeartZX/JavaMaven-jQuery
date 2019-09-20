package com.hzx.maven.dao;

import com.hzx.maven.entity.Reader;
import com.hzx.maven.entity.ReaderExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReaderMapper {
    int countByExample(ReaderExample example);

    int deleteByExample(ReaderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Reader record);
    int insertSelective(Reader record);

    List<Reader> selectByExample(ReaderExample example);

    Reader selectByPrimaryKey(Integer id);

    Reader selectReader(Reader reader);

    List<Reader> selectByExampleWithReaderType(ReaderExample example);

    Reader selectByPrimaryKeyWithReaderType(Integer id);

    int updateByExampleSelective(@Param("record") Reader record, @Param("example") ReaderExample example);

    int updateByExample(@Param("record") Reader record, @Param("example") ReaderExample example);

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);
}