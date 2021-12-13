package com.myh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.code.kaptcha.Constants;
import com.google.gson.Gson;
import com.myh.pojo.User;
import com.myh.service.ServiceImpl.UserServiceImpl;
import com.myh.utils.sendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.sql.Date;
import java.util.*;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private sendEmail sendemail;

    private List<User> list;

    /**
     * 登录
     * @param map 接收客户端发送过来的数据
     * @param session 用于向session中保存用户登录信息
     * @return
     */

    @ResponseBody
    @RequestMapping("/login")
    public Map login(@RequestBody HashMap<String, String> map,HttpSession session){
         Map map2=new HashMap();
          String username=map.get("username");
          String password=map.get("password");
        User user=userServiceImpl.login(username,password);
        if (user!=null){
//                 sendemail.sendEmailAtLogin(user.getUsername(),user.getEmail());
                 session.setAttribute("userinfo",user);
                 map2.put("loginstate",200);

        }else {
                map2.put("loginstate",400);
        }
        return map2;
    }

    @ResponseBody
    @RequestMapping("/sendEmail")
    public void sendEmail(@RequestParam("username")String username){
        User user=userServiceImpl.existUsername(username);
        sendemail.sendEmailAtLogin(user.getUsername(),user.getEmail());
    }

    /**
     * 用于实现注册的跳板，不然页面组件不会刷新
     * @return
     */
    @RequestMapping("/toregister")
    public String toregister( ){
         return "forward:/pages/user/register.jsp";
    }


    /**
     * 注册功能的实现
     * @param user 接收注册页面发送过来的注册信息并将其封装为一个用户对象
     * @param result 用于后端校验时错误信息的接收
     * @param tokencode //注册页面用户填写的验证码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/register")
    public Map<String,Object> register(@Valid @RequestBody User user,BindingResult result,@RequestParam(value = "tokencode",required = false) String tokencode, HttpServletRequest request
                           ){
        String token=(String) request.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        request.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        User existUser= userServiceImpl.existUsername(user.getUsername());
         Map<String,Object> map=new HashMap();
         if (token.equals(tokencode)){
             if (existUser==null) {
                 if (result.hasErrors()) {
                      map.put("registerState","beanError");
                     List<FieldError> errors = result.getFieldErrors();
                     for (FieldError fieldError : errors)
                        {
                         map.put(fieldError.getField(), fieldError.getDefaultMessage());
                        }
                 } else {
                       //先数据库保存消息
                       userServiceImpl.register(user);
                       map.put("registerState","success");
                 }
             }else {
                         map.put("registerState","exist");
                   }
             map.put("msg","验证码一致");
         }else {
             map.put("registerState","codeError");

         }
        return map;
    }


    /**
     * 检查用户名是否可用
     * @param username
     * @return
     */
  @ResponseBody
  @RequestMapping("/existusername")
   public Integer existUsername(@RequestParam("username") String username){
        User user= userServiceImpl.existUsername(username);
         int flag=1;

        if (user!=null){
            flag=0;
        }else {
            flag=1;
        }
         return flag;

   }

    /**
     * 退出登录清空session中的信息
     * @param request
     * @return
     */
    @RequestMapping("/loginout")
    public  String logout(HttpServletRequest request)  {
        request.getSession().invalidate();
         return "forward:/getBooks";
    }




//
//    @RequestParam("username") String username, @RequestParam("password") String password,
//    @RequestParam("confirmpassword") String confirmpassword, @RequestParam("email") String email,
//    @RequestParam("gender") String gender, @RequestParam("birth")Date date,
//    @RequestParam("verifytoken")
//    @ResponseBody
//    @RequestMapping("/queryUser")
//    public Map<String, Object> queryUser(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
//                                         @RequestParam(value = "limit", required = false, defaultValue = "5") int limit
//    ) {
//
//        Map<String, Object> map = new HashMap<>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count", 0);
//        map.put("data", new ArrayList<User>());
//        PageHelper.startPage(page, limit);
//        //  if (id==null) {
//        list = userServiceImpl.queryUser();
//        //  }
//        //  else {
//        //    list=userServiceImpl.queryUserById(id);
//        // }
//
//
//        PageInfo pageInfo = new PageInfo(list);
//        if (pageInfo != null) {
//            map.put("count", pageInfo.getTotal());
//            map.put("data", pageInfo.getList());
//        }
//        return map;
//
//    }
//
//    @RequestMapping("/queryUserById")
//    @ResponseBody
//    public Map<String, Object> queryUserById(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
//                                             @RequestParam(value = "limit", required = false, defaultValue = "5") int limit,
//                                             @RequestParam(value = "id", required = false, defaultValue = "null") Integer id
//    ) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("code", 0);
//        map.put("msg", "");
//        map.put("count", 0);
//        map.put("data", new ArrayList<User>());
//        PageHelper.startPage(page, limit);
//        list = userServiceImpl.queryUserById(id);
//        PageInfo pageInfo = new PageInfo(list);
//        if (pageInfo != null) {
//            map.put("count", pageInfo.getTotal());
//            map.put("data", pageInfo.getList());
//        }
//        return map;
//    }
//
//    @ResponseBody
//    @RequestMapping("/deleteUser")
//    public Integer queryUserById(@RequestParam(value = "id") Integer id) {
//        System.out.println(id);
//        int flag=0;
//         if (id==null){
//             return flag;
//         }else {
//             flag = userServiceImpl.deleteUser(id);
//             System.out.println("删除成功");
//             return flag;
//         }
//    }
//    @ResponseBody
//    @RequestMapping("/updateUser")
//    public Integer updateUser(@RequestBody User user) {
//        System.out.println(user);
//            int flag = userServiceImpl.updateUser(user);
//           System.out.println(flag);
//            return flag;
//    }
//
//



}