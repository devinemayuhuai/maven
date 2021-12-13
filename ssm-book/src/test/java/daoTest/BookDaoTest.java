package daoTest;


import com.myh.dao.BookMapper;
import com.myh.pojo.Book;
import com.myh.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class BookDaoTest {
    @Autowired
    private BookMapper bookMapper;
    @Test
    public void test01(){
        System.out.println("新书");
        List<Book> list1=bookMapper.queryNewBook();
        list1.forEach(System.out::println);
        System.out.println("热销书");
        List<Book> list2=bookMapper.queryHotBook();
        list2.forEach(System.out::println);
        System.out.println("折扣书");
        List<Book> list3=bookMapper.queryDiscountBook();
        list3.forEach(System.out::println);

    }

    @Test
    public void test02(){
        List<Book> list=bookMapper.queryBookByPrice("汇编语言",10,50);
        list.forEach(System.out::println);

    }
    @Test
    public void test03(){
        Book book=bookMapper.queryBookById(21);
        System.out.println(book);

    }
    @Test
    public void test04(){
       List<Book> list= bookMapper.queryBookByType("文学");
        list.forEach(System.out::println);

    }
    @Test
    public void test05(){
        List<Book> list= bookMapper.queryBookByTypePlus("文学");
        list.forEach(System.out::println);

    }
    @Test
    public void test06(){
       Book book=bookMapper.queryBookById(21);
        System.out.println(book);

    }
    @Test
    public void test09(){
        int i=bookMapper.queryBookCount();
        System.out.println(i);
    }
    @Test
    public void test010(){
        List<Book> list=bookMapper.queryBooks();
        list.forEach(System.out::println);
    }
    @Test
    public void test011(){
        int i=bookMapper.addBook(new Book(null,"天龙八部","马玉怀",new BigDecimal(99),99,99,null,"文学",1,"马玉怀出版社",1));
    }
    @Test
    public void test012(){
        List<Book> list=bookMapper.queryBooksByTerm(new Book(null,"汇编语言","王爽",null,null,null,null,null,null,null,null));
        list.forEach(System.out::println);
    }

}
