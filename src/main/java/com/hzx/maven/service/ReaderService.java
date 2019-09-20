package com.hzx.maven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzx.maven.dao.ReaderMapper;
import com.hzx.maven.entity.Reader;
import com.hzx.maven.entity.ReaderExample;

@Service
public class ReaderService {

    @Autowired
    private ReaderMapper readerMapper;


    public List<Reader> getAll() {
        ReaderExample readerExample = new ReaderExample();
        readerExample.setOrderByClause("id");
        return readerMapper.selectByExampleWithReaderType(readerExample);
    }

    public Reader getReader(Integer id) {
        return readerMapper.selectByPrimaryKeyWithReaderType(id);
    }

    public void saveReader(Reader reader) {
        readerMapper.insertSelective(reader);
    }

    public boolean validateName(String name) {
        ReaderExample readerExample = new ReaderExample();
        com.hzx.maven.entity.ReaderExample.Criteria criteria = readerExample.createCriteria();
        //criteria.andNameEqualTo(name);
        long count = readerMapper.countByExample(readerExample);
        return count == 0;


    }


    public void updateReader(Reader reader) {
        readerMapper.updateByPrimaryKeySelective(reader);
    }

    public void deleteReader(Integer id) {
        readerMapper.deleteByPrimaryKey(id);
    }

    public void deleteReaderBatch(List<Integer> ids) {
        ReaderExample readerExample = new ReaderExample();
        com.hzx.maven.entity.ReaderExample.Criteria criteria = readerExample.createCriteria();
        criteria.andIdIn(ids);
        readerMapper.deleteByExample(readerExample);
    }

    public Reader getReaderInfo(Reader reader){
        return readerMapper.selectReader(reader);
    }

}
