package com.hzx.maven.test;




import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.UUID;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hzx.maven.service.BookService;
import com.hzx.maven.service.BorrowService;
import com.hzx.maven.service.InfoService;
import com.hzx.maven.service.ReaderService;
import com.hzx.maven.service.ReaderTypeService;

//import com.hzx.maven.dao.BookMapper;
//import com.hzx.maven.dao.BookTypeMapper;
//import com.hzx.maven.entity.Book;
//import com.hzx.maven.entity.BookType;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	private ApplicationContext applicationContext;
//	@Autowired
  // private BookMapper bookMapper;
@Autowired
//	private BookTypeMapper booktypeMapper;
//@Autowired
	private SqlSession sqlSession;
@Autowired
private ReaderService readerservice;
private BookService bookservice;

	
	//@Test
	//public void test() {
//DataSource dataSource=applicationContext.getBean(DataSource.class);
//System.out.println(dataSource);
//}
	
	
//	@Test
//	public void testAddBook() throws Exception {
	//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	//sdf.setLenient(false);
//	Book book=new Book(null,"水浒传",1,1,"施耐庵","新华","50");
//	 bookMapper.insertSelective(book);
		
	//}
//	@Test
	//public void testAddBooks() throws Exception {
	//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//sdf.setLenient(false);
	//Random random=new Random();
	//for(int i=0;i<500;i++) {
	//	String bookName=UUID.randomUUID().toString().substring(0, 5)+i;
//	Book book=new Book(null,bookName,1,1,"施耐庵","新华","50");
//	 bookMapper.insertSelective(book);
//	}	
//	}

@Test
	public void testgetInfo(){
		System.out.println(readerservice.getAll());
		
		
	}

}
	


