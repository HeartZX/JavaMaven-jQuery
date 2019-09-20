package com.hzx.maven.dao;

import com.hzx.maven.entity.BookCase;
import com.hzx.maven.entity.BookCaseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookCaseMapper {
    int countByExample(BookCaseExample example);

    int deleteByExample(BookCaseExample example);

    int deleteByPrimaryKey(Integer caseid);

    int insert(BookCase record);

    int insertSelective(BookCase record);

    List<BookCase> selectByExample(BookCaseExample example);

    BookCase selectByPrimaryKey(Integer caseid);

    int updateByExampleSelective(@Param("record") BookCase record, @Param("example") BookCaseExample example);

    int updateByExample(@Param("record") BookCase record, @Param("example") BookCaseExample example);

    int updateByPrimaryKeySelective(BookCase record);

    int updateByPrimaryKey(BookCase record);
}