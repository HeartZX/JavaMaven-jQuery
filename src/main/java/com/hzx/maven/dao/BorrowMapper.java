package com.hzx.maven.dao;

import com.hzx.maven.entity.Borrow;
import com.hzx.maven.entity.BorrowExample;
import java.util.List;

import com.hzx.maven.entity.po.BorrowPo;
import org.apache.ibatis.annotations.Param;

public interface BorrowMapper {
    int countByExample(BorrowExample example);

    int deleteByExample(BorrowExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    List<BorrowPo> getHotBook();

    List<Borrow> selectByExample(BorrowExample example);

    Borrow selectByPrimaryKey(Integer id);

    Borrow selectInfo(Borrow borrow);

    List<Borrow> selectUserBorrows(Borrow borrow);

    List<Borrow> selectByExampleWithAll(BorrowExample example);

    Borrow selectByPrimaryKeyWithAll(Integer id);

    int updateByExampleSelective(@Param("record") Borrow record, @Param("example") BorrowExample example);

    int updateByExample(@Param("record") Borrow record, @Param("example") BorrowExample example);

    int updateByPrimaryKeySelective(Borrow record);

    int updateByPrimaryKey(Borrow record);
}