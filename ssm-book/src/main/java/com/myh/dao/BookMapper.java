package com.myh.dao;

import com.myh.pojo.Book;
import com.myh.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    //查询最新图书state=2
    public List<Book> queryNewBook();
    //查询热销图书sate=1
    public List<Book> queryHotBook();
    //查询折扣图书sate=0
    public List<Book> queryDiscountBook();

    //按书名搜索图书
    public List<Book> queryBookByName(String bookname);

    //按照价格区和书名间筛选图书
    public List<Book> queryBookByPrice(@Param("bookname") String bookname, @Param("min") int min, @Param("max") int max);

    //按照价格区间和1书的类型筛选图书
    public List<Book> queryBookByPriceForType(@Param("type")String type,@Param("min") int min,@Param("max") int max);

    //点击图片连接去购买图书时，先要根据id查询一下图书，再去页面展示
    public Book queryBookById(Integer id);

    //在点击去图书详情的时候获取图书类型去查找同类型到的推荐图书
    public List<Book> queryBookByType(String type);
    //按照书的类型查找图书
    public List<Book> queryBookByTypePlus(String type);

    //查询图书记录数
    public int queryBookCount();

    //查询所有的图书
    public List<Book> queryBooks();

    //添加图书
    public int addBook(Book book);

    //批量删除
    public int batchDeleteBook(List<Integer> list);

    //删除一条记录
     public int deleteBookById(Integer id);

     //修改图书信息
    public int updateBook(Book book);

    //根据多条件查询用户
    public List<Book> queryBooksByTerm(Book book);


}
