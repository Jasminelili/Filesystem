package com.springbootjsp.service;

import com.springbootjsp.pojo.User;

import java.util.List;

/**
 * 业务层接口
 * @author Administrator
 *
 */
public interface UserIService {
	
	void insert(User user);
	void delete(int id);
	void edit(User user);
	User find(int id);

	User findBuUsername(String username,Integer role);

	List<User> listByRole(Integer role);

}
