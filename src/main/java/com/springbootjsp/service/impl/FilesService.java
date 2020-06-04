package com.springbootjsp.service.impl;

import com.springbootjsp.dto.FilesDto;
import com.springbootjsp.mapper.FilesMapper;
import com.springbootjsp.pojo.Files;
import com.springbootjsp.service.FilesIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhoufeng
 * @Date 2020/5/12 15:22
 * @Description
 */
@Service
public class FilesService implements FilesIService {

    @Autowired
    FilesMapper filesMapper;

    @Override
    public Integer insert(Files files) {
        return filesMapper.insert(files);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void edit(Files files) {
        filesMapper.updateByPrimaryKeySelective(files);
    }

    @Override
    public Files find(int id) {
        return filesMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Files> list(Integer uid,Integer status) {
        return filesMapper.list(uid,status);
    }

    @Override
    public List<FilesDto> findPublicFiles(String keyword) {
        return filesMapper.findPublicFiles(keyword);
    }
}
