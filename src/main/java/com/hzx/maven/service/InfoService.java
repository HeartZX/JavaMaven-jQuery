package com.hzx.maven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzx.maven.dao.InfoMapper;
import com.hzx.maven.entity.Info;
import com.hzx.maven.entity.InfoExample;

@Service
public class InfoService {
	@Autowired
	private InfoMapper infoMapper;
	
	
	public List<Info> getAll() {
		InfoExample infoExample=new InfoExample();
		infoExample.setOrderByClause("id");
		return infoMapper.selectByExample(null);
	}
	public Info getInfo(Integer id) {
		return infoMapper.selectByPrimaryKey(id);
	}
	
	public void saveInfo(Info info) {
		infoMapper.insertSelective(info);
	}
	
	public boolean validateName(String name) {
		InfoExample infoExample=new InfoExample();
		com.hzx.maven.entity.InfoExample.Criteria criteria=infoExample.createCriteria();
		//criteria.andNameEqualTo(name);
		long count=infoMapper.countByExample(infoExample);
		return count==0;
		
		
	}
	
	
	public void updateInfo(Info info) {
		infoMapper.updateByPrimaryKeySelective(info);
	}
	public void deleteInfo(Integer id) {
		infoMapper.deleteByPrimaryKey(id);
	}
public void deleteInfoBatch(List<Integer> ids) {
	InfoExample infoExample=new InfoExample();
	com.hzx.maven.entity.InfoExample.Criteria criteria=infoExample.createCriteria();
	criteria.andIdIn(ids);
	infoMapper.deleteByExample(infoExample);
	}
	
}
