package com.hzx.maven.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzx.maven.entity.BookType;

import com.hzx.maven.service.BookTypeService;

import com.hzx.maven.until.Msg;
@Controller
public class BookTypeHandler {
	@Autowired

	private BookTypeService booktypeservice;

	@ResponseBody
	@RequestMapping("/booktypes")
	public Msg getBooktypes() {
		List< BookType> booktypes=booktypeservice.getAll();
		return Msg.success().add("booktypes", booktypes);
	}
}
