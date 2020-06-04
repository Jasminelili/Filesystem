package com.springbootjsp.mapper;

import com.springbootjsp.pojo.FilesVersion;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface FilesVersionMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(FilesVersion record);

    int insertSelective(FilesVersion record);

    FilesVersion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FilesVersion record);

    int updateByPrimaryKey(FilesVersion record);

    List<FilesVersion> list(@Param("fid")Integer fid);
}