package com.hzx.maven.dao;

import com.hzx.maven.entity.Feedback;
import com.hzx.maven.entity.po.FeedbackPo;

import java.util.List;

public interface FeedbackMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(Integer id);

    List<FeedbackPo> selectAllFeedback();

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKey(Feedback record);
}