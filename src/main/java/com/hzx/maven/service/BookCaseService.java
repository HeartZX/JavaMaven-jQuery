package com.hzx.maven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzx.maven.dao.BookCaseMapper;

import com.hzx.maven.entity.BookCase;

@Service
public class BookCaseService {
	@Autowired
	private BookCaseMapper bookcaseMapper;

	public List<BookCase> getAll() {
		return bookcaseMapper.selectByExample(null);

	}

	public BookCase getReadercase(Integer id) {
		return bookcaseMapper.selectByPrimaryKey(id);
	}
}
