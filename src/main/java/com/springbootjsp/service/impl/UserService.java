package com.springbootjsp.service.impl;

import com.springbootjsp.mapper.UserMapper;
import com.springbootjsp.pojo.User;
import com.springbootjsp.service.UserIService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 业务层实现类
 * @author Administrator
 *
 */

@Service
public class UserService implements UserIService {

	@Resource 
	private UserMapper userMapper;
	
	@Override
	public void insert(User user) {
		userMapper.insert(user);
	}

	@Override
	public void delete(int id) {
		userMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void edit(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User find(int id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public User findBuUsername(String username,Integer role) {
		return userMapper.findBuUsername(username ,role);
	}

	@Override
	public List<User> listByRole(Integer role) {
		return userMapper.listByRole(role);
	}

}
