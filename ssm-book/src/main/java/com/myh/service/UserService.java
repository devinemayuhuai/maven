package com.myh.service;

import com.myh.pojo.User;

import java.util.List;

public interface UserService {

    public List<User>  queryUser();

    public List<User> queryUserById(int id);

    public int deleteUser(int id);

    public int updateUser(User user);

    //登录
    public User login(String username,String password);

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
