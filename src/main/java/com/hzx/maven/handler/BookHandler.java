package com.hzx.maven.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import com.hzx.maven.entity.po.BorrowPo;
import com.hzx.maven.service.BorrowService;
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
import com.hzx.maven.entity.Book;

import com.hzx.maven.service.BookService;

import com.hzx.maven.until.Msg;

@Controller
public class BookHandler {
	@Autowired
	private BookService bookService;

	@Autowired
	private BorrowService borrowService;

	@ResponseBody
	@RequestMapping("/books")
	public Msg getReadersWithJSON(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Map<String, Object> map) {
		PageHelper.startPage(pageNum,10);
		List<Book> books=bookService.getAll();
		PageInfo<Book> pageInfo=new PageInfo<Book>(books,10);
		map.put("page",pageInfo);
		return  Msg.success().add("page", pageInfo);
	}

	@ResponseBody
	@RequestMapping("/getBookList")
	public Msg getBookList(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Book book,Map<String, Object> map) {
		PageHelper.startPage(pageNum,15);
		List<Book> books=bookService.getBooks(book);
		PageInfo<Book> pageInfo=new PageInfo<Book>(books,15);
		map.put("page",pageInfo);
		return  Msg.success().add("page", pageInfo);
	}

	@ResponseBody
	@RequestMapping("/getHotBookList")
	public Msg getHotBookList(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Map<String, Object> map) {
		PageHelper.startPage(pageNum,15);
		List<BorrowPo> hotBook = borrowService.getHotBook();
		PageInfo<BorrowPo> pageInfo=new PageInfo<BorrowPo>(hotBook,15);
		map.put("page",pageInfo);
		return  Msg.success().add("page", pageInfo);
	}

	@ResponseBody
	@RequestMapping(value="/boo", method=RequestMethod.POST)
	public Msg save(@Valid Book book,BindingResult result) {
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
			bookService.saveBook(book);
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
	@RequestMapping(value="/boo/{ids}", method=RequestMethod.DELETE)
	private Msg delete(@PathVariable("ids") String ids) {
		if (ids.contains(",")) {
			String[]strIds=ids.split(",");
			List<Integer>booIds=new ArrayList<>();
			for(String s:strIds) {
				booIds.add(Integer.parseInt(s));
				
			}
			bookService.deleteBookBatch(booIds);
		}else {
			Integer id=Integer.parseInt(ids);
			bookService.deleteBook(id);
		}
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/boo/{id}",method=RequestMethod.GET)
	public Msg getBook(@PathVariable("id")Integer id) {
		Book book=bookService.getBook(id);
		
		return Msg.success().add("book", book);
	}
	
/*	@ResponseBody
	@RequestMapping("/checkName")
	public Msg checkName(@RequestParam("booName") String name) {
		String regxName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,8}$)";
		if (!name.matches(regxName)) {
			return Msg.fail().add("va_name", "");
		}
		
		boolean flag=bookService.validateName(name);
		if (flag) {
			return Msg.success().add("va_name", "");
		}else {
			return Msg.fail().add("va_name", "");
		}
		//return flag==true?Msg.success():Msg.fail();
		
	}
	
	*/
	
	@ResponseBody
	@RequestMapping(value="/boo/{bookid}", method=RequestMethod.PUT)
	public Msg updateBook(@Valid Book book,BindingResult result) {
		
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
			bookService.updateBook(book);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return Msg.fail().add("errors", e.getMessage());
		}
		
	}
	

	
}
