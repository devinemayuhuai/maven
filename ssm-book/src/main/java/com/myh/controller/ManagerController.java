package com.myh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myh.pojo.Book;
import com.myh.pojo.Manager;
import com.myh.pojo.User;
import com.myh.service.ServiceImpl.BookServiceImpl;
import com.myh.service.ServiceImpl.ManagerServiceImpl;
import com.myh.service.ServiceImpl.UserServiceImpl;
import com.myh.utils.changeBook;
import com.myh.utils.changeUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ManagerController {

    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private BookServiceImpl bookServiceImpl;
    @Autowired
    private ManagerServiceImpl managerServiceImpl;
    @Autowired
    private changeUser changeUser;
    @Autowired
    private changeBook changeBook;

//    private List<User> list;

    @RequestMapping("adminlogin")
    public String adminlogin() {
        return "redirect:/pages/admin/page/login-1.html";
    }

    @ResponseBody
    @RequestMapping("/queryUser")
    public Map<String, Object> queryUser(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                         @RequestParam(value = "limit", required = false, defaultValue = "5") int limit
    ) {

        Map<String, Object> map = new HashMap<>();
        List<User> list=new ArrayList<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", 0);
        map.put("data", new ArrayList<User>());
        PageHelper.startPage(page, limit);
        list = userServiceImpl.queryUser();
        PageInfo pageInfo = new PageInfo(list);
        if (pageInfo != null) {
            map.put("count", pageInfo.getTotal());
            map.put("data", pageInfo.getList());
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("/addUser")
    public Integer addUser(@RequestBody() User user) {
      //  System.out.println(user);
        User user1 = userServiceImpl.existUsername(user.getUsername());
        int flag = 0;
        if (user1 == null) {
            flag = userServiceImpl.register(user);
        }
        return flag;
    }


    @ResponseBody
    @RequestMapping("/batchDelete")
    public Integer batchDelete(@RequestBody List<User> list1){
        list1.forEach(System.out::println);
        List<Integer> list2=new ArrayList<>();
          for (int i=0;i<list1.size();i++){
              System.out.println(list1.get(i).getId());
                list2.add(list1.get(i).getId());
          }
          int flag=0;
          if (list2!=null){
               flag=userServiceImpl.batchDelete(list2);
          }


        return flag;
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public Integer queryUserById(@RequestParam(value = "id") Integer id) {
        System.out.println(id);
        int flag=0;
         if (id==null){
             return flag;
         }else {
             flag = userServiceImpl.deleteUser(id);
             System.out.println("删除成功");
             return flag;
         }

    }

    @ResponseBody
    @RequestMapping("/updateUser")
    public Integer updateUser(@RequestBody User user) {
       // System.out.println(user);
        System.out.println(user);
           int flag=0;
           if(user!=null) {
               flag = userServiceImpl.updateUser(user);
             }
            return flag;
    }

    @ResponseBody
    @RequestMapping("/queryUserByTerm")
    public Map<String, Object> queryUserByTerm(@RequestParam(value = "page",required = false,defaultValue = "1")int page,
                                               @RequestParam(value = "limit",required = false,defaultValue = "15") int limit,
                                               @RequestParam(value = "username",required = false,defaultValue ="") String username,
                                               @RequestParam(value = "gender",required = false,defaultValue = "") String gender,
                                               @RequestParam(value = "email",required = false,defaultValue = "") String email
                                               ) {


        Map<String, Object> map = new HashMap<>();
        List<User> list=new ArrayList<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", 0);
        map.put("data", new ArrayList<User>());
        PageHelper.startPage(page, limit);
         User user=new User();
         user.setEmail(email);
         user.setUsername(username);
         user.setGender(gender);
        User user1=changeUser.change(user);
        list = userServiceImpl.queryUsers(user1);
        PageInfo pageInfo = new PageInfo(list);
        if (pageInfo != null) {
            map.put("count", pageInfo.getTotal());
            map.put("data", pageInfo.getList());
        }
        return map;
    }

    //主页展示信息
    @ResponseBody
    @RequestMapping("/display")
    public Map<String,Object> display(){
        Map map=new HashMap();
        int userCount=userServiceImpl.queryUserCount();
        map.put("usercount",userCount);
        int bookCount=bookServiceImpl.queryBookCount();
        map.put("bookcount",bookCount);

        return map;

    }

    //管理员登录
    @ResponseBody
    @RequestMapping("/managerLogin")
    public Map<String,Object>login(@RequestParam(value = "username",required = false)String username,@RequestParam(value = "password",required = false)String password){
//        System.out.println(username);
//        System.out.println(password);
        Map map=new HashMap();
        Manager manager=managerServiceImpl.login(username,password);
        if (manager!=null){
            map.put("toHref","../index.html");
            map.put("loginstate","success");
        }else {
            map.put("loginstate","error");
        }


        return map;
    }

    //图书管理展示图书信息
    @ResponseBody
    @RequestMapping("/queryBooks")
    public Map<String, Object> queryBooks(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                         @RequestParam(value = "limit", required = false, defaultValue = "15") int limit
    ) {

        Map<String, Object> map = new HashMap<>();
        List<Book> list=new ArrayList<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", 0);
        map.put("data", new ArrayList<User>());
        PageHelper.startPage(page, limit);
        list = bookServiceImpl.queryBooks();
        PageInfo pageInfo = new PageInfo(list);
        if (pageInfo != null) {
            map.put("count", pageInfo.getTotal());
            map.put("data", pageInfo.getList());
        }
        return map;
    }

    //添加用户
    @ResponseBody
    @RequestMapping("/addBook")
    public Integer addBook(@RequestBody() Book book) {
//       System.out.println(book);
        int flag = 0;
        if (book != null) {
            flag= bookServiceImpl.addBook(book);
        }
        return flag;
    }

    //批量删除图书
    @ResponseBody
    @RequestMapping("/batchDeleteBook")
    public Integer batchDeleteBook(@RequestBody List<User> list1){
        list1.forEach(System.out::println);
        List<Integer> list2=new ArrayList<>();
        for (int i=0;i<list1.size();i++){
//            System.out.println(list1.get(i).getId());
            list2.add(list1.get(i).getId());
        }
        int flag=0;
        if (list2!=null){
            flag=bookServiceImpl.batchDeleteBook(list2);
        }


        return flag;
    }
     //删除一条图书记录
    @ResponseBody
    @RequestMapping("/deleteBook")
    public Integer deleteBookById(@RequestParam(value = "id") Integer id) {
        int flag=0;
        if (id==null){
            return flag;
        }else {
            flag = bookServiceImpl.deleteBookById(id);
            return flag;
        }

    }


    @ResponseBody
    @RequestMapping("/updateBook")
    public Integer updateBook(@RequestBody(required = false) Book book) {
        int flag=0;
        if(book!=null) {
            flag =bookServiceImpl.updateBook(book);
        }
        return flag;
    }

    @ResponseBody
    @RequestMapping("/queryBookByTerm")
    public Map<String, Object> queryUserByTerm(@RequestParam(value = "page",required = false,defaultValue = "1")int page,
                                               @RequestParam(value = "limit",required = false,defaultValue = "5") int limit,
                                               @RequestParam(value = "name",required = false,defaultValue = "") String name,
                                               @RequestParam(value = "author",required = false,defaultValue = "") String author,
                                               @RequestParam(value = "press",required = false,defaultValue = "") String press,
                                               @RequestParam(value = "type",required = false,defaultValue = "") String type
                                               ) {



        Map<String, Object> map = new HashMap<>();
        List<Book> list=new ArrayList<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", 0);
        map.put("data", new ArrayList<Book>());
        PageHelper.startPage(page, limit);
        Book book=new Book();
        book.setName(name);
        book.setAuthor(author);
        book.setPress(press);
        book.setType(type);
        Book book1=changeBook.change(book);
        list = bookServiceImpl.queryBooksByTerm(book1);
        list.forEach(System.out::println);
        PageInfo pageInfo = new PageInfo(list);
        if (pageInfo != null) {
            map.put("count", pageInfo.getTotal());
            map.put("data", pageInfo.getList());
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("/updatepassword")
    public Map<String,Object> updatePassword1(@RequestParam(value = "oldpassword",required = false,defaultValue = "111") String oldpassword,@RequestParam(value = "newpassword",required = false) String newpassword){
          Map map=new HashMap();
          Manager manager=managerServiceImpl.queryManager("admin");

             String username="admin";
               if (oldpassword.equals(manager.getPassword())) {
                         int i=managerServiceImpl.updatePassword(newpassword, username);
                         map.put("state","success");
               }else {
                    map.put("state","error");
               }
        return map;
    }



}