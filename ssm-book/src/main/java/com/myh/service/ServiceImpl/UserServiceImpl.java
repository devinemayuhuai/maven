package com.myh.service.ServiceImpl;

import com.myh.dao.UserMapper;
import com.myh.pojo.User;
import com.myh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private  UserMapper userMapper;

    @Override
    public List<User> queryUser() {
      return  userMapper.queryUser();
    }

    @Override
    public List<User> queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public int deleteUser(int id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User login(String username, String password) {
        return userMapper.login(username,password);
    }

    @Override
    public User existUsername(String username) {
        return userMapper.existUsername(username);
    }

    @Override
    public int register(User user) {
        return userMapper.register(user);
    }

    @Override
    public int batchDelete(List<Integer> list) {
        return userMapper.batchDelete(list);
    }

    @Override
    public List<User> queryUsers(User user) {
        return userMapper.queryUsers(user);
    }

    @Override
    public int queryUserCount() {
        return userMapper.queryUserCount();
    }


}
