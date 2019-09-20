package com.hzx.maven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzx.maven.dao.BookTypeMapper;

import com.hzx.maven.entity.BookType;

@Service
public class BookTypeService {

	@Autowired
	private BookTypeMapper booktypeMapper;

	public List<BookType> getAll() {
		return booktypeMapper.selectByExample(null);

	}

	public BookType getBookType(Integer id) {
		return booktypeMapper.selectByPrimaryKey(id);
	}
}
