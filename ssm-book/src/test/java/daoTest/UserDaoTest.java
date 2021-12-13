package daoTest;

import com.myh.dao.UserMapper;
import com.myh.pojo.Book;
import com.myh.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//使用@ContextConfiguration注解指定spring配置文件位置
import java.util.ArrayList;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"} )
public class UserDaoTest {
     @Autowired
    private UserMapper userMapper;


    //登录测试
    @Test
    public void test04(){
        User user=userMapper.login("1513673369","123456");
        System.out.println(user);
    }

    @Test
    public void test01(){
        List<User> list=userMapper.queryUser();
        list.forEach(System.out::println);
    }
    @Test
    public void test02(){
        List<User> list=userMapper.queryUserById(12);
        list.forEach(System.out::println);
    }
    @Test
    public void test03(){
        int i=userMapper.deleteUser(11);
        System.out.println(i);
    }

    @Test
    public void test05(){
        User user=userMapper.existUsername("1513673369");
        System.out.println(user);

    }
    @Test
    public void test06(){
        int i=userMapper.register(new User(null,"15812100818","123456","158121@qq.com",null,null,"男"));
        System.out.println(i);
    }

    @Test
    public void test07(){
        List list=new ArrayList();
        list.add(20);
        list.add(2);
        list.add(16);
        list.add(17);
        int i=userMapper.batchDelete(list);
        System.out.println(i);
    }
    @Test
    public void test08(){
        List<User> list=userMapper.queryUsers(new User(null,null,null,"1513673369@qq.com",null,null,"男"));
         list.forEach(System.out::println);
    }
    @Test
    public void test09(){
         int i=userMapper.queryUserCount();
        System.out.println(i);
    }



}

