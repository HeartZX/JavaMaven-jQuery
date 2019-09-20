package com.hzx.maven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzx.maven.dao.BookMapper;
import com.hzx.maven.entity.Book;
import com.hzx.maven.entity.BookExample;




@Service
public class BookService {
	@Autowired
	private BookMapper bookMapper;
	public List<Book> getAll() {
	BookExample bookExample = new BookExample();
		bookExample.setOrderByClause("bookid");
		return bookMapper.selectByExampleWithAll(bookExample);
	}

	public List<Book> getBooks(Book book){
		return bookMapper.selectBooks(book);
	}

	public Book getBook(Integer bookid) {
		return bookMapper.selectByPrimaryKeyWithAll(bookid);
	}	
	
	public void saveBook(Book book) {
		bookMapper.insertSelective(book);
	}
	
	public boolean validateName(String name) {
		BookExample bookExample=new BookExample();
		com.hzx.maven.entity.BookExample.Criteria criteria=bookExample.createCriteria();
		//criteria.andNameEqualTo(name);
		long count=bookMapper.countByExample(bookExample);
		return count==0;
		
		
	}
	
	
	public void updateBook(Book book) {
		bookMapper.updateByPrimaryKeySelective(book);
	}
	public void deleteBook(Integer bookid) {
		bookMapper.deleteByPrimaryKey(bookid);
	}
public void deleteBookBatch(List<Integer> ids) {
	BookExample bookExample=new BookExample();
	com.hzx.maven.entity.BookExample.Criteria criteria=bookExample.createCriteria();
	criteria.andBookidIn(ids);
	bookMapper.deleteByExample(bookExample);
	}
	
	
}
