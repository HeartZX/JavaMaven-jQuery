package com.hzx.maven.service;

import java.util.List;

import com.hzx.maven.entity.po.BorrowPo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzx.maven.dao.BookMapper;
import com.hzx.maven.dao.BorrowMapper;
import com.hzx.maven.entity.Book;
import com.hzx.maven.entity.BookExample;
import com.hzx.maven.entity.Borrow;
import com.hzx.maven.entity.BorrowExample;
import com.hzx.maven.entity.Reader;
import com.hzx.maven.entity.ReaderExample;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BorrowService {

	@Autowired
	private BorrowMapper borrowMapper;

	public List<BorrowPo> getHotBook(){
		return borrowMapper.getHotBook();
	}

	public List<Borrow> getAll() {
		BorrowExample borrowExample = new BorrowExample();
		borrowExample.setOrderByClause("id");
		return borrowMapper.selectByExampleWithAll(borrowExample);
	}
	public Borrow getBorrow(Integer id) {
		return borrowMapper.selectByPrimaryKeyWithAll(id);
	}

	public Borrow getBorrowInfo(Borrow borrow) {
		return borrowMapper.selectInfo(borrow);
	}

	public List<Borrow> getUserBorrows(Borrow borrow) {
		return borrowMapper.selectUserBorrows(borrow);
	}

	
	public void saveBorrow(Borrow borrow) {
		borrowMapper.insertSelective(borrow);
	}
	
	public boolean validateName(String name) {
		BorrowExample borrowExample=new BorrowExample();
		com.hzx.maven.entity.BorrowExample.Criteria criteria=borrowExample.createCriteria();
		//criteria.andNameEqualTo(name);
		long count=borrowMapper.countByExample(borrowExample);
		return count==0;
		
		
	}
	
	
	public void updateBorrow(Borrow borrow) {
		borrowMapper.updateByPrimaryKeySelective(borrow);
	}
	public void deleteBorrow(Integer id) {
		borrowMapper.deleteByPrimaryKey(id);
	}
public void deleteBorrowBatch(List<Integer> ids) {
	BorrowExample borrowExample=new BorrowExample();
	com.hzx.maven.entity.BorrowExample.Criteria criteria=borrowExample.createCriteria();
	criteria.andIdIn(ids);
	borrowMapper.deleteByExample(borrowExample);
	}
}
