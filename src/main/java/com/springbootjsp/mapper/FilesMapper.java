package com.springbootjsp.mapper;

import com.springbootjsp.dto.FilesDto;
import com.springbootjsp.pojo.Files;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FilesMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Files record);

    int insertSelective(Files record);

    Files selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Files record);

    int updateByPrimaryKey(Files record);

    List<Files> list(@Param("uid")Integer uid,@Param("status") Integer status);

    List<FilesDto> findPublicFiles(@Param("keyword") String keyword);
}