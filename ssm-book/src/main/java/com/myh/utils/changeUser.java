package com.myh.utils;

import com.myh.pojo.User;
import org.springframework.stereotype.Component;

@Component
public class changeUser {

    public User change(User user){
        User user1=new User();
        if ("".equals(user.getId())){
//            user1.setId();
        }else {
            user1.setId(user.getId());
        }
        //
        if ("".equals(user.getUsername())){
//            user1.setUsername(null);
        }else {
            user1.setUsername(user.getUsername());
        }

        if ("".equals(user.getGender())){
//            user1.setGender(null);
        }else{
            user1.setGender(user.getGender());
        }

        if ("".equals(user.getEmail())){
//            user1.setEmail(null);
        }else {
            user1.setEmail(user.getEmail());
        }
        return user1;
    }


}
