package com.myh.service;

import com.myh.pojo.Manager;

public interface ManagerService {

    //管理员登录
    public Manager login(String username, String password);

    //查询原来的密码
    public Manager queryManager(String username);
    //管理员修改密码
    public int updatePassword(String password,String username);


}
