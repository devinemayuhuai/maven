<%--
  Created by IntelliJ IDEA.
  User: 马玉怀
  Date: 2021/8/16
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册页面</title>
    <link rel="stylesheet" type="text/css" href="static/layui-v2.6.8/layui/css/layui.css">
    <script type="text/javascript" src="static/layui-v2.6.8/layui/layui.js"></script>
</head>
<style type="text/css">
    #tologin{
        width: 100%;
        height: 40px;
        background-color: #c2c2c2;

    }
    #registerdiv{
        width: 800px;
        height: 550px;
        margin: auto;
        margin-top: 20px;
        border: 1px solid #c2c2c2;
        border-top: none;
    }
    #img{
        margin-left: 550px;
    }
</style>
<body>
<div id="tologin">
    <a href="<%=basepath%>/" style="line-height: 40px;margin-left: 200px;">已有账号？ <span style="color: #1E9FFF;"> 去登录</span></a>
    <a href="" style="margin-left: 1380px;"> <img src="static/img/个人中心.png" style="width: 14px;height: 14px;"> 个人中心</a>&nbsp;|
    <a href="">我的订单</a>
</div>
<div style="margin-top: 20px;">
    <div id="img" >
        <img src="static/img/书城.png" alt="">
        <h2 style="display: inline-block;margin-left: 20px;">欢迎注册</h2>
    </div>
</div>

<div id="registerdiv">
    <form action="" class="layui-form " style="margin-left: 230px;margin-top: 50px;">
        <!-- 文本框 -->
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: red;">*</span>账号</label>
            <div class="layui-input-inline">
                <input type="text" name="username" required lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" id="username" class="layui-input" style="width:250px ;">
                  <span id="checkuser" style="color: red"></span>
            </div>
        </div>

        <!-- 密码框 -->
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: red;">*</span>密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 100px;">
                  <span id="span_password" style="color: red"></span>
            </div>
        </div>

        <!-- 确认密码框 -->
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: red;">*</span>请确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="confirmpassword" required lay-verify="required|pwd" placeholder="请确认密码" autocomplete="off" class="layui-input" style="width: 100px;">
            </div>
        </div>

        <!-- 邮箱 -->
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: red;">*</span>邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email"  id="email" required lay-verify="required|email" placeholder="请填写邮箱地址" class="layui-input"style="width: 250px;">
                 <span id="span_email" style="color: red"></span>
            </div>
        </div>
        <!-- 单选框 -->
        <div class="layui-form-item">
            <label class="layui-form-label">请选择性别</label>
            <div class="layui-input-inline" id="genders">
                <input type="radio" name="gender" value="男" title="男">
                <input type="radio" name="gender" value="女" title="女" checked>
            </div>
        </div>

        <!-- 生日 -->
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-inline">
                <input type="text" name="birth" class="layui-input" id="birth"  style="width: 250px;">
            </div>
        </div>
        <!-- 验证码 -->
        <div class="layui-form-item">
            <label class="layui-form-label"><span style="color: red;">*</span>验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="verifytoken" required lay-verify="required" placeholder="请输图片验证码" id="tokencode" class="layui-input" style="width:150px ;">
                 <span id="code" style="color: red"></span>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <div style="width: 99px;height: 36px; border: solid 1px #c2c2c2; margin-left: -50px;margin-top: -9px;outline: none;box-shadow: none;">
                    <img src="kaptcha.jpg" style="width: 99px;height: 36px;border: none" id="token">
                </div>
            </div>
        </div>
        <!-- 提交按钮 -->
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="submit">立即注册</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['form','laydate','upload','jquery'],function(){
        var form=layui.form;
        var laydate=layui.laydate;
        var upload=layui.upload;
        var $=layui.jquery;

        laydate.render({
            elem:'#birth ',
            type:'date',//type属性可以提供多种选择器，year,month,date,time,datetime
            format:'yyyy-MM-dd',//自定义时间格式
            theme:'molv',//自定义主题，theme的可选值有：default（默认简约）、molv（墨绿背景）、#颜色值（自定义颜色背景）、grid（格子主题）
            calendar:true,//是否显示公历节日，国际版en不显示

        });
          $("#token").click(function (){
              this.src="kaptcha.jpg?d="+new Date();
          });
          //发送ajax请求去注册
        form.on('submit(formDemo)', function(data){
          // $("#submit").click(function (){
                //阻止默认提交

              //  alert("被点击了")
                //获取各个框中的值
                  var username= $("#username").val();
                  var password=$("#password").val();
                  var email=$("#email").val();
                  var gender=$('#genders input[name="gender"]:checked').val();
                  var birth=$("#birth").val();
                  var token=$("#tokencode").val();
                  var headimg="static/headimg/默认.jpg"
                  console.log(username+password+email+gender+birth);
                  var user={
                      id:null,
                      username:username,
                      password:password,
                      email:email,
                      birth:birth,
                      gender:gender,
                      headimg:headimg
                    };
                  var userstr=JSON.stringify(user);
                    $.ajax({
                        type:'post',
                        url:"<%=basepath%>/register?tokencode="+token+"",
                        //通过更改响应头将请求到服务器的数据以json发送
                        data:userstr,
                        contentType:'application/json',
                        success:function (suc)
                           {
                               console.log(suc);
                                 if (suc.registerState=="codeError") {
                                       $("#code").html("<p style='color: red'>*验证码不正确</p>")
                                       $("#token").trigger("click");
                                   }else if (suc.registerState=="exist"){
                                       $("#checkuser").html("<p style='color: red'>*用户名已存在</p>")
                                       $("#token").trigger("click");
                                   }else if (suc.registerState=="beanError"){
                                           //  alert(suc.email);
                                            if (suc.email!=undefined){
                                                $("#span_email").text(suc.email);
                                                $("#token").trigger("click");
                                                }else {
                                                $("#span_email").empty();
                                                      }
                                            if (suc.password!=undefined){
                                                $("#span_password").text(suc.password);
                                                $("#token").trigger("click");
                                                 }else {
                                                $("#span_password").empty();
                                                       }
                                            if (suc.username!=undefined){
                                                 $("#checkuser").text(suc.username);
                                                 $("#token").trigger("click");
                                                }else {
                                                    $("#checkuser").empty();
                                                      }
                                   }else {
                                           $("#code").empty();
                                           $("#span_email").empty();
                                           $("#span_password").empty();
                                           //校验完成去登录
                                             layer.msg("注册成功");
                                             location.href="<%=basepath%>/toregister"
                                         }
                           }
                    });

                      return false;
          });

          //发送ajax请求查看用户名是否可用
         $("#username").change(function (){
              var username=$("#username").val();
              console.log(username);
              $.ajax({
                     type:'post',
                     url:"<%=basepath%>/existusername",
                     data:{'username':username},
                     success:function (suc){
                         // console.log(suc.msg);
                         if (suc==0){
                             $("#checkuser").html("<p style='color: red'>*用户名已存在</p>")
                             $("#submit").attr("disabled",true)
                            }else{
                             $("#checkuser").html("<p style='color: darkgreen'>用户名可用</p>")
                             $("#submit").attr("disabled",false)
                               }
                     }
                    })
           });
        // 校验；两次输入密码是否一致
         form.verify({
                  pwd:function (value){
                      var pwd=$("#password").val();
                      if (pwd!=value){
                          return "两次密码输入不一致"
                      }
                      if (!new RegExp("^(?![^a-zA-Z]+$)(?!\D+$).{8,15}$").test(value)){
                          return "密码长度为8到15个，必须包括字母和数字"
                      }
                  }
               });
    });
</script>
</body>
</html>
