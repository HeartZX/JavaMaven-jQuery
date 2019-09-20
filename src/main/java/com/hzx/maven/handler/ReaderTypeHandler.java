package com.hzx.maven.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzx.maven.entity.ReaderType;
import com.hzx.maven.service.ReaderTypeService;
import com.hzx.maven.until.Msg;

@Controller
public class ReaderTypeHandler {
@Autowired

private ReaderTypeService readertypeservice;

@ResponseBody
@RequestMapping("/readertypes")
public Msg getReadertypes() {
	List< ReaderType> readertypes=readertypeservice.getAll();
	return Msg.success().add("readertypes", readertypes);
}



}
