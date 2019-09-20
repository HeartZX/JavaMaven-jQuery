package com.hzx.maven.handler;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.hzx.maven.entity.Book;
import com.hzx.maven.entity.BookType;
import com.hzx.maven.entity.Reader;
import com.hzx.maven.service.BookService;
import com.hzx.maven.service.BookTypeService;
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

import com.hzx.maven.entity.Borrow;

import com.hzx.maven.service.BorrowService;
import com.hzx.maven.until.Msg;

@Controller
public class BorrowHandler {

	
	@Autowired
	private BorrowService borrowService;

	@Autowired
    private BookService bookService;

	@Autowired
    private BookTypeService bookTypeService;

	//用户借阅接口
	@ResponseBody
	@RequestMapping("/borrow")
	public Msg borrow(Book book, HttpServletRequest request) {
		Reader readerInfo = (Reader)request.getSession().getAttribute("readerInfo");
		if (readerInfo==null){
			return Msg.error("借阅失败，用户未登录");
		}else{
		    //获取书籍完整信息
            Book bookInfo = bookService.getBook(book.getBookid());
            if(book.getBorrowsum() == 0){
		        return Msg.error("借阅失败，该书籍已没有库存了");
            }
			//查询该用户是否借过这本书
            Borrow borrow = new Borrow();
            borrow.setBookId(bookInfo.getBookid());
            borrow.setReaderId(readerInfo.getId());
            borrow.setIsreturn(0);//未还状态
            Borrow borrowInfo = borrowService.getBorrowInfo(borrow);
            if(borrowInfo!=null){
                //该用户已借这本书
                return Msg.error("借阅失败，您已借过这本书并未归还，看看其他书吧！");
            }else{
                //新建借书记录
                borrow.setBorrowtime(new Date());
                //查询该书籍可借多少天，并计算归还时间
                BookType bookType = bookTypeService.getBookType(bookInfo.getTypeid());
                Calendar cal = Calendar.getInstance();
                cal.setTime(new Date());
                cal.add(Calendar.DATE,bookType.getBorrowday());
                borrow.setReturntime(cal.getTime());
                borrowService.saveBorrow(borrow);
				bookInfo.setBorrowsum(bookInfo.getBorrowsum()-1);
                bookService.updateBook(bookInfo);
                return Msg.success();
            }
        }
	}

	@ResponseBody
	@RequestMapping("/getBorrowInfo")
	public Msg getBorrowInfo(@RequestParam Integer id){
        Borrow borrow = new Borrow();
        borrow.setId(id);
        Borrow borrowInfo = borrowService.getBorrowInfo(borrow);
        return Msg.success().add("borrowInfo",borrowInfo);
	}

	@ResponseBody
	@RequestMapping("/modifyBorrow")
	public Msg modifyBorrow(Borrow borrow){
		borrowService.updateBorrow(borrow);
		//判断是否确认还书操作
		if(borrow.getIsreturn() == 2){
            //查询借书详情
            Borrow borrow1 = new Borrow();
            borrow1.setId(borrow.getId());
            Borrow borrowInfo = borrowService.getBorrowInfo(borrow1);
            //图书库存加1
			Book bookInfo = bookService.getBook(borrowInfo.getBookId());
			bookInfo.setBorrowsum(bookInfo.getBorrowsum()+1);
			bookService.updateBook(bookInfo);
		}
		return Msg.success();
	}

	//续借接口
	@ResponseBody
	@RequestMapping("/continueBorrow")
	public Msg continueBorrow(Borrow borrow){
	    //获取借书信息
        Borrow borrow1 = new Borrow();
        borrow1.setId(borrow.getId());
        Borrow borrowInfo = borrowService.getBorrowInfo(borrow1);
        //获取图书信息
        Book bookInfo = bookService.getBook(borrowInfo.getBookId());
        //获取图书类别
        //查询该书籍可借多少天，并计算归还时间
        BookType bookType = bookTypeService.getBookType(bookInfo.getTypeid());
        Calendar cal = Calendar.getInstance();
        cal.setTime(borrowInfo.getReturntime());
        cal.add(Calendar.DATE,bookType.getBorrowday());
        borrowInfo.setReturntime(cal.getTime());
        //更新借书信息
		borrowService.updateBorrow(borrowInfo);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping("/borrows")
	public Msg getReadersWithJSON(@RequestParam(value="pn",defaultValue="1") Integer pageNum,Map<String, Object> map) {
		PageHelper.startPage(pageNum,10);
		List<Borrow> borrows=borrowService.getAll();
		PageInfo<Borrow> pageInfo=new PageInfo<Borrow>(borrows,10);
		map.put("page",pageInfo);
		return  Msg.success().add("page", pageInfo);
	}

	//获取登录着的用户未还图书
	@ResponseBody
	@RequestMapping("/userBorrows")
	public Msg userBorrows(@RequestParam(value="pn",defaultValue="1") Integer pageNum,HttpServletRequest request) {
        Reader readerInfo = (Reader)request.getSession().getAttribute("readerInfo");
		PageHelper.startPage(pageNum,10);
        Borrow borrow = new Borrow();
        borrow.setReaderId(readerInfo.getId());
        borrow.setIsreturn(0);
        List<Borrow> userBorrows = borrowService.getUserBorrows(borrow);
        PageInfo<Borrow> pageInfo=new PageInfo<Borrow>(userBorrows,10);
		return  Msg.success().add("page", pageInfo);
	}
	
	@ResponseBody
	@RequestMapping(value="/bor", method=RequestMethod.POST)
	public Msg save(@Valid Borrow borrow,BindingResult result) {
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
			borrowService.saveBorrow(borrow);
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
	@RequestMapping(value="/bor/{ids}", method=RequestMethod.DELETE)
	private Msg delete(@PathVariable("ids") String ids) {
		if (ids.contains(",")) {
			String[]strIds=ids.split(",");
			List<Integer>reaIds=new ArrayList<>();
			for(String s:strIds) {
				reaIds.add(Integer.parseInt(s));
				
			}
		//	readerService.deleteReaderBatch(ids);
		}else {
			Integer id=Integer.parseInt(ids);
			borrowService.deleteBorrow(id);
		}
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/bor/{id}",method=RequestMethod.GET)
	public Msg getBorrow(@PathVariable("id")Integer id) {
	Borrow borrow=borrowService.getBorrow(id);
		
		return Msg.success().add("borrow", borrow);
	}
	
	/*@ResponseBody
	@RequestMapping("/checkName")
	public Msg checkName(@RequestParam("borName") String name) {
		String regxName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,8}$)";
		if (!name.matches(regxName)) {
			return Msg.fail().add("va_name", "");
		}
		
		boolean flag=borrowService.validateName(name);
		if (flag) {
			return Msg.success().add("va_name", "");
		}else {
			return Msg.fail().add("va_name", "");
		}
		//return flag==true?Msg.success():Msg.fail();
		
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="/bor/{id}", method=RequestMethod.PUT)
	public Msg updateReader(@Valid Borrow borrow,BindingResult result) {
		
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
			borrowService.updateBorrow(borrow);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return Msg.fail().add("errors", e.getMessage());
		}
		
	}
	
	
}
