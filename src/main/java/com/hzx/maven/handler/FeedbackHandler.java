package com.hzx.maven.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzx.maven.entity.Admin;
import com.hzx.maven.entity.Feedback;
import com.hzx.maven.entity.Info;
import com.hzx.maven.entity.Reader;
import com.hzx.maven.entity.po.FeedbackPo;
import com.hzx.maven.service.FeedbackService;
import com.hzx.maven.service.InfoService;
import com.hzx.maven.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class FeedbackHandler {

	@Autowired
	private FeedbackService feedbackService;

	@ResponseBody
	@RequestMapping("/saveFeedBack")
	public Msg saveFeedBack(Feedback feedback, HttpServletRequest request) {
		Reader readerInfo = (Reader)request.getSession().getAttribute("readerInfo");
		feedback.setRdId(readerInfo.getId());
		feedback.setFbTime(new Date());
		if(feedbackService.addFeedback(feedback)){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}

	@ResponseBody
	@RequestMapping("/getAllFeedback")
	public Msg getAllFeedback(@RequestParam(value="pn",defaultValue="1") Integer pageNum) {
		PageHelper.startPage(pageNum,10);
        List<FeedbackPo> allFeedback = feedbackService.getAllFeedback();
        PageInfo<FeedbackPo> pageInfo=new PageInfo<FeedbackPo>(allFeedback,10);

		return  Msg.success().add("page", pageInfo);
	}

    @ResponseBody
    @RequestMapping("/removeFeedback")
    public Msg removeFeedback(Integer[] ids) {
        for (int i:ids) {
            feedbackService.removeFeedback(i);
        }
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping("/getFeedbackInfo")
    public Msg getFeedbackInfo(Integer id) {
        Feedback feedbackInfo = feedbackService.getFeedbackInfo(id);
        return Msg.success().add("feedbackInfo",feedbackInfo);
    }


	
	
}
