package daoTest;


import com.myh.dao.ManagerMapper;
import com.myh.pojo.Book;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class managerDaoTest {

    @Autowired
    private ManagerMapper managerMapper;

    @Test
    public void test01(){
        managerMapper.updatePassword("654321","admin");

    }




}
