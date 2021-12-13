package com.myh.dao;

import com.myh.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

public interface UserMapper {

    //查询所有用户
    public List<User> queryUser();

    //根据id查用户
    public List<User> queryUserById(int id);



    //根据用户id删除用户
    public int deleteUser(int id);

    //更新用户数据
    public int updateUser(User user);

    //登录
    public User login(@Param("username") String username, @Param("password") String password);

    //查找用户名是否可用
    public User existUsername(String username);

    //注册插入数据
    public int register(User user);

    //批量删除
    public int batchDelete(List<Integer> list);

    //根据多条件查询用户
    public List<User> queryUsers(User user);

    //查询用户记录数
    public int queryUserCount();

}

