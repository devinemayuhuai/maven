package com.myh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myh.pojo.Book;
import com.myh.service.ServiceImpl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    private BookServiceImpl bookServiceImpl;


    @RequestMapping("/getBooks")
    public String getBooks(Map<String,Object> map){
        List<Book> list1=bookServiceImpl.queryNewBook();
        List<Book> list2=bookServiceImpl.queryHotBook();
        List<Book> list3=bookServiceImpl.queryDiscountBook();
        map.put("newBook",list1);
        map.put("hotBook",list2);
        map.put("discountBook",list3);
        return "forward:/pages/cilent/index.jsp";

    }

    //该方法不仅按照名字搜索，还会按照图书类型进行搜索
    @RequestMapping("/queryBookByName")
    public String queryBookByName(@RequestParam(value = "bookname",required = false) String bookname,@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                                  @RequestParam(value = "limit",required = false,defaultValue = "12") int limit,
                                  @RequestParam(value = "booktype",required = false) String booktype,
                                  Map<String,Object> map
                                  ){
        System.out.println(bookname);
        System.out.println(page);
        System.out.println(limit);
        PageHelper.startPage(page, limit);
        List<Book> list=new ArrayList();
        if (booktype!=null){
             list=bookServiceImpl.queryBookByTypePlus(booktype);
            map.put("booktype",booktype);
        }else {
            list=bookServiceImpl.queryBookByName(bookname);
            map.put("bookname",bookname);
        }
        PageInfo pageInfo = new PageInfo(list);
        map.put("pagetotal",pageInfo.getTotal());
        map.put("bookitem",pageInfo.getList());

        map.put("curr",page);
        System.out.println("页面传过来的页数:"+page);
        return "forward:/pages/cilent/search.jsp";
    }

    @RequestMapping("/queryBookByPrice")
    public String queryBookByPrice(@RequestParam(value = "bookname",required = false) String bookname,
                                   @RequestParam(value = "min",required = false,defaultValue = "0") int min,
                                   @RequestParam(value = "max",required = false,defaultValue = "9999") int max,Map map,
                                   @RequestParam(value = "limit",required = false,defaultValue = "12") int limit,
                                   @RequestParam(value = "page",required = false,defaultValue = "1") int page,
                                   @RequestParam(value = "booktype",required = false) String booktype
                                   ){
         List<Book> list=new ArrayList<>();
        map.put("bookname",bookname);
        PageHelper.startPage(page, limit);
        if (bookname!=null) {
           list = bookServiceImpl.queryBookByPrice(bookname, min, max);
            map.put("bookname",bookname);
        }else {
            list=bookServiceImpl.queryBookByPriceForType(booktype,min,max);
            map.put("booktype",booktype);
        }
        PageInfo pageInfo = new PageInfo(list);
        map.put("pagetotal",pageInfo.getTotal());
        map.put("bookitem",pageInfo.getList());

        map.put("curr",page);
        //回显筛选价格
        map.put("minprice",min);
        map.put("maxprice",max);
//
        return "forward:/pages/cilent/search.jsp";
    }

    @RequestMapping("/buybook")
    public String queryBookById(@RequestParam("bookid") int bookid,@RequestParam("type") String type, Map map){
        Book book=bookServiceImpl.queryBookById(bookid);
        List<Book> list=bookServiceImpl.queryBookByType(type);
        map.put("bookinfo",book);
        map.put("recbook",list);
        return "forward:/pages/cilent/bookdetails.jsp";
    }

//    @RequestMapping("/queryBookByTypePlus")
//    public String queryBookByType(@RequestParam("type") String type,
//                                  @RequestParam(value = "page",required = false,defaultValue = "1") int page,
//                                  @RequestParam(value = "limit",required = false,defaultValue = "5") int limit,Map map
//                                  ){
//        PageHelper.startPage(page, limit);
//        List<Book> list=bookServiceImpl.queryBookByTypePlus(type);
//        PageInfo pageInfo = new PageInfo(list);
//        map.put("pagetotal",pageInfo.getTotal());
//        map.put("bookitem",pageInfo.getList());
//        map.put("curr",page);
//        map.put("booktype",type);
//        return "forward:/pages/cilent/search.jsp";
//    }


}
