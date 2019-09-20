package com.hzx.maven.handler;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzx.maven.entity.Reader;
import com.hzx.maven.service.ReaderService;
import com.hzx.maven.until.Msg;

@Controller
public class ReaderHandler {

	@Autowired
	private ReaderService readerService;

	@ResponseBody
	@RequestMapping("/readers")
	public Msg getReadersWithJSON(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Map<String, Object> map) {
		
		PageHelper.startPage(pageNum,8);
		List<Reader> readers=readerService.getAll();
		PageInfo<Reader> pageInfo=new PageInfo<Reader>(readers,8);
		
		map.put("page",pageInfo);
		return  Msg.success().add("page", pageInfo);
		
		}
	@ResponseBody
	@RequestMapping(value="/rea", method=RequestMethod.POST)
	public Msg save(@Valid Reader reader,BindingResult result) {
		if (result.getErrorCount()>0) {
			Map<String, Object> errors =new HashMap<String,Object>();
			System.out.println("");
			for(FieldError error:result.getFieldErrors()) {
				System.out.println(error.getField()+":"+error.getDefaultMessage());
			errors.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("errors", errors);
		}
		try {
			readerService.saveReader(reader);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return Msg.fail().add("errors", e.getMessage());
	}
		
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/rea/{ids}", method=RequestMethod.DELETE)
	private Msg delete(@PathVariable("ids") String ids) {
		if (ids.contains(",")) {
			String[]strIds=ids.split(",");
			List<Integer>reaIds=new ArrayList<>();
			for(String s:strIds) {
				reaIds.add(Integer.parseInt(s));
				}
		     readerService.deleteReaderBatch(reaIds);
		}else {
			Integer id=Integer.parseInt(ids);
			readerService.deleteReader(id);
		}
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/rea/{id}",method=RequestMethod.GET)
	public Msg getReader(@PathVariable("id")Integer id) {
		Reader reader=readerService.getReader(id);
		
		return Msg.success().add("reader", reader);
	}
	
	@ResponseBody
	@RequestMapping("/checkName")
	public Msg checkName(@RequestParam("reaName") String name) {
		String regxName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,8}$)";
		if (!name.matches(regxName)) {
			return Msg.fail().add("va_name", "");
		}
		
		boolean flag=readerService.validateName(name);
		if (flag) {
			return Msg.success().add("va_name", "");
		}else {
			return Msg.fail().add("va_name", "");
		}
		//return flag==true?Msg.success():Msg.fail();
		
	}
	
	@ResponseBody
	@RequestMapping(value="/rea/{id}", method=RequestMethod.PUT)
	public Msg updateReader(@Valid Reader reader,BindingResult result) {
		
		if (result.getErrorCount()>0) {
			Map<String, Object> errors =new HashMap<String,Object>();
			System.out.println("");
			for(FieldError error:result.getFieldErrors()) {
				System.out.println(error.getField()+":"+error.getDefaultMessage());
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("errors", errors);
		}
		try {
			readerService.updateReader(reader);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return Msg.fail().add("errors", e.getMessage());
		}
		
	}

	//用户登录
	@ResponseBody
	@RequestMapping(value="/userLogin")
	public Msg userLogin(Reader reader, HttpServletRequest request){
        Reader readerInfo = readerService.getReaderInfo(reader);
        if(readerInfo!=null){
            request.getSession().setAttribute("readerInfo",readerInfo);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

	//用户退出
	@ResponseBody
	@RequestMapping(value="/userOut")
	public void userOut(Reader reader, HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute("readerInfo");
		try {
			response.sendRedirect("/index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



    //获取已登录的用户信息
	@ResponseBody
	@RequestMapping(value="/getLoginUser")
	public Msg getLoginUser(HttpServletRequest request){
		Reader readerInfo = (Reader)request.getSession().getAttribute("readerInfo");
		return Msg.success().add("info",readerInfo);
    }

	
	
	
	

	
	
	
	
	
	//@RequestMapping("/readers")
	//public String list(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Map<String, Object> map) {
	//	
	//	PageHelper.startPage(pageNum,8);
	//	List<Reader> readers=readerService.getAll();
	//	PageInfo<Reader> pageInfo=new PageInfo<Reader>(readers,5);
		
	//	map.put("page",pageInfo);
	//	return "reader_list";
	//}
}
