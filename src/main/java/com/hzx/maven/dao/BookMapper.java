package com.hzx.maven.dao;

import com.hzx.maven.entity.Book;
import com.hzx.maven.entity.BookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookMapper {
    int countByExample(BookExample example);

    int deleteByExample(BookExample example);

    int deleteByPrimaryKey(Integer bookid);

    int insert(Book record);

    int insertSelective(Book record);

    List<Book> selectByExample(BookExample example);

    List<Book> selectBooks(Book book);

    Book selectByPrimaryKey(Integer bookid);

    List<Book> selectByExampleWithAll(BookExample example);

    Book selectByPrimaryKeyWithAll(Integer bookid);

    int updateByExampleSelective(@Param("record") Book record, @Param("example") BookExample example);

    int updateByExample(@Param("record") Book record, @Param("example") BookExample example);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
}