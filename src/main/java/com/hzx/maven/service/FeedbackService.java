package com.hzx.maven.service;

import com.hzx.maven.dao.FeedbackMapper;
import com.hzx.maven.entity.Feedback;
import com.hzx.maven.entity.po.FeedbackPo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;

    public boolean addFeedback(Feedback feedback){
        int i = feedbackMapper.insertSelective(feedback);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }

    public List<FeedbackPo> getAllFeedback(){
        return feedbackMapper.selectAllFeedback();
    }

    public boolean removeFeedback(Integer id){
        if(feedbackMapper.deleteByPrimaryKey(id)>0){
            return true;
        }else{
            return false;
        }
    }

    public Feedback getFeedbackInfo(Integer id){
        return feedbackMapper.selectByPrimaryKey(id);
    }


}
