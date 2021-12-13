package com.myh.service;

import com.myh.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {
    //查询最新图书state=2
    public List<Book> queryNewBook();
    //查询热销图书sate=1
    public List<Book> queryHotBook();
    //查询折扣图书sate=0
    public List<Book> queryDiscountBook();

    //按照书名查图书
    public List<Book> queryBookByName(String bookname);

    //按照书名和价格区间筛选图书
    public List<Book> queryBookByPrice(String bookname,int min,int max);

    //按照价格区间和1书的类型筛选图书
    public List<Book> queryBookByPriceForType(String type, int min, int max);

    //点击连接查看图书时跳转到页面展示
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
