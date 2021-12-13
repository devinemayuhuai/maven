package com.myh.dao;

import com.myh.pojo.Manager;
import org.apache.ibatis.annotations.Param;

public interface ManagerMapper {
     //管理员登录
    public Manager login(@Param("username") String username,@Param("password") String password);

    //管理员修改账户信息
    public int updateManager(Manager manager);

    //查询原来的密码
    public Manager queryManager(String username);
    //管理员修改密码
    public int updatePassword(@Param("password") String password,@Param("username") String username);
}
