package com.springbootjsp.service.impl;

import com.springbootjsp.mapper.FilesVersionMapper;
import com.springbootjsp.pojo.FilesVersion;
import com.springbootjsp.service.FilesVersionIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhoufeng
 * @Date 2020/5/12 15:22
 * @Description
 */
@Service
public class FilesVersionService implements FilesVersionIService {
    
    @Autowired
    FilesVersionMapper filesVersionMapper;
    
    @Override
    public void insert(FilesVersion filesVersion) {
        filesVersionMapper.insert(filesVersion);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void edit(FilesVersion filesVersion) {
        filesVersionMapper.updateByPrimaryKeySelective(filesVersion);
    }

    @Override
    public FilesVersion find(int id) {
        return filesVersionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<FilesVersion> list(Integer fid) {
        return filesVersionMapper.list(fid);
    }
}
