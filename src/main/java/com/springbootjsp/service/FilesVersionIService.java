package com.springbootjsp.service;

import com.springbootjsp.pojo.FilesVersion;

import java.util.List;

/**
 * 业务层接口
 * @author Administrator
 *
 */
public interface FilesVersionIService {
	
	void insert(FilesVersion filesVersion);
	void delete(int id);
	void edit(FilesVersion filesVersion);
	FilesVersion find(int id);

	List<FilesVersion> list(Integer fid);

}
