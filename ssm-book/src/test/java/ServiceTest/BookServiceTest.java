package ServiceTest;

import com.myh.dao.BookMapper;
import com.myh.pojo.Book;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class BookServiceTest {
    @Autowired
    private BookMapper bookMapper;

    @Test
    public void test01(){
        List<Book> list =bookMapper.queryBookByPrice("汇编语言",10,50);
        list.forEach(System.out::println);
    }
    @Test
    public void test02(){
        List<Book> list =bookMapper.queryBookByTypePlus("文学");
        list.forEach(System.out::println);
    }
    @Test
    public void test03(){
       Book book=bookMapper.queryBookById(21);
        System.out.println(book);
    }
}
