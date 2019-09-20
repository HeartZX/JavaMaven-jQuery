package com.hzx.maven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hzx.maven.dao.ReaderTypeMapper;

import com.hzx.maven.entity.ReaderType;


@Service
public class ReaderTypeService {

@Autowired
private ReaderTypeMapper readertypeMapper;

public List< ReaderType> getAll(){
	 return readertypeMapper.selectByExample(null);
	 
}
public ReaderType getReadertype(Integer id) {
	return readertypeMapper.selectByPrimaryKey(id);
}

	
	
}
