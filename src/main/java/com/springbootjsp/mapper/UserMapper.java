package com.springbootjsp.mapper;

import com.springbootjsp.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User findBuUsername(@Param("username") String username,@Param("role")Integer role);

    List<User> listByRole(@Param("role") Integer role);
}