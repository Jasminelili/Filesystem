package com.springbootjsp.service;

import com.springbootjsp.dto.FilesDto;
import com.springbootjsp.pojo.Files;

import java.util.List;

/**
 * 业务层接口
 * @author Administrator
 *
 */
public interface FilesIService {

	Integer insert(Files files);
	void delete(int id);
	void edit(Files files);
	Files find(int id);

	List<Files> list(Integer uid,Integer status);

	List<FilesDto> findPublicFiles(String keyword);

}
