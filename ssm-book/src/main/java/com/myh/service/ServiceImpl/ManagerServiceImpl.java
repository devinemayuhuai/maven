package com.myh.service.ServiceImpl;

import com.myh.dao.ManagerMapper;
import com.myh.pojo.Manager;
import com.myh.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {
   @Autowired
    private ManagerMapper managerMapper;

    @Override
    public Manager login(String username, String password) {
        return managerMapper.login(username,password);
    }

    @Override
    public Manager queryManager(String username) {
        return managerMapper.queryManager(username);
    }

    @Override
    public int updatePassword(String password, String username) {
         return managerMapper.updatePassword(password,username);
    }


}
