package com.hzx.maven.handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzx.maven.entity.Info;

import com.hzx.maven.service.InfoService;

import com.hzx.maven.until.Msg;

@Controller
public class InfoHandler {
/*	@Autowired
	private InfoService infoService;
	
	@RequestMapping("/infos")
	public String list(Map<String, Object> map) {
		map.put("infos", infoService.getAll());
		return "info_list";
	}
	
	*/
	@Autowired
	private InfoService infoService;
	@ResponseBody
	@RequestMapping("/infos")
	public Msg getInfosWithJSON(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Map<String, Object> map) {
		
		PageHelper.startPage(pageNum,10);
		List<Info> infos=infoService.getAll();
		PageInfo<Info> pageInfo=new PageInfo<Info>(infos,5);
		
		map.put("page",pageInfo);
		return  Msg.success().add("page", pageInfo);
	}

	@ResponseBody
	@RequestMapping("/getInfo")
	public Msg getInfo() {
		List<Info> infos=infoService.getAll();
		if(infos != null && infos.size()>0){
            Info info = infos.get(0);
            return Msg.success().add("info", info);
        }else{
            return Msg.fail();
        }
	}

    @ResponseBody
    @RequestMapping("/getInfoById")
    public Msg getInfoById(Integer id) {
        Info info = infoService.getInfo(id);
        return Msg.success().add("info",info);
    }

    @ResponseBody
    @RequestMapping("/modifyInfo")
    public Msg modifyInfo(Info info) {
        infoService.updateInfo(info);
        return null;
    }
	
	
}
