package com.myh.service.ServiceImpl;

import com.myh.dao.BookMapper;
import com.myh.pojo.Book;
import com.myh.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BookServiceImpl implements BookService {
    @Autowired
//    @Resource(name = "",type ="");
    private BookMapper bookMapper;

    @Override
    public List<Book> queryNewBook() {
        return bookMapper.queryNewBook();
    }

    @Override
    public List<Book> queryHotBook() {
        return bookMapper.queryHotBook();
    }

    @Override
    public List<Book> queryDiscountBook() {
        return bookMapper.queryDiscountBook();
    }

    @Override
    public List<Book> queryBookByName(String bookname) {
        return bookMapper.queryBookByName(bookname);
    }

    @Override
    public List<Book> queryBookByPrice(String bookname, int min, int max) {
        return bookMapper.queryBookByPrice(bookname,min,max);
    }

    @Override
    public List<Book> queryBookByPriceForType(String type, int min, int max) {
        return bookMapper.queryBookByPriceForType(type,min,max);
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Book> queryBookByType(String type) {
        return bookMapper.queryBookByType(type);
    }

    @Override
    public List<Book> queryBookByTypePlus(String type) {
       return bookMapper.queryBookByTypePlus(type);
    }

    @Override
    public int queryBookCount() {
        return bookMapper.queryBookCount();
    }

    @Override
    public List<Book> queryBooks() {
        return bookMapper.queryBooks();
    }

    @Override
    public int addBook(Book book) {
        return bookMapper.addBook(book);
    }

    @Override
    public int batchDeleteBook(List<Integer> list) {
        return bookMapper.batchDeleteBook(list);
    }

    @Override
    public int deleteBookById(Integer id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Book book) {
        return bookMapper.updateBook(book);
    }

    @Override
    public List<Book> queryBooksByTerm(Book book) {
        return bookMapper.queryBooksByTerm(book);
    }


}
