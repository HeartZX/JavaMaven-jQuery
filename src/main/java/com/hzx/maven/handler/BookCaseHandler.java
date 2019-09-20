package com.hzx.maven.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzx.maven.entity.BookCase;

import com.hzx.maven.service.BookCaseService;

import com.hzx.maven.until.Msg;

@Controller
public class BookCaseHandler {
	@Autowired

	private BookCaseService bookcaseservice;

	@ResponseBody
	@RequestMapping("/bookcases")
	public Msg getBookcases() {
		List< BookCase> bookcases=bookcaseservice.getAll();
		return Msg.success().add("bookcases", bookcases);
	}
}
