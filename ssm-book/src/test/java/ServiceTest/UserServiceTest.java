package ServiceTest;

import com.myh.pojo.User;
import com.myh.service.ServiceImpl.UserServiceImpl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserServiceTest {

    @Autowired
    private UserServiceImpl userServiceImpl;
    @Test
    public void test01(){
        List<User> list=userServiceImpl.queryUser();
        list.forEach(System.out::println);
    }
     @Test
    public void test02(){
        List<User> list=userServiceImpl.queryUserById(12);
        list.forEach(System.out::println);
    }
    //登录测试
    @Test
    public void test03(){
        User user=userServiceImpl.login("1513673369","123456");
        System.out.println(user);
    }

}